<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   StringBuilder sbHtml = new StringBuilder();
   JSONArray jsonArray = new JSONArray();
   
   try {
       Context initContext = new InitialContext();
       Context envContext = (Context) initContext.lookup("java:/comp/env");
       DataSource ds = (DataSource) envContext.lookup("jdbc/mariadb1");
       conn = ds.getConnection();

   
      String sql = "select * from books";
      pstmt = conn.prepareStatement(sql);
   
      rs = pstmt.executeQuery();
   
      while (rs.next()) {
         JSONObject obj = new JSONObject();
         obj.put("name", rs.getString("name"));
         obj.put("publisher", rs.getString("publisher"));
         obj.put("author", rs.getString("author"));
         obj.put("price", rs.getString("price") + "원");
   
         jsonArray.add(obj);
      }
   
   } catch (Exception e) {
      System.out.println("[에러] " + e.getMessage());
   } finally {
      if (rs != null)rs.close();
      if (pstmt != null)pstmt.close();
      if (conn != null)conn.close();
   }
   out.println(jsonArray);
%>