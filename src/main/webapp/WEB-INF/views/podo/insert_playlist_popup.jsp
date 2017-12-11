<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>플레이리스트 추가</title>
</head>
<body onload="window.resizeTo(400,200)">
<h2>새 플레이리스트 제목</h2>
	<input type="text" name="ptitle" id="new-ptitle">
	<p id="check-result"></p>
	<br>
	<button type="button" id="btn-insert">만들기</button>
</body>

<script>
$(document).ready(function(){
	//타이틀 중복 체크해서 중복됐으면 insert 안됨
	var ptitle = $('#new-ptitle').val();
	
	//insert 하는 함수
	function insertPlaylist(){
		
	}
	
	//중복 체크하는 함수
	function checkTitle(){
		$.getJSON('/ex00/playlist/check/' + ptitle, function(data){
			var replyList = null;
			
			$(data).each(function(){
				replyList = this.ptitle;
			});
			
			if(replyList != null){
				alert('중복된 타이틀이 없음');
				insertPlaylist();
			}else{
				alert('중복된 타이틀이 있음!!!!');
				$('#check-result').innerHTML = '중복된 타이틀이 있습니다.';
			}
		});
	}
	
	

});
</script>
</html>