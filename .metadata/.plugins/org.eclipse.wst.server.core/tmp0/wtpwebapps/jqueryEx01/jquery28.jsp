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
		document.getElementById('btn1').onclick = function() {
			//$('태그') - selector
			//$('html 내용') - 생성
			
			//appendTO / rependTo / insertAfter / insertBefore
			$('<i> Hello jQuery</i>').prependTo('#result');
		}
	});
</script>
</head>
<body>
<button id='btn1'>내용확인</button>
<br><hr><br>
<div id = 'result'><b>출력내용 1</b></div>
</body>
</html>