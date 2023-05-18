<%@page import="model1.UserDAO"%>
<%@page import="model1.UserTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding( "utf-8" );

	String strSeq = request.getParameter( "seq" );
	
	UserDAO dao = new UserDAO();
	UserTO list = dao.userModify(strSeq);
	
	String seq = list.getSeq();
	String name = list.getName();
	String email = list.getEmail();
	String addr = list.getAddress();
	
	StringBuilder sbXml = new StringBuilder();
	sbXml.append("<user>");
	sbXml.append("<seq>" + seq + "</seq>");
	sbXml.append("<name>" + name + "</name>");
	sbXml.append("<email>" + email + "</email>");
	sbXml.append("<address>" + addr + "</address>");
	sbXml.append("</user>");
%>

<users>
<%=sbXml %>
</users>