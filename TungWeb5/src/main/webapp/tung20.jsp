<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		Hello, World 1
		<hr>
		<%
			out.println("Hello, World 2");
		%>
		<!-- 當成一組標籤語法，%裡面就是寫後端 -->
		<!-- out是隱含物件 -->
		<hr>
		<%
			int lottery = (int)(Math.random()*49+1);
			out.println(lottery);
		%>
		<hr>
		<%
			out.println(lottery);
		    //全域變數都認識
		%>
		<hr>
		<%= lottery %>
		
		
	</body>
	
</html>