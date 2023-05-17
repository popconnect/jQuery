<%@page import="model1.ZipcodeTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.ZipcodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding( "utf-8" );

	String strSido = request.getParameter( "sido" );
	String strGugun = request.getParameter( "gugun" );
	String strDong = request.getParameter( "dong" );
	ZipcodeDAO dao = new ZipcodeDAO();
	ArrayList<ZipcodeTO> lists = dao.zipcodeList(strSido, strGugun, strDong);
	
	StringBuilder sbXml = new StringBuilder();
	for( ZipcodeTO to : lists ) {
		String zipcode = to.getZipcode();
		String sido = to.getSido();
		String gugun = to.getGugun();
		String dong = to.getDong();
		String ri = to.getRi();
		String bunji = to.getBunji();
		
		sbXml.append( "<list>" + zipcode + sido + gugun + dong + ri + bunji + "</list>" );
	}
%>
<address>
<%=sbXml %>
</address>    