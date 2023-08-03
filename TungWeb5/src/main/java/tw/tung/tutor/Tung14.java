package tw.tung.tutor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.tung.apis.Bike;

@WebServlet("/Tung14")
public class Tung14 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//		RequestDispatcher dis = request.getRequestDispatcher("tung13.html");
		RequestDispatcher dis = request.getRequestDispatcher("Tung15");  // Tung15?x=10 也可以這樣做，但意義不大
		
		Bike b1 = new Bike("Tung");
		request.setAttribute("b1", b1);
		b1.upSpeed();b1.upSpeed();b1.upSpeed();b1.upSpeed();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>Tung</h1>");
		out.println("<hr>");
		dis.include(request, response);
		out.println("<hr>");
		out.println("Copyleft....");
		
	}

}
