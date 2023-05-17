<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('btn1').onclick = function() {
			alert('버튼클릭');
			
			const request = new XMLHttpRequest();
			request.open('get', 'csv1.jsp', true);
			request.send();
			
			console.log(request.responseText)
		};
		
		document.getElementById('btn2').onclick = function() {
			const request = new XMLHttpRequest();
			
			console.log("1");
			request.onreadystatechange = function() {
				//console.log(request.readyState);
				if(request.readyState == 4) {
					if(request.status == 200) {
						console.log("2");
						console.log(request.responseText);
					} else {
						alert('페이지 오류');
					}
				}
			};
			request.open('get', 'csv1.jsp', true);
			request.send();
			
			console.log("3");
			
			//console.log(request.responseText);
		};
	};
</script>
</head>
<body>
<button id='btn1'> 요청하기 </button>
<button id='btn2'> 요청하기 </button>
</body>
</html>