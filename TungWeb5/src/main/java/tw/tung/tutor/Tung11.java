package tw.tung.tutor;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Tung11")
public class Tung11 extends HttpServlet {
	
	// 建構式在做物件初始化，只做一次
    public Tung11() {
       System.out.println("Tung11()"); 
    }

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service(1)");  // 到此一遊要在super之前，不然會先被帶走
		System.out.println(req.getMethod());
		
		// 這裡可以直接寫doget()、dopost()要做的事
//		if(req.getMethod().equals("GET")) {
//			
//		}else if(req.getMethod().equals("POST")) {
//			
//		}
		
		super.service(req, resp);  // 已經有request和response，再區分doget或dopost
	}


	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		System.out.println("service(1)");
		super.service(req, res);
	}


	@Override
	public void init() throws ServletException {
		System.out.println("init()");
		super.init();
	}

	
	// 取得一次性組態檔，只做一次
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init(ServletConfig config)");
		super.init(config); // 會去叫init()
	}
	// 可以取得ServletConfig物件


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
	}

}
