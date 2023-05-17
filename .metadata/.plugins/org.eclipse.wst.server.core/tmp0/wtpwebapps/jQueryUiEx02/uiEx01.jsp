<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base/jquery-ui.css" />
<style type="text/css">
	body { font-size : 80%; }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		console.log("Hello jQuery-UI");
		
		$('#btn1').button();
		$('input[type="button"]').button();
		$('a').button();
		$('#btn2').button();
	});
</script>
</head>
<body>
<input type="button" value="버튼 1" /> <br><br>
<input type="submit" value="버튼 2" /> <br><br>
<button>버튼 3</button><br><br>
<button id='btn1'>버튼 4</button><br><br>
<a href="http://www.daum.net" >다음 바로가기</a><br><br>
<div id="btn2">버튼 5</div>
</body>
</html>