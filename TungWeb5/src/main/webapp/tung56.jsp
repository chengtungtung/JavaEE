<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tung" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<tung:test1></tung:test1><br>
		<h1><tung:test2></tung:test2></h1>
		<hr>
		<tung:test3></tung:test3>
		<hr>
		<table border="1" width="100%">
			<tr>
				<th>Name</th>
				<th>Price</th>
			</tr>
			<tung:test5 name="Item1" price="100"/>
			<tung:test5 name="Item2" price="200"/>
			<tung:test5 name="Item3" price="300"/>
			<tung:test5 name="Item4" price="400"/>
					
		</table>
		<hr>
		<tung:test4 name="abc" feature="abc" country="台中"></tung:test4>
	</body>
</html>