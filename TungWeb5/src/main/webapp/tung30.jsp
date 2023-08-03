<%@page import="tw.tung.apis.Tung19M"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	String view = String.format("%s.jsp", request.getParameter("view")) ;
	
	 
	
	if(x != null && y != null){
		Tung19M obj = new Tung19M(x, y);
		int r = obj.plus();
		
		request.setAttribute("x", x);
		request.setAttribute("y", y);
		request.setAttribute("r", r+"");
	}else{
		request.setAttribute("x", "");
		request.setAttribute("y", "");
		request.setAttribute("r", "");
	}



%>

<jsp:forward page="<%= view %>"></jsp:forward>

