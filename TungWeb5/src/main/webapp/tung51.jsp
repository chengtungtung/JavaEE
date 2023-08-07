<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj = session.getAttribute("lottery");
	if(obj == null) {
		response.sendRedirect("tung50.jsp"); // 轉向別的頁面
		//response.sendError(HttpServletResponse.SC_NOT_FOUND); // 顯示404
	}else {
		int lottery = (Integer)session.getAttribute("lottery");
		pageContext.setAttribute("lottery", lottery);	
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	I am tung51<hr>
	${lottery } 
	<hr>
	<a href="logout.jsp">logout</a>
	
	</body>
</html>