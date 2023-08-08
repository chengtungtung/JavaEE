<%@tag import="java.util.HashMap"%>
<%@tag import="java.sql.*"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag dynamic-attributes="product" %>

<%
	//request.setCharacterEncoding("UTF-8");
	HashMap<String, String> ptr = (HashMap<String, String>)jspContext.getAttribute("product");
	String name = ptr.get("name");
	String feature = ptr.get("feature");
	String country = ptr.get("country");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/iii", "root", "root");
	
	String sql = "INSERT INTO gift (name, feature, country) VALUES (?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, feature);
	pstmt.setString(3, country);
	pstmt.executeUpdate();
%>