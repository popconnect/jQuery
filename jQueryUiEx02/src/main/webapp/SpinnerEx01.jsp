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
		$('#start').spinner({
			min: 1,
			max: 9,
			step: 1,
			spin: function() {
				//console.log( $(this).spinner('value'));
			},
			change: function(event, ui) {
				let startdan = $(this).spinner('value');
				let enddan = $('#end').spinner('value');
				if (startdan > enddan) {
					$('#end').spinner('value', startdan);
				}
			},
			stop: function(event, ui) {
				let startdan = $(this).spinner('value');
				let enddan = $('#end').spinner('value');
				if (startdan > enddan) {
					$('#end').spinner('value', startdan);
				}
			}
		});
		
		$('#end').spinner({
			min: 1,
			max: 9,
			step: 1,
			spin: function() {
				//console.log( $(this).spinner('value'));
			},
			change: function(event, ui) {
				let startdan = $('#start').spinner('value');
				let enddan = $(this).spinner('value');
				if (enddan < startdan) {
					$('#start').spinner('value', enddan);
				}
			},
			stop: function(event, ui) {
				let startdan = $('#start').spinner('value');
				let enddan = $(this).spinner('value');
				if (enddan < startdan) {
					$('#start').spinner('value', enddan);
				}
			}
		});
		
		$('#btn').button().on('click', function() {
			//console.log( $('#spinner').spinner('value'));
			let startdan = $('#start').spinner('value');
			let enddan = $('#end').spinner('value');
			let html = "<table border='1'>"
			for(let i=startdan; i<=enddan; i++) {
				html += "<tr>"
				for(let j=1; j<=9; j++) {
					html += "<td>" + i + " X " + j + " = " + i*j + "</td>"
				}
				html += "</tr>"
			}
			html += "</table>"
			$('#result').html(html);
		})
	});
</script>
</head>
<body>
	<fieldset>
	<legend>구구단 출력</legend>
		<label for="start">시작단</label>
		<input type="text" id="start" value="1" readonly="readonly"/>
		~
		<label for="end">끝단</label>
		<input type="text" id="end" value="2" readonly="readonly"/>
		<button id="btn">구구단 출력</button>
	</fieldset>
	<br><br><hr><br><br>
	<div id="result"></div>

</body>
</html>