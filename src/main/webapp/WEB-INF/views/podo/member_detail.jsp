<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
 <!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
td{
	padding: 20px;
}
.rigth_box{
	border: 1px solid black;
	width: 700px;
	height: 400px;
}
.left_box{
	border: 1px solid gray;
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
<div class="container">
<h1>마이페이지</h1>
<hr>
<table class="text-center">
<thead></thead>
<tbody>
	<tr>
		<td>
			<div class="left_box">
				user프로필 출력<br><br>
				테스트 아이디 : test<br>
				테스트 아이디에 해당하는<br>
				- mp3 다운로드리스트
				(PODO_GET)<br>
				- 플레이리스트
				(PODO_PLAYLIST)
			</div>
		</td>
		<td rowspan="2">
			mp3 구매 목록
			<div class="rigth_box">
				<table>
				
				</table>
			</div>
		</td>
	</tr>
	<tr><td>--</td></tr>
	<tr>
		<td>--</td>
		<td rowspan="2">
			플레이리스트 목록
			<div class="rigth_box">
				
			</div>
		</td>
	</tr>
	<tr><td>--</td></tr>
</tbody>
</table>


</div>
<script>
$(document).ready(function(){
	
});
</script>
</body>
</html>