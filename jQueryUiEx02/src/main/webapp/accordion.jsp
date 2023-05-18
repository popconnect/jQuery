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
<script type="text/javascript">
	$(document).ready(function() {
		$('#accordion').accordion();
		
		$('#btn1').button().on('click', function() {
			let html = '';
			html += '<h3>Section 5</h3>'
			html += '<div>'
			html += '<p>추가 데이터<p>'
			html += '</div>'
			
			$('#accordion').append(html);
			$('#accordion').accordion('refresh');
		});
		$('#btn2').button().on('click', function() {
			//console.log($('#accordion').accordion('option', 'active'));
			$('#accordion').accordion('option', 'active', 2);
		});
	});
</script>
</head>
<body>
	<button id="btn1">데이터 추가</button>
	<button id="btn2">데이터 선택</button>
	<br><hr><br>
	
	<div id="accordion">
		<h3>Section 1</h3>
		<div>
			<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravidain, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nammi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum avelit eu ante scelerisque vulputate.</p>
		</div>
		<h3>Section 2</h3>
		<div>
			<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulumsit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauristurpis porttitor velit, faucibus interdum tellus libero ac justo.Vivamus non quam. In suscipit faucibus urna.</p>
		</div>
		<h3>Section 3</h3>
		<div>
			<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.Quisque lobortis. Phasellus pellentesque purus in massa. Aenean inpede. Phasellus ac libero ac tellus pellentesque semper. Sed acfelis. Sed commodo, magna quis lacinia ornare, quam ante aliquamnisi, eu iaculis leo purus venenatis dui.</p>
			<ul>
				<li>List item one</li>
				<li>List item two</li>
				<li>List item three</li>
			</ul>
		</div>
		<h3>Section 4</h3>
		<div>
			<p>Cras dictum. Pellentesque habitant morbi tristique senectus etnetus et malesuada fames ac turpis egestas. Vestibulum ante ipsumprimis in faucibus orci luctus et ultrices posuere cubilia Curae;Aenean lacinia mauris vel est.</p>
			<p>Suspendisse eu nisl. Nullam ut libero. Integer dignissimconsequat lectus. Class aptent taciti sociosqu ad litora torquentper conubia nostra, per inceptos himenaeos.</p>
		</div>
	</div>
</body>
</html>