<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	const xml = `<friends>
		<friend>
			<name>tester1</name>
			<language>Javascript</language>
		</friend>
		<friend>
			<name>tester1</name>
			<language>Javascript</language>
		</friend>
		<friend>
			<name>tester1</name>
			<language>Javascript</language>
		</friend>
	</friends>`
	$(document).ready(function() {
		console.log(typeof xml);
		const xmlDoc = $.parseXML(xml)
		console.log(typeof xmlDoc);
		
		$(xmlDoc).find('friend').each(function(index, item) {
			console.log(index);
			console.log(item.innerHTML);
			console.log($(item).find('name')[0].innerHTML)
		});
	});
</script>
</head>
<body>

</body>
</html>