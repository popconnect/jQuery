<%@page import="model1.UserTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.UserDAO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding( "utf-8" );

	UserDAO dao = new UserDAO();
	ArrayList<UserTO> lists = dao.viewList();
	
	StringBuilder sbXml = new StringBuilder();
	for( UserTO to : lists ) {
		String seq = to.getSeq();
		String name = to.getName();
		String email = to.getEmail();
		String address = to.getAddress();
		String wdate = to.getWdate();
		sbXml.append( "<user>" );
		sbXml.append( "<seq>" + seq + "</seq>" );
		sbXml.append( "<name>" + name + "</name>" );
		sbXml.append( "<email>" + email + "</email>" );
		sbXml.append( "<address>" + address + "</address>" );
		sbXml.append( "<wdate>" + wdate + "</wdate>" );
		sbXml.append( "</user>" );
	}
%>
<users>
<%=sbXml %>
</users>    