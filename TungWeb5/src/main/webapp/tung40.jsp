<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String method = request.getMethod();
			ServletRequest st = pageContext.getRequest();
			if(request == st){
				out.print("OK<br>");				
			}
			
			if(st instanceof HttpServletRequest){
				out.print("I am");
			}
		%>
	
	</body>
</html>