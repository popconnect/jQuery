<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style type="text/css">
	body { font-size: 80%; }
	
	label, input { display:block; }
	input.text { margin-bottom:12px; width:95%; padding: .4em; }
	fieldset { padding:0; border:0; margin-top:25px; }
	h1 { font-size: 1.2em; margin: .6em 0; }
	div#users-contain { width: 700px; margin: 20px 0; }
	div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
	div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
	.ui-dialog .ui-state-error { padding: .3em; }
	.validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	$( document ).ready( function() {
		$.ajax({
			  url: './data/view.jsp',
			  dataType: 'xml',
			  success: function(data) {
			   
			    let users = $(data).find('user');

			    users.each(function() {
			      let seq = $(this).find('seq').text();
			      let name = $(this).find('name').text();
			      let email = $(this).find('email').text();
			      let address = $(this).find('address').text();
			      let html = '<tr>';
			      html += '  <td id="w_seq">' + seq + '</td>';
			      html += '  <td>' + name + '</td>';
			      html += '  <td>' + email + '</td>';
			      html += '  <td>' + address + '</td>';
			      html += '  <td>';
			      html += '    <button id="mbtn">수정</button>';
			      html += '    <button id="dbtn">삭제</button>';
			      html += '  </td>';
			      html += '</tr>';

			      $('#users tbody').append(html);
			    });
			  },
			  error: function() {
			    console.log('데이터를 가져오는 중 오류가 발생했습니다.');
			  }
			});
		$( '#write-form' ).dialog({
			autoOpen: false,
			modal: true,
			width: 350,
			height: 400,
			resizable: false,
			buttons: {
				'취소': function() {
					$( this ).dialog( 'close' );
				},
				'추가': function() {
					$.ajax({
						url: './data/write.jsp',
						type: 'get',
						data: {
							name: $( '#w_name' ).val(),
							password: $( '#w_password' ).val(),
							email: $( '#w_email' ).val(),
							address: $( '#w_address' ).val()
						},
						dataType: 'xml',
						success: function(xml) {
							$( this ).dialog( 'close' );
						}
					});
					$( this ).dialog( 'close' );
					location.reload()
				}
			}
		});
		
		$( '#btn1' ).button().on( 'click', function() {
			$( '#write-form' ).dialog( 'open' ); 
		});
		
		$( '#modify-form' ).dialog({
			$.ajax({
				url: './data/modify.jsp',
				type: 'get',
				data: {
					seq: $( '#w_name' ).val(),
				},
				dataType: 'xml',
				success: function(xml) {
					$( this ).dialog( 'close' );
				}
			});
			autoOpen: false,
			modal: true,
			width: 350,
			height: 400,
			resizable: false,
			buttons: {
				'취소': function() {
					$( this ).dialog( 'close' );
				},
				'추가': function() {
					$.ajax({
						url: './data/modify_ok.jsp',
						type: 'get',
						data: {
							name: $( '#w_name' ).val(),
							password: $( '#w_password' ).val(),
							email: $( '#w_email' ).val(),
							address: $( '#w_address' ).val()
						},
						dataType: 'xml',
						success: function(xml) {
							$( this ).dialog( 'close' );
						}
					});
					$( this ).dialog( 'close' );
				}
			}
		})
	});
</script>
</head>
<body>

<button id="btn1">사용자 추가</button>

<br /><hr /><br />

<div id="users-contain" class="ui-widget">
	<h1>Existing Users:</h1>
	<table id="users" class="ui-widget ui-widget-content">
	<thead>
		<tr class="ui-widget-header ">
			<th>Seq</th>
			<th>Name</th>
			<th>Email</th>
			<th>Address</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
	</table>
</div>

<div id="write-form" title="Insert new user">
	<p class="validateTips">All form fields are required.</p>
 	<form>
		<fieldset>
			<label for="w_name">Name</label>
			<input type="text" id="w_name" value="홍길동" class="text ui-widget-content ui-corner-all" />
			<label for="w_password">Password</label>
			<input type="password" id="w_password" value="1234" class="text ui-widget-content ui-corner-all" />
			<label for="w_email">Email</label>
			<input type="text" id="w_email" value="test@test.com" class="text ui-widget-content ui-corner-all" />
			<label for="w_address">Address</label>
			<input type="text" id="w_address" value="서울시 서초구" class="text ui-widget-content ui-corner-all" />
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px" />
		</fieldset>
	</form>
</div>

<div id="modify-form" title="modify user information">
	<p class="validateTips">All form fields are required.</p>
 	<form>
		<fieldset>
			<label for="w_name">Name</label>
			<input type="text" id="w_name" value="홍길동" class="text ui-widget-content ui-corner-all" />
			<label for="w_password">Password</label>
			<input type="password" id="w_password" value="1234" class="text ui-widget-content ui-corner-all" />
			<label for="w_email">Email</label>
			<input type="text" id="w_email" value="test@test.com" class="text ui-widget-content ui-corner-all" />
			<label for="w_address">Address</label>
			<input type="text" id="w_address" value="서울시 서초구" class="text ui-widget-content ui-corner-all" />
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px" />
		</fieldset>
	</form>
</div>

</body>
</html>