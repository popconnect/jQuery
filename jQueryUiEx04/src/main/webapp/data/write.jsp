<%@page import="model1.UserTO"%>
<%@page import="model1.UserDAO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding( "utf-8" );

	String strName = request.getParameter( "name" );
	String strPassword = request.getParameter( "password" );
	String strAddr = request.getParameter( "address" );
	String strEmail = request.getParameter( "email" );
	
	UserTO to = new UserTO();
	to.setName(strName);
	to.setPassword(strPassword);
	to.setAddress(strAddr);
	to.setEmail(strEmail);
	
	UserDAO dao = new UserDAO();
	int flag = dao.userWrite(to);
	
%>

<users>
	<flag><%=flag %></flag>
</users>