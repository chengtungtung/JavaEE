 <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	//out.print((int)(Math.random()*49+1));
	request.setCharacterEncoding("UTF-8");
	String account = request.getParameter("account");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/iii", "root", "root");
	
	String sql = "SELECT * FROM member WHERE account = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, account);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		// 帳號存在
		out.print("Account already EXIST!");
	}else{
		// 帳號不存在
		out.print("Pass");
	}

%>