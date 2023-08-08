package tw.tung.tutor;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;

// 在宣告是一個server端，觀念跟繼承和實作很像，所以要覆寫
@ServerEndpoint(value = "/myserver") // myserver是指要對外營業
public class MyServer {
	// 承接很多connect
	private static HashSet<Session> sessions;
	// 查找資料
	private static HashMap<String, Session> users;
	private static HashMap<String, String> userNames;
	
	
	
	public MyServer() {
		System.out.println("MyServer()");
		if(sessions == null) {
			sessions = new HashSet<>();
			users = new HashMap<>();
			userNames = new HashMap<>();
		}
	}

	@OnOpen // 事件觸發，有connect進來就會自動觸發，與客戶端連線建立
	public void onOpen(Session session) { // onOpen方法名稱可以自己取
		System.out.println("onOpen() : " + session.getId());
		// 閒置時間(代表可以一直保持連線的時間)
		session.setMaxIdleTimeout(2*60*1000);
		
		// 如果是一個新的客戶connect，判斷是否為新連線，如果是的話就新增
		if(sessions.add(session)) {
			users.put(session.getId(), session);
		}
		System.out.println("count : " + sessions.size());
	}

	@OnMessage // 有訊息傳進來就會觸發，當客戶端取消連線
	public void onMessage(String message, Session session) { // 第二個參數是要知道是誰傳過來
		System.out.println(session.getId() + ":" + message);
		
		// 解析json
		JSONObject root = new JSONObject(message);
		if(root.getInt("mode") == 1) {
			userNames.put(session.getId(), root.getString("user"));
		}else if(root.getInt("mode") == 2){
			String mesg = root.getString("message");
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("user", userNames.get(session.getId()));
			jsonObj.put("message", mesg);
			
			for(Session userSession :sessions) {
				try {
					userSession.getBasicRemote().sendText(jsonObj.toString());
				} catch (IOException e) {
					System.out.println(e);
				}
			}
			
		}
		
	}

	@OnClose // 與客戶端取消連線
	public void onClose(Session session) { // 參數會知道誰要關閉
		// 會觸發有兩種情況，可能閒置時間過了觸發或是客戶自己取消連線
		System.out.println("onClose() : " + session.getId());
		users.remove(session.getId());
		userNames.remove(session.getId());
		sessions.remove(session);
		System.out.println("count : " + sessions.size());
		
	}

	@OnError // 錯誤發生該怎麼處理
	public void onError(Session session, Throwable t) {
		System.out.println("onError() : " + session.getId());
		users.remove(session.getId());
		userNames.remove(session.getId());
		sessions.remove(session);
		System.out.println("count : " + sessions.size());
	}

}
