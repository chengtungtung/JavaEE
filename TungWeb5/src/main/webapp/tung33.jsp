<%@page import="tw.tung.apis.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 在網頁做出物件(方法一) -->
<%
	Member member1 = new Member(1, "tung", "Tung", "1999-10-10");
%>

<!-- 在網頁做出物件(方法二) -->
<jsp:useBean id="member2" class="tw.tung.apis.Member"></jsp:useBean>
<!-- id值代表變數，class代表從哪個類別 -->
<!-- 必須要有預設無傳參數建構式 -->
<jsp:setProperty property="id" name="member2" value="2"/>
<jsp:setProperty property="account" name="member2" value="amy"/>
<jsp:setProperty property="realname" name="member2" value="Amy"/>
<jsp:setProperty property="birthday" name="member2" value="1999-02-03"/>
<!-- property值代表要設定哪個屬性，name代表針對哪個變數，value代表屬性要填的值 -->
<!-- 
JavaBeans是Java中一種特殊的類，可以將多個對象封裝到一個對象（bean）中。(一個類別產生多個物件實體)
特點是可序列化，提供無參建構式，提供getter方法和setter方法訪問對象的屬性。
名稱中的「Bean」是用於Java的可重用軟體組件的慣用叫法。

規範如下：
1. 有一個public的無參數建構子。
2. 屬性可以透過get、set、is（可替代get，用在布林型屬性上）方法或遵循特定命名規則的其他方法存取。
3. 可序列化。(新版的不用序列化)
 -->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		Member1 :
		<%= member1.getId() %> : <%= member1.getAccount() %>
		<hr>
		Member2 :
		<%= member2.getId() %> : <%= member2.getAccount() %>		
		<hr>
		Member2 :
		<jsp:getProperty property="id" name="member2"/> :
		<jsp:getProperty property="account" name="member2"/>
		<hr>
		<!--
		Member1 :
		<jsp:getProperty property="id" name="member1"/> :
		<jsp:getProperty property="account" name="member1"/>
		 以上方法會看不到，裡面如果有%標籤還是會執行
		  -->
		
	
	
	</body>
</html>