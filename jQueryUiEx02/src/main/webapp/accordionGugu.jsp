<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base/jquery-ui.css" />
<style type="text/css">
body {
	font-size: 80%;
}
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.accordion').accordion();
		
		$('.spinner').spinner();
		
		$('#btn').button().on('click', function() {
			$('#accordion').empty();
			let startdan = $('#start').spinner('value');
			let enddan = $('#end').spinner('value');
			let html = '';
			for(let i=startdan; i<=enddan; i++) {
				html += '<h3>' + i + '단' + '</h3>';
					html += '<div>';
					html += '<ul>';
				for(let j=1; j<=9; j++) {
					html += '<li>' + i + 'X' + j + "=" + i*j + '</li>';
				}
					html += '</ul>';
					html += '</div>';
			}
			
			$('#accordion').append(html);
			$('.accordion').accordion('refresh');
		});
	});
</script>
</head>
<body>
	<fieldset>
	<legend>구구단 출력</legend>
		<label for="start">시작단</label>
		<input type="text" id="start" value="1" readonly="readonly" class="spinner"/>
		~
		<label for="end">끝단</label>
		<input type="text" id="end" value="2" readonly="readonly" class="spinner"/>
		<button id="btn">구구단 출력</button>
	</fieldset>
	<br><br><hr><br><br>
	<div id="accordion" class="accordion"></div>
</body>
</html>
