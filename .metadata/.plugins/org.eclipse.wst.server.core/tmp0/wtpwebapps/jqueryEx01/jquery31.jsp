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
			//console.log(document.frm.data.value);
			console.log($('#data').val());
		}
		document.getElementById('btn2').onclick = function() {
			$('#data').val('새로운 데이터');
		}

	});
</script>
</head>
<body>
	<button id='btn1'>속성내용</button>
	<button id='btn2'>속성내용</button>

	<br>
	<hr>
	<br>
	<form name="frm">
	데이터 <input type="text" name="data" id="data" />
	</form>
</body>
</html>