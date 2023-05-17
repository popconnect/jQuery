<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css" />
<style type="text/css">
#R, #G, #B {
  width: 600px; 
  margin: 0 auto; 
}

#rgbbox {
  width: 600px; 
  height: 100px;
  border: 1px solid black;
  margin: 0 auto; 
}
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#R').slider({
			width: 200,
		    value: 0,
		    min: 0,
		    max: 255,
		    step: 1,
		    slide: function(event, ui) {
		        var rgbValue = $('#rgbbox').css('background-color');
		        var rgbArray = rgbValue.match(/\d+/g);

		        var r = ui.value;
		        var g = parseInt(rgbArray[1]);
		        var b = parseInt(rgbArray[2]);
		        $('#rgbbox').css('background-color', 'rgb(' + r + ', ' + g + ', ' + b + ')');
		    }
		});
		$('#G').slider({
			width: 200,
		    value: 0,
		    min: 0,
		    max: 255,
		    step: 1,
		    slide: function(event, ui) {
		        var rgbValue = $('#rgbbox').css('background-color');
		        var rgbArray = rgbValue.match(/\d+/g);

		        var r = parseInt(rgbArray[0]);
		        var g = ui.value;
		        var b = parseInt(rgbArray[2]);
		        $('#rgbbox').css('background-color', 'rgb(' + r + ', ' + g + ', ' + b + ')');
		    }
		});
		$('#B').slider({
			width: 200,
		    value: 0,
		    min: 0,
		    max: 255,
		    step: 1,
		    slide: function(event, ui) {
		        var rgbValue = $('#rgbbox').css('background-color');
		        var rgbArray = rgbValue.match(/\d+/g);

		        var r = parseInt(rgbArray[0]);
		        var g = parseInt(rgbArray[1]);
		        var b = ui.value;
		        $('#rgbbox').css('background-color', 'rgb(' + r + ', ' + g + ', ' + b + ')');
		    }
		});
	});
</script>
</head>
<body>
<div id="R"></div><br><hr><br>
<div id="G"></div><br><hr><br>
<div id="B"></div><br><hr><br>
<div id="rgbbox"></div>
</body>
</html>