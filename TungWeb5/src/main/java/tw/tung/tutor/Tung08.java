package tw.tung.tutor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Tung08")
public class Tung08 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get的傳遞方式透過URL
		// method="get"是傳來這裡
		request.setCharacterEncoding("UTF-8"); // 進來utf-8
		String account = request.getParameter("account");
		String passwd = request.getParameter("passwd");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobby");

		System.out.println(account + ":" + passwd + ":" + gender);
		if (hobbies != null) {
			for (String hobby : hobbies) {
				System.out.println(hobby);
			}
		}

		response.setContentType("text/html; charset =UTF-8"); // 出去utf-8
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// post的傳遞方式透過body內容
		// method="post"是傳來這裡
		doGet(request, response);

//		System.out.println("dopost");
//		request.setCharacterEncoding("UTF-8"); // 進來utf-8
//		String account = request.getParameter("account");
//		String passwd = request.getParameter("passwd");
//		
//		System.out.println(account + ":" + passwd);
//		
//		response.setContentType("text/html; charset =UTF-8");
	}

}
