<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.lang.ClassNotFoundException"%>
<%@ page language="java" contentType="text/plane; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/yourDataSourceName");
		conn = ds.getConnection();
	
		
		String query = "SELECT name, publisher, author, price FROM books";
        pstmt = conn.prepareStatement(query);
        
        // 쿼리 실행
        rs = pstmt.executeQuery();
        
        // 결과 처리
        StringBuilder xmlBuilder = new StringBuilder();
        xmlBuilder.append("<books>");
        while (rs.next()) {
            String name = rs.getString("name");
            String publisher = rs.getString("publisher");
            String author = rs.getString("author");
            int price = rs.getInt("price");

            xmlBuilder.append("<book>");
            xmlBuilder.append("<name>").append(name).append("</name>");
            xmlBuilder.append("<publisher>").append(publisher).append("</publisher>");
            xmlBuilder.append("<author>").append(author).append("</author>");
            xmlBuilder.append("<price>").append(price).append("</price>");
            xmlBuilder.append("</book>");
        }
        xmlBuilder.append("</books>");
        
        // XML 출력
        out.println(xmlBuilder.toString());
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 리소스 정리
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

