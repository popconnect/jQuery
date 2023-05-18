<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base/jquery-ui.css" />
<style type="text/css">
body {
	font-size: 80%;
}
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript" src="./js/datepicker-ko.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//빈날자 보이기
		$('#datepicker1').datepicker({
			//Event
			onClose: function(data) {
				console.log(data)
			}
		});
		
		$('#btn1').button().on('click', function() {
			console.log( $('#datepicker1').val() );
			console.log( $('#datepicker1').datepicker('getDate') );
		})
	});

</script>
</head>
<body>
<div>
	Date : <input type="text" id="datepicker1" readonly="readonly"/>
	<button id="btn1">날자 확인</button>
</div>


</body>
</html>