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
		$('#btn1').on({
			'click': function() {
				console.log('Click Event');
			},
			'mouseover': function() {
				console.log('Over Event');
			},
			'mouseleave': function() {
				console.log('Leave Event');
			}
		});
		
		$('#btn2').on('click', function() {
			alert('btn2 클릭');
		});
		$('#btn3').on('click', function() {
			alert('btn3 클릭');
		});
	});
</script>
</head>
<body>
<input type="button" id="btn1" value="버튼 1" /><br><br>
<button id="btn2">버튼2</button><br><br>
<div id="btn3" style="width:200px;height:20px;border:1px solid black">버튼3</div>
</body>
</html>