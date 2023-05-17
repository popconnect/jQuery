<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('btn').onclick = function() {
			const request = new XMLHttpRequest();
			
			console.log("1");
			request.onreadystatechange = function() {
				//console.log(request.readyState);
				if(request.readyState == 4) {
					if(request.status == 200) {
						//문자열
						//console.log(typeof request.responseText);
						
						//XML 객체 - 
						//console.log(typeof request.responseXML);
						
						const xmlData = request.responseXML;
						const names = xmlData.getElementsByTagName('name');
						//console.log(names);
						//console.log(names[0].innerHTML);
						//console.log(names[0]);
						
						const publishers = xmlData.getElementsByTagName('publisher');
						const auther = xmlData.getElementsByTagName('auther');
						const price = xmlData.getElementsByTagName('price');
						
						let result = '<table border = '1'>';
						
						for( int i = 0; i<names.length; i++) {
							result += '<tr>'
							result += '<td>' + names[i].innerHTML + '</td>';
							result += '<td>' + publishers[i].innerHTML + '</td>';
							result += '<td>' + auther[i].innerHTML + '</td>';
							result += '<td>' + price[i].innerHTML + '</td>';
							result += '</tr>'
						}
						
						
					} else {
						alert('페이지 오류'); 
					}
				}
			};
			request.open('get', 'import.jsp', true);
			request.send();
			
			console.log("3");
			
			//console.log(request.responseText);
		};
	};
</script>
</head>
<body>
<button id='btn'> 요청하기 </button>
</body>
</html>