<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btn').click(function() {
			let startdan = parseInt($('#startdan').val());
			let enddan = parseInt($('#enddan').val());

			
			let html = '';
			
			for (let i = startdan; i <= enddan; i++) {
				html += '<tr>';
				for (let j = 1; j <= 9; j++) {
					html += '<td>' + i + ' x ' + j + ' = ' + (i * j) + '</td>';
				}
				html += '</tr>';
			}
			
			$('#result').html('<table border="1">' + html + '</table>');
		});
	});
</script>
</head>
<body>
시작단<input type='text' id='startdan' /> 
~
끝단<input type='text' id='enddan' /> 
<button id='btn'>구구단 출력</button> 
<br><hr><br>
<div id='result'></div>
</body>
</html>
