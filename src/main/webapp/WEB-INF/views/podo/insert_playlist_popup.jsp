<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>PODO</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
 <!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body onload="window.resizeTo(380,300)">
<p style="background-color: #2E2E2E; color: white; text-align: center; font-size: 25px; padding: 20px;">
	새 플레이리스트 제목
</p>
<br>
<div class="container text-center">
	<table style="">
		<tr>
			<td>
				<input type="text" name="ptitle" id="ptitle" style="height: 32px; width: 250px;">
			</td>
			<td style="padding-left: 10px;">
				<button type="button" id="btn-insert" class="btn">만들기</button>
			</td>
		</tr>
		<tr>
			<td>
				<p style="width: 250px; text-align: left; display: inline-block;" id="check-result"></p>
			</td>
			<td>
				<br>
			</td>
		</tr>
	</table>
	
</div>

<script>
$(document).ready(function(){
	
	//주소에서 파라미터 받아오는 함수 - userid 가져오려고
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	//insert 하는 함수
	function insertPlaylist(){
		var ptitle = $('#ptitle').val();
		var userid = getParameterByName('userid');
		
		$.ajax({
			type: 'post',
			url: '/ex00/playlist/',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'POST'
			},
			data: JSON.stringify({
				'ptitle': ptitle,
				'userid': userid
			}),
			success: function(result){ 
				if(result === 'success'){ //성공
					opener.parent.location.reload();
					window.close();
				}else{
					alert('실패');
				}
			}
		});
		
	}
	
	//중복 체크하는 함수
	function checkTitle(){
		var ptitle = $('#ptitle').val();
		
		$.getJSON('/ex00/playlist/check/' + ptitle, function(data){
			var replyList = null;
			
			$(data).each(function(){
				replyList = this.ptitle;
			});
			
			if(replyList == null){
				//중복되는거 없으면 insert
				insertPlaylist();
			}else{
				document.getElementById('check-result').innerHTML=
					'<p style="color:red;">중복된 타이틀입니다.</p>';
			}
		});
	}
	
	$('#btn-insert').click(function(){
		checkTitle();
	});

});
</script>
</body>
</html>