<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
//window.jquery => jquery => $
$(document).ready(function() {
	//$('h2.c1').css('color', 'magenta');
	$('.c1.c2').css('color', 'magenta');
});

</script>
</head>
<body>
	<h2 class='c1'>Header-1</h2>
	<h3 class='c1 c2'>Header-2</h3>
	<h2 class='c2'>Header-3</h2>
	<h3 class='c2'>Header-4</h3>
</body>
</html>