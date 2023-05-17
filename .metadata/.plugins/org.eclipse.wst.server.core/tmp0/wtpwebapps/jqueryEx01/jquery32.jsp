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
			$('input:checkbox:checked').each(function() {
				console.log($(this).val())
				
			})
		}
		document.getElementById('btn2').onclick = function() {
			console.log('select :', $('#sel option:selected').val())
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
	<input type="checkbox" id="ch1" name="ch" value="사과">사과<br />
	<input type="checkbox" id="ch1" name="ch" value="수박">수박<br />
	<input type="checkbox" id="ch1" name="ch" value="딸기">딸기<br />
	<input type="checkbox" id="ch1" name="ch" value="참외">참외<br />
	<br>
	<select id="sel">
		<option value="사과">사과</option>
		<option value="수박">수박</option>
		<option value="딸기">딸기</option>
		<option value="참외">참외</option>
	</select>
	
	</form>
</body>
</html>