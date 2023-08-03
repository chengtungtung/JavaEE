package tw.tung.tutor;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Tung10")
@MultipartConfig(location = "C:\\Users\\User\\eclipse-workspace\\TungWeb5\\src\\main\\webapp\\upload")
// 讓tomcat
// 錯誤出現500，通常是邏輯問題
public class Tung10 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String account = request.getParameter("account");
		System.out.println(account);
		String ip = request.getRemoteAddr(); // 取得對方ip
		int i = 0; // 流水碼

		Collection<Part> parts = request.getParts();
		// 可跌代就可以尋訪
		for (Part part : parts) {
			System.out.println("屬性name的值: " + part.getName()); // 取得屬性name的值
			System.out.println("檔案的類型: " + part.getContentType());
			System.out.println("檔案長度: " + part.getSize()); // 長度
			System.out.println("檔案的名稱: " + part.getSubmittedFileName());
			

			if (part.getContentType() != null && part.getSize() > 0) {
				part.write(getUploadName(ip, part.getSubmittedFileName(), i++)); // 這行才會寫入，才會存入
//				System.out.println("傳進來的檔案修改為=>  " + getUploadName(ip, part.getSubmittedFileName(), i++));
				System.out.println("------------------------");
			}
		}
	}

	private String getUploadName(String ip, String sname, int index) {
		ip = ip.replace(':', '_');
		String[] snames = sname.split("\\."); /// xxx.jpg , aaa.bbb.png , ccc
		String subname = "";
		if (snames.length > 1) { // 沒有副檔名的判斷
			subname = "." + snames[snames.length - 1];
		} else {

		}
		return ip + "_" + index + subname;
	}

}
