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
		$('#progressBar').progressbar({
			//percent
			value: 0,
			max: 300
		});
		$('#sliderBar').slider({
			
			//percent
			value: 0,
			min: 0,
			max: 300,
			range: true,
			values: [75, 300],
			step: 2,
			//orientation:'vertical'
			slide: function(event, ui) {
				//console.log('slide :', $(this).slider('value'));
				//console.log('slide :', ui.values[0], '/', ui.values[1]);
				console.log('slide :', $(this).slider('values', 0) , '/' , $(this).slider('values', 1));
				//$('#progressBar').progressbar('value', $(this).slider('value')) 
				$('#progressBar').progressbar('value', ui.value) 
			}
		});
		
		$('#btn').button().on('click', function() {
			console.log($('#sliderBar').slider('value'))
		})
	});
</script>
</head>
<body>
	<div id="progressBar"></div>
	<br><hr><br>
	<div id="sliderBar"></div>
	<button id="btn">버튼</button>

</body>
</html>