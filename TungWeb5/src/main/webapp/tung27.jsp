<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String x = request.getParameter("x");
	String y = request.getParameter("y");
%>

I am tung27
<hr>
<%
	out.println("x = " + x +"<br>");
	out.println("y = " + y);
%>