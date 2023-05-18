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
			showOtherMonths: true,
			selectOtherMonths: true,
			showButtonPanel: true,
			changeMonth: true,
			changeYear: true,
			//보여주는 달 수
			numberOfMonths: 3,
			dateFormat: 'yy-mm-dd'
		});
	});

</script>
</head>
<body>
<div>
	Date : <input type="text" id="datepicker1" readonly="readonly"/>
</div>


</body>
</html>