<%@page import="model1.UserDAO"%>
<%@page import="model1.UserTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding( "utf-8" );

	String strSeq = request.getParameter("seq");
	String strName = request.getParameter( "name" );
	String strPassword = request.getParameter( "password" );
	String strAddr = request.getParameter( "address" );
	String strEmail = request.getParameter( "email" );
	
	
	
	UserTO to = new UserTO();
	to.setSeq(strSeq);
	to.setName(strName);
	to.setPassword(strPassword);
	to.setAddress(strAddr);
	to.setEmail(strEmail);
	
	UserDAO dao = new UserDAO();
	int flag = dao.Modify_ok(to);
	
%>
<users>
	<flag><%=flag %></flag>
</users>