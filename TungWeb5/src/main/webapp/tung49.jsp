<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 將農委會的json資料抓下來解析，並上傳到資料庫 -->
<!-- 為了簡化抓網頁程式碼的部分，將JDBC04的getData()方法做簡化，簡化成底下一個import標籤直接解決 -->
<!-- 可回顧JDBC04做複習 -->

<c:import
	var="data" 
	url="https://data.moa.gov.tw/Service/OpenData/ODwsv/ODwsvAgriculturalProduce.aspx">
</c:import>
<!-- 相當於JDBC04的getData()方法，就是把網頁程式碼抓下來 -->
<!-- ${data } 可以全印出來做確認 -->

<%	
	// 將抓下來的網頁程式碼是object轉成string，放進變數json
	String json = (String)pageContext.getAttribute("data");
	
	// 跟sql做連線
	Class.forName("com.mysql.cj.jdbc.Driver");
	Properties prop = new Properties();
	prop.put("user", "root");
	prop.put("password", "root");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/iii", prop);
	
	String sql ="INSERT INTO gift (name, feature, country) VALUES (?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 檔案一開始是陣列，用陣列解析
	JSONArray root = new JSONArray(json);
	for(int i=0 ; i < root.length(); i++){
		JSONObject row = root.getJSONObject(i); // 一個一個物件，[]裡的{}是一整個物件
		// out.print(row.getString("Name") + "<br>"); 
		pstmt.setString(1, row.getString("Name")); // 在java.sql裡的index值都是從1開始
		pstmt.setString(2, row.getString("Feature"));
		pstmt.setString(3, row.getString("County"));
		pstmt.executeUpdate();
		
	}
	
	out.print("Finish"); // 確認是否有上傳到資料庫
	
%>