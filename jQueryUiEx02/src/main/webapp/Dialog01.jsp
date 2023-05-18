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
		// 새창 
		// window.open - multi page application
		$('#btn1').button().on('click', function() {
			open( 'https://m.daum.net', 'winopen', 'width=640, height=960')
		});
		
		
		$('#dialog').dialog({
			autoOpen: false,
			modal: true,
			
			width: 500,
			height: 300,
			resizable: false,
			
			buttons: { 
				'취소' : function() {
					alert('취소');
					$(this).dialog('close');
				},
				'확인' : function() {
					alert('확인');
					$(this).dialog('close');
				}
			},
		
			show : {
				effect: 'blind',
				duration: 1000
			},
			hide : {
				effect: 'explode',
				duration: 1000
			}
		});
		
		$('#btn2').button().on('click', function() {
			$('#dialog').dialog('open');
		});
		// jQuery - Dialog - single page application
	});
</script>
</head>
<body>
<button id="btn1">새창열기</button>
<button id="btn2">다이얼로그 열기</button>
<div id="dialog" title="jQuery 다이얼로그">
	<h1>Hello 다이얼로그</h1>
</div>

</body>
</html>