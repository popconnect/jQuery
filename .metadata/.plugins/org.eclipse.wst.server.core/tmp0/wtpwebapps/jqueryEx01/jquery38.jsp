<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		//$('#btn1').on('click mouseover mouseleave', function() {
		//	console.log('btn1 Mouse Event');
		//});
		/* $('#btn1').on({
			
		});
		
		$('#btn2').on('click', function() {
			alert('btn2 클릭');
		});
		$('#btn3').on('click', function() {
			alert('btn3 클릭');
		}); */
		
		$('button').on('click', function() {
			alert('button 클릭' + $(this).attr('id'));
		});
	});
</script>
</head>
<body>

<button id="btn1">버튼1</button><br><br>
<button id="btn2">버튼2</button><br><br>
<button id="btn3">버튼3</button><br><br>

</body>
</html>