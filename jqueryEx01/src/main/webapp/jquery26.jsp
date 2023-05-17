<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//innerHTML		=>html();
		//textContext	=>text();
		
		document.getElementById('btn1').onclick = function() {
			const html = document.getElementById('result');
			
			// JavaScript 방식
			console.log(html.innerHTML);
			console.log(html.textContent);
			
			// jQuery 방식
			console.log($('#result').html());
			console.log($('#result').text());
		}
		
		document.getElementById('btn2').onclick = function() {
			
			// JavaScript 방식
			const html = document.getElementById('result');
			//html.innerHTML = '<i>새로운결과</i>'
			//html.textContent = '<i>새로운결과</i>'
			
			// jQuery 방식
			//$('#result').html('<i>새로운결과</i>');
			$('#result').text('<i>새로운결과</i>');
		}
	});
</script>
</head>
<body>
<button id="btn1">내용 확인</button>
<button id="btn2">내용 수정</button>
<br /><hr /><br />
<div id="result"><b>출력내용</b></div>
</body>
</html>