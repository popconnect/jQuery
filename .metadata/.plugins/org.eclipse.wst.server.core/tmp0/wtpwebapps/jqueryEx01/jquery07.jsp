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
	/* $('h2').css('color', 'red');
	$('h3').css('color', 'blue');
	const selector = 'h3';
	const val = 'green';
	$(selector).css('color', val); */
	// , 태그 연결
	$('h2 , h3').css('color', 'magenta')
});

</script>
</head>
<body>
	<h2 id='i1'>Header-1</h2>
	<h3 id='i2'>Header-2</h3>
	<h2 id='i3'>Header-3</h2>
	<h3 id='i4'>Header-4</h3>
</body>
</html>