package tw.tung.tutor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.tung.apis.TungUtils;

@WebServlet("/Tung20V")
public class Tung20V extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 將參數傳進來
		String x = (String) request.getAttribute("x");
		String y = (String) request.getAttribute("y");
		String  result = (String) request.getAttribute("result");
		String view = (String) request.getAttribute("view");

		// load views/view1.html => String
		// 另外做一個static類別，需要時就呼叫，維護性比較高
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			String content = TungUtils.loadView(view);
			out.printf(content, x, y, result);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
