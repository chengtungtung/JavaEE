<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- tung50.jsp與tung51.jsp在做頁面轉向 -->    
    
<%
	int lottery = (int)(Math.random()*49+1);
	
	session.setAttribute("lottery", lottery);
	pageContext.setAttribute("lottery", lottery);
	
	// 在session沒有消失前都可以在同一個web裡存活，一般使用在判斷使用者帳號權限或共享資料
	// (範圍小)pageContext -> request -> session -> application(範圍大)
	

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	${lottery }
	<hr>
	<a href="tung51.jsp">tung51</a>
	
	</body>
</html>