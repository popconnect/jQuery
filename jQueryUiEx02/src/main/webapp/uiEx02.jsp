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
	//버튼 이벤트
	$(document).ready(function() {
		$('#btn1').button().on('click', function() {
			alert('버튼1 클릭');
		});
		$('#btn2').button().on('click', function() {
			alert('버튼2 클릭');
		});
	});
</script>
</head>
<body>
<button id='btn1'>버튼 4</button><br><br>
<div id="btn2">버튼 5</div>
</body>
</html>