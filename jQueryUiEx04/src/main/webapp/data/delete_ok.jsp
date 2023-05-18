<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="model1.UserDAO"%>
<%@page import="model1.UserTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding( "utf-8" );

	String strSeq = request.getParameter("seq");
	String strPassword = request.getParameter("password");
	UserTO to = new UserTO();
	to.setSeq(strSeq);
	to.setPassword(strPassword);
	
	UserDAO dao = new UserDAO();
	int flag = dao.userDelete_Ok(to);
%>
<users>
	<flag><%=flag %></flag>
</users>