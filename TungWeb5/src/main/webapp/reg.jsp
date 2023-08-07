<%@page import="tw.tung.apis.BCrypt"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	const xhttp = new XMLHttpRequest();
	// 此回呼方法比較細節
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4 && xhttp.status == 200){
			//document.getElementById("here").innerHTML = xhttp.responseText;
		}
		
		// 測試	
		//console.log("==> " + xhttp.readyState)
		//if(xhttp.readyState == 4){
		//	console.log("====> " + xhttp.status)
		//}
	}
	
	// 此回呼方法比較粗略，只在意有沒有回來
	xhttp.onload = callback;
	function callback(){
		console.log("callback()")
		document.getElementById("mesg").innerHTML = xhttp.responseText;
	}
	
	function test1(){
		xhttp.open("GET", "checkRepeat.jsp");
		xhttp.send();
	}
	
	function checkAccount(){
		console.log("checkAccount()");
		let account = document.getElementById("account").value;
		xhttp.open("GET", "checkRepeat.jsp?account=" + account);
		xhttp.send();
	}
	
	// 密碼檢查
	function verifyForm() {
		return true;
	}
	
</script>

<%
	// 新增資料
	String account = request.getParameter("account");
	String passwd = request.getParameter("passwd");
	String cname = request.getParameter("cname");
	
	if(account != null && passwd != null && cname != null){
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Properties prop = new Properties();
		prop.put("user", "root");
		prop.put("password", "root");
		Class.forName("com.mysql.cj.jdbc.Driver"); // 載入驅動程式
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/iii", prop);
	
		String sql ="INSERT INTO member (account, password, cname) VALUES (?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, account);  // 避免隱碼攻擊
		pstmt.setString(2, BCrypt.hashpw(passwd, BCrypt.gensalt()));
		pstmt.setString(3, cname);
		int num = pstmt.executeUpdate();
		
		if(num > 0){
			response.sendRedirect("login.html");
		}
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<input type="button" value="Test1" onclick="test1()"><br>
		<div id="here"></div>
		<hr>
	
		<form method="post" onsubmit="return verifyForm();">
			Account : <input type="text" id="account" name="account" onblur="checkAccount()">
			<span id="mesg"></span><br>
			Password : <input type="password" name="passwd"><br>
			Realname : <input type="text" name="cname"><br>
			<input type="submit" value="Register">
		</form>
	
	</body>
</html>