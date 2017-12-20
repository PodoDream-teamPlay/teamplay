<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>PODO</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js.prefixfree.jquery.js"></script>
<script type="text/javascript" src="js/custom.js"></script>

<style>
.highlight{
	color: #FD004C;
}
.titlefont{
	font-weight: bold;
	color: black;
}
table, tr{
	width: 200px;
}
</style>
</head>



<body>

<div style="background-color: #1C1637"> <!-- 상단 배경색 정하는 div -->
<div class="container" style="width: 1200px;">
		<!-- 타이틀 -->
		<h1 class="text-center">
			<a href="http://localhost:8181/ex00/" style="text-decoration: none;">
			<img alt="grape" src="././resources/images/grape3.png" style="width: 58px;">
			<img alt="PODO" src="././resources/images/podo_white.png">
			</a>
		</h1>
</div>
</div>
<br><br>

<!-- 본문 -->
<div class="container" style="color: #7A797A;">
	
	<div>
	<h3 class="titlefont">탈퇴 안내</h3>
	<p stlye="color: #5B5C5C;">회원탈퇴를 신청하기 전에 안내사항을 꼭 확인해 주세요.</p>
	
	<img alt="" src="">
	<p class="titlefont">사용하고 계신 아이디(<span style="color: #0295B6;">${loginUserid}</span>)는 탈퇴할 경우 복구가 불가능 합니다.</p>
	<span class="highlight">탈퇴한 아이디는 본인과 타인 모두 복구가 불가</span><span>하오니 신중하게 선택하시기 바랍니다.</span>
	<br>
	<br>
	<br>
	
	<p class="titlefont">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</p>
	<p>회원정보 및 mp3파일 다운로드, 플레이리스트 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
	<p>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
	<br>
	<table class="table">
	<tr>
		<td>mp3파일 다운로드</td>
		<td>음원의 mp3파일을 다운로드한 내역 삭제 <p  class="highlight">PC에 저장된 mp3파일은 삭제되지 않음</p></td>
	</tr>
	<tr>
		<td>플레이리스트</td>
		<td>플레이리스트 저장 목록 삭제</td>
	</tr>
	</table>
	<br>
	<br>
	
	<p class="titlefont">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</p>
	<p>Q&A 등의 게시판형 서비스에 등록한 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.</p>
	<p>삭제를 원하는 게시글이 있다면 <span class="highlight">반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</span></p>
	<p>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</p>
	<br>
	<table class="table">
	<tr>
		<td>Q&A</td>
		<td>문의 게시글 및 덧글</td>
	</tr>
	</table>
	<br>
	<br>
	</div>
	
	<hr>
	<br><br>
	<div>
		<p class="highlight" style="font-weight: bold;">탈퇴 후에는 아이디와 데이터는 복구할 수 없습니다.</p>
		<p class="highlight" style="font-weight: bold;">게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</p>
		<br>
		<form action="member_withdraw" method="post" id="form_check">
			<input type="checkbox" id="cb_check" name="cb_check" value="1"> <span>안내 사항을 모두 확인하였으며, 이에 동의합니다.</span>
			<br><br>
			<button class="btn" id="btn_check" disabled="disabled"
			style="color:white; border: none; background-color: #1C1637;">확인</button>
			<span id="msg_check" class="highlight" style="font-size: 8;"></span>
		</form>
	</div>
</div>
<!-- 아래여백 -->
<div style="height: 250px;">
</div>


<script>
$('document').ready(function(){
	
	$('#cb_check').click(function(){
		if($('#cb_check').prop("checked") == true){
			$('#btn_check').prop("disabled", false);
			$('#msg_check').html('');
		}else {
			$('#btn_check').prop("disabled", true);
			$('#msg_check').html('동의란을 체크해주세요');
		}
	});
	
	$('#btn_check').click(function(){
			$('#form_check').submit();
	});
});
</script>
</body>
</html>
	
	
	
	