<%@ page language="java" contentType="text/plane; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>

<%
	JSONArray arr = new JSONArray();
	for( int i = 1; i<=3; i++) {
		JSONObject obj = new JSONObject();
		obj.put("name", "책이름 "+i);
		obj.put("publisher", "출판사 "+i);
		obj.put("author", "저자 "+i);
		obj.put("price", "가격 "+i);
		
		arr.add(obj);
	}
	out.print(arr);
%>