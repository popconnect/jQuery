<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css" />
<style type="text/css">
body {
	font-size: 80%;
}
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
	//버튼 이벤트
	$(document).ready(function() {
		$('#progressBar').progressbar({
			//percent
			value: 10
		});
		
		$('#btn1').button().on('click', function() {
		    var value = $('#progressBar').progressbar('value');
		    
		    if (value >= 100) {
		        alert('100 이상의 값으로 증가시킬 수 없습니다.');
		    } else {
		        value += 10;
		        $('#progressBar').progressbar('value', value);
		    }
		});

		
		$('#btn2').button().on('click', function() {
		    var value = $('#progressBar').progressbar('value');
		    
		    if (value <= 9) {
		        alert('0 보다 작은 값으로 증가시킬 수 없습니다.');
		    } else {
		        value -= 10;
		        $('#progressBar').progressbar('value', value);
		    }
		});

	});
</script>
</head>
<body>
	<div id="progressBar"></div>
	<button id="btn1">증가버튼</button>
	<button id="btn2">감소버튼</button>
</body>
</html>