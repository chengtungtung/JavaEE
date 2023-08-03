<%@page import="tw.tung.apis.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String account=request.getAttribute("account");

	Member member1 = new Member(4, "tony", "Tony", "1999-08-09");
	request.setAttribute("member1", member1);
%>    
<jsp:useBean id="member" class="tw.tung.apis.Member"></jsp:useBean>
<jsp:setProperty property="id" name="member" value="3"/>
<jsp:setProperty property="account" name="member" value="${param.account }"/>
<jsp:setProperty property="realname" name="member" value="${param.realname }"/>
<jsp:setProperty property="birthday" name="member" value="${param.birthday }"/> 
<!-- ${param.account}的概念跟String account = request.getAttribute("account")一樣，${}只會有值 --> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		Member :<br>
		<jsp:getProperty property="id" name="member"/> :<br>
		<jsp:getProperty property="account" name="member"/><br>
		<jsp:getProperty property="realname" name="member"/><br>
		<jsp:getProperty property="birthday" name="member"/><br>
		<hr>
		Member :<br>
		${member.id }<br>
		${member.account }<br>
		${member.realname }<br>
		${member.birthday }<br>
		<!-- 不能寫在%裡面，且會直接寫在網頁裡面，只能寫在物件裡面 -->
		<hr>
		Member :<br>
		${member1.id }<br>
		${member1.account }<br>
		${member1.realname }<br>
		${member1.birthday }<br>
		<!-- java原生物件也可以使用${}，但要先setAttribute -->
		
		
		
	
	</body>
</html>