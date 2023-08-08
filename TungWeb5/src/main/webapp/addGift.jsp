<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	Object member = session.getAttribute("member");
	if(member == null){
		response.sendRedirect("login.html");
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js" ></script>
		<script type="text/javascript">
			function add() {
				// $.get要接收兩個參數
				// $.get(url的參數,回呼的參數)
				$.get("addNewGift.jsp?"+
						"name=" + $('#name').val() +
						"&feature=" + $('#feature').val() +
						"&country=" + $('#country').val() ,
						function(data, status){
							if(status == 'success'){
								console.log(data);
								console.log(data.trim());
								// trim()的作用是要去除字串頭尾的空格
								if(data.trim() == 'OK'){
								// 轉向到main.jsp
								location.href = "main.jsp";
								}
							}
				});
			}
		</script>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form>
			Name : <input type="text" id="name"><br>
			Feature : <input type="text" id="feature"><br>
			Country : <input type="text" id="country"><br>
			<input type="button" value="Add" onclick="add()"><br>
		</form>
	</body>
</html>