<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String[] var1 ={"Tung", "OK", "III"};
	 pageContext.setAttribute("var1", var1);
	// 只要放在Attribute裡面，就有EL
	
	String[] var2 ={"Tung2", "OK2", "III2"};
	// request.setAttribute("var2", var2);
	 request.setAttribute("var1", var2);
	
	String[] var3 ={"Tung3", "OK3", "III3"};
	session.setAttribute("var1", var3);
	
	String[] var4 ={"Tung4", "OK4", "III4"};
	application.setAttribute("var1", var4);
	
	// (範圍小)pageContext -> request -> session -> application(範圍大)
	// Attribute名稱一樣的狀況下，會取用範圍小的
	
	LinkedList<String> list = new LinkedList<>();
	list.add("Tung5");list.add("OK5");list.add("III5");
	pageContext.setAttribute("list", list);
	
	HashMap<String,String> map = new HashMap<>();
	map.put("k1", "v1");map.put("k2", "v2");map.put("k3", "v3");
	pageContext.setAttribute("map", map);
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		var1[0] : ${var1[0] } <br>
		var1[0] : ${pageScope.var1[0] } <br>
		var1[0] : ${requestScope.var1[0] } <br>
		var1[0] : ${sessionScope.var1[0] } <br>
		var1[0] : ${applicationScope.var1[0] } <br>
		var2[1] : ${var2[1] } <br>
		<hr>
		list.get(0) : ${list[0] }<br>
		list.get(i) : ${list[param.i] }<br>
		<hr>
		map.get("k1") : ${map["k1"] }<br>
		map.get("k2") : ${map.k2 }<br>
		<!-- map擁有k2，所以可以直接叫 -->
		<hr>
		${10 + 3 }<br>
		${param.x + param.y }<br>
		${param.x == param.y }<br>
		
	</body>
</html>