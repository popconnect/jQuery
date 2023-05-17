<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="model1.BoardTO"%>
<%@page import="model1.BoardDAO"%>

<%@page import="java.util.ArrayList"%>
	
<%

	request.setCharacterEncoding( "utf-8" );
	
	String searchKey = "";
	if( request.getParameter( "searchKey" ) != null && !request.getParameter( "searchKey" ).equals( "" ) ) {
		searchKey = request.getParameter( "searchKey" );
	}
	
	String searchWord = "";
	if( request.getParameter( "searchWord" ) != null && !request.getParameter( "searchWord" ).equals( "" ) ) {
		searchWord = request.getParameter( "searchWord" );
	}
	
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardTO> datas = dao.boardList( searchKey, searchWord );

	int totalRecord = datas.size();
	
	StringBuilder sbHtml = new StringBuilder();

		for ( BoardTO to : datas ) {
			
			String seq = to.getSeq();
			//String subject = to.getSubject().replaceAll( searchWord, "<font color='red'>" + searchWord + "</font>");
			String subject = to.getSubject().replaceAll(searchWord, "<span style='color: black; font-weight: bold;'>" + searchWord + "</span>");
			String writer = to.getWriter();
			String wdate = to.getWdate();
			String hit = to.getHit();
			int wgap = to.getWgap();
						
			sbHtml.append( "<tr>" );
			sbHtml.append( "<td>&nbsp;</td>" );
			sbHtml.append( "<td>" + seq + "</td>" );
			sbHtml.append( "<td class='left'>" );
			sbHtml.append( "<a href='board_view1.jsp?searchKey=" + searchKey + "&searchWord=" + searchWord + "&seq=" + seq + "'>" + subject + "</a>" );
			
			if( wgap == 0 ) {
				sbHtml.append( "&nbsp;<img src='../../images/icon_new.gif' alt='NEW'>" );
			}
			sbHtml.append( "</td>" );
				
			sbHtml.append( "<td>" + writer + "</td>" );
			sbHtml.append( "<td>" + wdate + "</td>" );
			sbHtml.append( "<td>" + hit + "</td>" );
			sbHtml.append( "<td>&nbsp;</td>" );
			sbHtml.append( "</tr>" );
		}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
	<h3>게시판</h3>
	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
	<div class="contents_sub">
		<!-- 검색 시작 -->
		<form action="board_list1.jsp" method="post" name="sfrm">
			<div class="board_top">
				<div class="bold">총 <span class="txt_orange">1</span>건</div>
				<div class="f_search">
					<select name="searchKey">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">이름</option>
					</select>
					<input type="text" name="searchWord" value="" class="board_view_input_mail" />
					<input type='submit' value="검색" class="btn_write btn_txt01" />
				</div>
			</div>
		</form>
		<!-- 검색 끝 -->
		
		<!--게시판-->
		<div class="board">
			<table>
			<tr>
				<th width="3%">&nbsp;</th>
				<th width="5%">번호</th>
				<th>제목</th>
				<th width="10%">글쓴이</th>
				<th width="17%">등록일</th>
				<th width="5%">조회</th>
				<th width="3%">&nbsp;</th>
			</tr>
<!-- 내용 시작 -->
<%= sbHtml %>
<!-- 내용 끝 -->
			</table>
		</div>
		
		<div class="btn_area">
			<div class="align_right">
				<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp?searchKey=<%=searchKey %>&searchWord=<%=searchWord %>'" />
			</div>
		</div>
		<!--//게시판-->
	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>