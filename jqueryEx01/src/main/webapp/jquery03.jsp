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
	console.log('Hello jQuery 1')
});

$(document).ready(function() {
	//$("*").css('color', 'red');
	$("*").css({
		color: 'blue'
	});
});
</script>
</head>
<body>
<h2>Header - 1</h2>
<h2>Header - 2</h2>
<h2>Header - 3</h2>
<h2>Header - 4</h2>
</body>
</html>