<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!-- uri是去找雲端的定義檔 -->
<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost/iii"
	user="root"
	password="root"
/>
<sql:query var="rs">
	SELECT *FROM foods
</sql:query>

<c:set var="rpp">10</c:set>
<c:set var="nextPage">${param.Page }</c:set>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		 <a href="tung48.jsp?Page=${nextPage-1 }">上頁</a> | <a href="tung48.jsp?Page=${nextPage+1 }">下頁</a>
		 <hr>
		 <table border="1" width="100%">
		 	<tr>
		 		<th>#</th>
		 		<th>Name</th>
		 		
		 	</tr>
		 	<c:forEach items="${rs.rows }" var="row" varStatus="status">
		 			<c:choose>
		 				<c:when test="${row.id > rpp*nextPage && row.id <= rpp*(nextPage+1) }">
		 			    
		 				<tr>
		 					<td>${row.id }</td>
		 					<td>${row.name }</td>
		 				</tr>
		 				
		 				</c:when>
		 			</c:choose>
		 		
		 	</c:forEach>
		 
		 </table>
			
		
	
	</body>
</html>