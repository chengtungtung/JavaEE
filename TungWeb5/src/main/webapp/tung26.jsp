<%@page import="tw.tung.apis.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String x = request.getParameter("x");
 Bike b2 = (Bike)request.getAttribute("bike");
 //這裡會有重複變數問題，要注意，因為tung26是包在tung25裡面，所以tung25已經有變數b1
%>

I am tung26<br>
<%= x %><br>
<%= b2 %><br>