<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tw.tung.apis.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- http://java.sun.com/jsp/jstl/core為核心庫，prefix為前置碼 -->
<%
	// pageContext.setAttribute("x", 10);
%>
<c:set var="x" value="10"></c:set>
<!-- 上面這行相當於第6行 -->
<c:set var="x" value="100" scope="request"></c:set>
<!-- scope="request"是設定範圍為request -->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		x = ${x }<br>
		x = ${requestScope.x }<br>
		<hr>
		Hello, World<br>
		<%= "Hello, World" %><br>
		<c:out value="Hello, World"></c:out><br>
		x = <c:out value="${x }"></c:out><br>
		i = <c:out value="${param.i }" default="no value" />
		<hr>
		<jsp:useBean id="member" class="tw.tung.apis.Member"></jsp:useBean>
		<jsp:setProperty property="id" name="member" value="3"/>
		<jsp:setProperty property="account" name="member" value="tung"/>
		<jsp:setProperty property="realname" name="member" value="Tung"/>
		<jsp:setProperty property="birthday" name="member" value="1999-02-03"/>
		<!-- 上方相當於c:set -->
		
		${member.id } : ${member.account }<br>
		${member }
		<hr>
		<c:remove var="member"/>
		${member }
		<hr>
		<c:set var="tung">${TungUtils.createMember() }</c:set>
		${tung }
		
			
	</body>
</html>