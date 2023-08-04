<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String[] names = {"Brad", "Tung", "Peter", "Amy"};
	pageContext.setAttribute("names", names);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
		<table border="1" width="100%">
			<tr>
				<th>Index</th>
				<th>Name</th>
				<th>Count</th>
				<th>First</th>
				<th>Last</th>
			</tr>
			<c:forEach items="${names }" var="name" varStatus="status">
				<tr>
					<td style="text-align: center">${status.index }</td>
					<td style="text-align: center">${name }</td>
					<td style="text-align: center">${status.count }</td>
					<td style="text-align: center">${status.first }</td>
					<td style="text-align: center">${status.last }</td>
				</tr>
			</c:forEach>
		</table>
		
	</body>
</html>