package tw.tung.tutor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.tung.apis.Tung19M;

@WebServlet("/Tung18C")
public class Tung18C extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 1. 接收參數
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		
		if(x != null && y != null) {  // 判斷使用者輸入的值是否為null

			// 2. 演算法 
			try {
				// 透過類別Tung19M 做計算再得到值 
				Tung19M model = new Tung19M(x, y);
				int result = model.plus(); // 呼叫static方法，得到值放進整數變數result
				
				// 讓request加上以下屬性，為了丟給Tung20V
				// 也可以簡化成直接丟物件Tung19M給Tung20V
				request.setAttribute("x", x);
				request.setAttribute("y", y);
				request.setAttribute("result", result+"");
				request.setAttribute("view", "view2");
				
				// 3. 呈現 View
				RequestDispatcher dispatcher = request.getRequestDispatcher("Tung20V");
				dispatcher.forward(request, response);
				
			} catch (Exception e) {
				System.out.println(e);
	
			}
			
		}else {
			request.setAttribute("x", "");
			request.setAttribute("y", "");
			request.setAttribute("result", "");
			request.setAttribute("view", "view1");
			
			// 3. 呈現 View
			RequestDispatcher dispatcher = request.getRequestDispatcher("Tung20V");
			dispatcher.forward(request, response);
		}
		


	}

}
