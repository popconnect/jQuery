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
					writeServer($('#w_name').val(), 
							$('#w_password').val(), 
							$('#w_email').val(), 
							$('#w_address').val(), );
				}
			}
		});
		
		$( '#modify-form' ).dialog({
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
					modifyServer($('#m_seq').val(),
							$('#m_name').val(), 
							$('#m_password').val(), 
							$('#m_email').val(), 
							$('#m_address').val(), );
				}
			}
		});
		
		$( '#delete-form' ).dialog({
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
					deleteServer($('#d_seq').val(),
							$('#d_password').val() );
				}
			}
		});
		
		$( '#btn1' ).button().on( 'click', function() {
			$( '#write-form' ).dialog( 'open' ); 
		});
		listServer();
	});
	
	const writeServer = function(name, password, email, address) {
		$.ajax({
			url: './data/write.jsp',
			type: 'get',
			data: {
				name: name,
				password: password,
				email: email,
				address: address
			},
			dataType: 'xml',
			success: function(xml) {
				if($(xml).find('flag').text() == 0 ){
					
					alert('|입력 완료|');
					$( '#users tbody' ).empty();
					listServer();
					$('#w_name').val('');
					$('#w_password').val('');
					$('#w_email').val('');
					$('#w_address').val('');
					$('#write-form').dialog('close');
				} else {
					alert('|에러|');
				}
			},
			error: function(e) {
				alert('[에러] :' + e.status)
			}
		});
	};
	
	const modifyServer = function(seq, name, password, email, address) {
		$.ajax({
			url: './data/modify_ok.jsp',
			type: 'get',
			data: {
				seq: seq,
				name: name,
				password: password,
				email: email,
				address: address
			},
			dataType: 'xml',
			success: function(xml) {
				if($(xml).find('flag').text() == 0 ){
					alert('|수정 완료|');
					$( '#users tbody' ).empty();
					listServer();
					$('#m_name').val('');
					$('#m_password').val('');
					$('#m_email').val('');
					$('#m_address').val('');
					$('#modify-form').dialog('close');
				} else {
					alert('|에러|');
				}
			},
			error: function(e) {
				alert('[에러] :' + e.status)
			}
		});
	};
	
	const deleteServer = function(seq, password) {
		$.ajax({
			url: './data/delete_ok.jsp',
			type: 'get',
			data: {
				seq: seq,
				password: password
			},
			dataType: 'xml',
			success: function(xml) {
				if($(xml).find('flag').text() == 0 ){
					alert('|삭제 완료|');
					$( '#users tbody' ).empty();
					listServer();
					$('#d_name').val('');
					$('#d_password').val('');
					$('#d_email').val('');
					$('#d_address').val('');
					$('#delete-form').dialog('close');
				} else {
					alert('|에러|');
				}
			},
			error: function(e) {
				alert('[에러] :' + e.status)
			}
		});
	};
	
	const modifyBtn = function(seq) {
		alert('수정버튼 클릭됨' + seq);
		$.ajax({
			url: './data/modify.jsp',
			type: 'get',
			data: {
				seq: seq
			},
			dataType: 'xml',
			success: function(xml) {
				$( xml ).find( 'user' ).each( function() {
					$('#m_seq').val($( this ).find( 'seq' ).text());
					$('#m_name').val($( this ).find( 'name' ).text());
					$('#m_email').val($( this ).find( 'email' ).text());
					$('#m_address').val($( this ).find( 'address' ).text());
					$('#modify-form').dialog('open');
				});
			},
			error: function(e) {
				alert('[에러] :' + e.status)
			}
		});
	}
	
	const deleteBtn = function(seq) {
		alert('삭제버튼 클릭됨' + seq);
		$.ajax({
			url: './data/delete.jsp',
			type: 'get',
			data: {
				seq: seq
			},
			dataType: 'xml',
			success: function(xml) {
				$( xml ).find( 'user' ).each( function() {
					$('#d_seq').val($( this ).find( 'seq' ).text());
					$('#d_name').val($( this ).find( 'name' ).text());
					$('#d_email').val($( this ).find( 'email' ).text());
					$('#d_address').val($( this ).find( 'address' ).text());
					$('#delete-form').dialog('open');
				});
			},
			error: function(e) {
				alert('[에러] :' + e.status)
			}
		});
	}
	
	const listServer = function() {
		$.ajax({
			url: './data/view.jsp',
			type: 'get',
			dataType: 'xml',
			success: function( xml ) {
				$( xml ).find( 'user' ).each( function() {
					
					let html = '<tr>';
					html += '  <td>' + $( this ).find( 'seq' ).text() + '</td>';
					html += '  <td>' + $( this ).find( 'name' ).text() + '</td>';
					html += '  <td>' + $( this ).find( 'email' ).text() + '</td>';
					html += '  <td>' + $( this ).find( 'address' ).text() + '</td>';
					html += '  <td>';
					html += '    <button onclick="modifyBtn(' + $(this).find('seq').text() + ')">수정</button>';
					html += '	 <button onclick="deleteBtn(' + $(this).find('seq').text() + ')">삭제</button>';
					html += '  </td>';
					html += '</tr>';
					
					$( '#users tbody' ).append( html );
				});
			},
			error: function( e ) {
				alert( "[에러] " + e.status );
			}
		});
	};
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

<div id="modify-form" title="Modify user">
 	<form>
		<fieldset>
			<label for="m_seq">Seq</label>
			<input type="text" id="m_seq" class="text ui-widget-content ui-corner-all" readonly="readonly" />
			<label for="m_name">Name</label>
			<input type="text" id="m_name" class="text ui-widget-content ui-corner-all" readonly="readonly" />
			<label for="m_password">Password</label>
			<input type="password" id="m_password" class="text ui-widget-content ui-corner-all" />
			<label for="m_email">Email</label>
			<input type="text" id="m_email" class="text ui-widget-content ui-corner-all" />
			<label for="m_address">Address</label>
			<input type="text" id="m_address" class="text ui-widget-content ui-corner-all" />
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px" />
		</fieldset>
	</form>
</div>

<div id="delete-form" title="Delete user">
 	<form>
		<fieldset>
			<label for="d_seq">Seq</label>
			<input type="text" id="d_seq" class="text ui-widget-content ui-corner-all" readonly="readonly" />
			<label for="d_password">Password</label>
			<input type="password" id="d_password" class="text ui-widget-content ui-corner-all" />
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px" />
		</fieldset>
	</form>
</div>
</body>
</html>