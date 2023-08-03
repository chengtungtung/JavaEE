<%@page import="tw.tung.apis.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Bike b1 = new Bike();
	request.setAttribute("bike", b1);
	b1.upSpeed();b1.upSpeed();b1.upSpeed();b1.upSpeed();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Tung Company</h1>
		<hr>
		<%@ include file = "tung26.jsp" %>
		<hr>
		<jsp:include page="tung27.jsp">
			<jsp:param value="100" name="x"/>
			<jsp:param value="33" name="y"/>
		</jsp:include>
		<!-- 上面是自訂標籤 -->
		
		
	
	</body>
</html>