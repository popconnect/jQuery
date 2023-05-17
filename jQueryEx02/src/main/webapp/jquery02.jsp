<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.c {color: red;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('button').on('click', function() {
			$.ajax({
				url: './Data/xml1.jsp',
				type: 'get',
				//dataType: 'json',
				success: function(xmlData) {
					let html = '<table>';
					$(xmlData).find('book').each(function() {
						html += '<tr>';
						html += '<td>' + $(this).find('name').text() + '</td>';
						html += '<td>' + $(this).find('publisher').text() + '</td>';
						html += '<td>' + $(this).find('author').text() + '</td>';
						html += '<td>' + $(this).find('price').text() + '</td>';
						html += '</tr>';
					});
					
					html += '</table>';
					$('#result').html(html);
				},
				error: function(err) {
					console.log('실패', err.status);
				}
			});
		});
	});
</script>
</head>
<body>

<button id="btn1">요청</button>
<br><hr><br>
<div id="result"></div>
</body>
</html>
