<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Podo</title>
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
	width: 700px;
	height: 400px;
}
.left_box{
	background-color: #B3AAC1;
	width: 200px;
	height: 400px;
} 

.topnav {
	background-color: #4D408A;
	overflow: hidden;
}

/* Style the links inside the navigation bar */
 .topnav a {
	float: left;
	color: #CBC1FA;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}
 
/* Change the color of links on hover */
.topnav a:hover {
	background-color: #ddd;
	color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
	background-color: #CBC1FA;
	color: white;
}

#noline {
	display: inline;
}
</style>



</head>
<body>
<div class="container">
		<h1 class="text-center" style="color: purple"><a href="http://localhost:8181/ex00/">PODO DREAM</a></h1>

	<!-- 로그인  -->
 	<div id="noline" style="float: right">
		<form action="login-post" method="post" id="noline" >
			<c:if test="${empty loginUserid}">
				<input type="text" name="userid" id="userid" placeholder="아이디" style="margin-right: 100px" required autofocus /><br>    
				<input type="password" name="password" id="password" style="margin-right: 100px" placeholder="비밀번호" required /><br> 
				<input type="submit" id="btn-login"  value="로그인">
				<a href="register"><input type ="button" value="회원가입"> </a><br> 
				</tbody>

			</c:if>

		</form>

			<c:if test="${not empty loginUserid}">
				<form action="logout" method="get">
					${loginUserid}님, 환영합니다 
					<input type="submit" id="btn-logout" name="btn-logout" value="로그아웃" style="margin-right: 100px">
					<br>
					<a href="member_detail" class="text-align:right" style="margin-right: 100px">
						마이페이지
					</a>
				</form>
			</c:if>
	
		
		<!-- 로그인 후에 이동할 페이지 -->
		<input type="hidden" name="queryString" value="${loginTarget}" />
	 </div> 
	<!--  로그인폼 오른쪽으로 가야행 !!!~  -->

<br>
	<form action="search" method="get" class="text-center">
		<select name="searchType">
			<option value="1">노래 제목</option>
			<option value="2">가수</option>
			<option value="3">앨범명</option>
			<option value="4">장르별</option>
		</select> <input type="text" name="searchKeyword" placeholder="검색어" /> <input
			type="submit" value="검색" class="btn btn-primary" />


	</form>
	<br>
	<div class="topnav" id="myTopnav" align="center">
		<a class="active" href="">홈</a> <a href="podo/chart">차트</a> <a href=""></a>
		<a href=""></a> <a href=""></a><a href=""></a><a href=""></a>



	</div>





<hr>
<table class="text-center">
<thead></thead>
<tbody>
	<tr>
		<td>
			<div class="left_box">
				user프로필 출력<br><br>
				<div style="background-color: white; width: 170px; height: 60px; margin-left: 15px; padding: 20px;">
					<b>${loginUserid}</b>
				</div>
				<br>
				<form action="member-update">
					<input type="submit" value="회원 정보 수정">
				</form>
				
				<br>
				테스트 아이디에 해당하는<br>
				- mp3 다운로드리스트
				(PODO_GET)<br>
				- 플레이리스트
				(PODO_PLAYLIST)
			</div>
		</td>
		<td rowspan="2">
			<h5>플레이리스트 목록</h5>
			<div class="rigth_box">
				<button class="button" style="float: right;" id="btn-insert">+</button>
				<table class="table">
				<thead>
					<tr style="background-color: #4D408A; color: white;">
						<th class="text-center">리스트 제목</th>
						<th class="text-center">저장 날짜</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="playlists">
					<!-- Ajax로 playlist DB에서 가져와서 출력 -->
				</tbody>
				</table>
			</div>
		</td>
	</tr>
	<tr><td>--</td></tr>
	<tr>
		<td>--</td>
		<td rowspan="2">
			<h5>mp3 구매 목록</h5>
			<div class="rigth_box">
				<table class="table">
				<thead>
					<tr style="background-color: #4D408A; color: white;">
						<th></th>
						<th class="text-center">제목</th>
						<th class="text-center">앨범</th>
						<th class="text-center">가수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mp3" items="${mp3List }">
						<tr>
						<td><!-- <img id="albumart" alt="자켓이미지" src="../resources/images/${mp3.malbumart}">--></td>
						<td>${mp3.mtitle}</td>
						<td>${mp3.malbum }</td>
						<td>${mp3.martist}</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
		</td>
	</tr>
	<tr><td>--</td></tr>
</tbody>
</table>


</div>
<script>
$(document).ready(function(){
	//시작하면 플레이리스트 select 해서 출력
	var userid = '${loginUserid}';
	
	function getAllPlaylists(){
		$.getJSON('/ex00/playlist/all/'+ userid, function(data){
			var playlist = '';
			
			$(data).each(function(){
				playlist += '<tr class="playlist-item" data-pid="' + this.pid + '">'
							+ '<td>'
							+ this.ptitle
							+ '</td>'
							+ '<td>'
							+ this.pdate
							+ '</td>'
							+ '<td>'
							+ '<button class="btn-delete" data-pid="' + this.pid + '">X</button>'
							+ '</td>'
							+'</tr>';
			});
			
			$('#playlists').html(playlist);
		});
	}
	getAllPlaylists();
	
	//플레이 리스트의 x 버튼 눌리면 - 해당 playlist 삭제
	$('#playlists').on('click', '.playlist-item .btn-delete', function(){
		//x버튼 눌린 playlist의 pid
		var pid = $(this).attr('data-pid');
		
		if(confirm(" 플레이리스트를 삭제 하시겠습니까?")){
		
			//플레이리스트 삭제 기능 : Ajax
			$.ajax({
				type: 'delete',
				url: '/ex00/playlist/' + pid,
				headers: {
					'Content-Type': 'application/json',
					'X-HTTP-Method-Override': 'DELETE'
				},
				success: function(result){
					if(result === 'success'){ //성공
						alert('삭제 성공');
						getAllPlaylists(); //댓글 전체 출력 함수 호출
					}else{
						alert('삭제 실패');
					}
				}
			}); 
		}
	});
	
	
	//플레이 리스트 위의 + 버튼 눌리면 - 빈 playlist 추가
	$('#btn-insert').click(function(){
		//새 창 띄우기 - ptitle 입력 목적
		window.open("insert_playlist_popup", "플레이리스트 제목 입력", "width=400, height=300, left=300, top=100");
	
	});
	
});
</script>
</body>
</html>

				