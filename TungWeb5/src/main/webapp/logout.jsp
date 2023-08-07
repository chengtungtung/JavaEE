<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 會員登出方式
	// 方法一
	//session.setAttribute("lottery", null);
	// 將session值清掉
	
	// 方法二
	session.invalidate();
	response.sendRedirect("tung50.jsp");


%>