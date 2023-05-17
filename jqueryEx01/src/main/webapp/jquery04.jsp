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
	console.log('Hello jQuery 1')
})
jQuery(document).ready(function() {
	console.log('Hello jQuery 2')
})
$(function() {
	console.log('Hello jQuery 3')
})

$(() => {
	console.log('Hello jQuery 4')
})
</script>
</head>
<body>
	Hello jQuery
</body>
</html>