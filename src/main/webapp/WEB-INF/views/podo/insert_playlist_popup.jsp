<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>플레이리스트 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
 <!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body onload="window.resizeTo(300,300)">
<h2>새 플레이리스트 제목</h2>
<input type="text" name="ptitle" id="ptitle">
<p id="check-result"></p>
<br>
<button type="button" id="btn-insert">만들기</button>



<script>
$(document).ready(function(){
	//insert 하는 함수
	function insertPlaylist(){
		var ptitle = $('#ptitle').val();
		
		self.close();
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