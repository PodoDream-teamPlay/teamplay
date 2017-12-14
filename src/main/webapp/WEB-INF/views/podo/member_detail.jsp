<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Podo</title>
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
td {
	padding: 20px;
}

.rigth_box {
	width: 700px;
	height: 400px;
}

.left_box {
	background-color: #2E2E2E;
	color: white;
	width: 200px;
	height: 400px;
}

.topnav {
	background-color: #2E2E2E;
	overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
	float: left;
	color: #9A2EFE;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
	background-color: #9A2EFE;
	color: white;
}

/* Add a color to the active/current link */
.topnav a.active {
	background-color: #9A2EFE;
	color: white;
}

#noline {
	display: inline;
}

.albumart {
	width: 67px;
}

#btn-member-update.hover {
	border: 1px solid white;
	color: white;
}
</style>



</head>



<body>


	<div class="container" style="width: 1000px;">
		<!-- 타이틀 -->
		<h1 class="text-center">
			<a href="http://localhost:8181/ex00/" style="text-decoration: none;">PODO
				DREAM</a>
		</h1>



		<!-- 로그인  -->
		<div id="noline" style="float: right">
			<form action="login-post" method="post" id="noline">
				<c:if test="${empty loginUserid}">
					<input type="text" name="userid" id="userid" placeholder="아이디"
						style="margin-right: 10px" required autofocus />
					<br>
					<input type="password" name="password" id="password"
						style="margin-right: 10px" placeholder="비밀번호" required />
					<br>
					<input type="submit" id="btn-login" value="로그인" class="btn"
						style="background-color: #DFE0E7; color: white;">
					<a href="register"><input type="button" value="회원가입"
						class="btn" style="background-color: #DFE0E7; color: white;">
					</a>
					<br>
					</tbody>


				</c:if>

			</form>

			<c:if test="${not empty loginUserid}">
				<form action="logout" method="get">
					${loginUserid}님, 환영합니다 <input type="submit" id="btn-logout"
						class="btn" style="background-color: #DFE0E7; color: white;"
						name="btn-logout" value="로그아웃" style="margin-right: 10px" required
						autofocus><br> <a href="member_detail"
						class="text-align:right">마이페이지(test)</a>
				</form>
			</c:if>

			<!-- 로그인 후에 이동할 페이지 -->
			<input type="hidden" name="queryString" value="${loginTarget}" />
		</div>

		<!--로그인 실패시 띄울 알람. -->
		<script>
		$(document).ready(function() {
			if (${loginfail} == 5) {
				alert("아이디와 비밀번호 확인해 주세요.");
				
			} 
		});
	</script>


		<br>
		<form action="search" method="get" class="text-center"
			style="margin-left: 50px;">
			<select name="searchType" style="height: 27px">
				<option value="1">노래 제목</option>
				<option value="2">가수</option>
				<option value="3">앨범명</option>
				<option value="4">장르별</option>
			</select> <input type="text" name="searchKeyword" placeholder="검색어"
				style="width: 500" /> <input type="submit" value="검색" class="btn "
				style="background-color: #1C1637; color: white;" />
		</form>
		<br>

		<!-- 메뉴 bar -->

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="">PODO</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="">홈</a></li>

					<li><a href="chart">차트</a></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">장르 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="">발라드</a></li>
							<li><a href="">댄스</a></li>
							<li><a href="">인디</a></li>
							<li><a href="">힙합</a></li>
							<li><a href="">트로트</a></li>
						</ul></li>
					<li><a href="monthpay">이용권</a></li>
					<li><a href="event">이벤트</a></li>
					<li><a href="boardQnA">Q&A</a></li>
				</ul>
			</div>
		</nav>





		<hr>
		<table class="text-center">
			<thead></thead>
			<tbody>
				<tr>
					<td>
						<div class="left_box">
							user프로필 출력<br>
							<br>
							<div
								style="background-color: white; color: #2E2E2E; width: 170px; height: 60px; margin-left: 15px; padding: 20px;">
								<b>${loginUserid}</b>
							</div>
							<br>
							<form action="member-update">
								<input type="submit" value="회원 정보 수정" id="btn-member-update"
									style="color: #D8D8D8; text-decoration: none; border: 1px solid #D8D8D8; padding: 10px; background-color: #2E2E2E;">
							</form>
							<br>
							<div>
								보유 포인트 <br>${point }
							</div>
							<br>



						</div>
					</td>
					<td rowspan="2">
						<h5>플레이리스트 목록</h5>
						<div class="rigth_box">
							<button class="button" style="float: right;" id="btn-insert">+</button>
							<table class="table">
								<thead>
									<tr style="background-color: #2E2E2E; color: white;">
										<th class="text-center">리스트 제목</th>
										<th class="text-center">저장 날짜</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="playlists">
									<!-- Ajax로 playlist DB에서 가져와서 출력 -->
								</tbody>
							</table>
							
							<!-- pagination -->
							<div class="text-center">
								<ul class="pagination" id="ppagination">
									<c:if test="${ppageMaker.prev }">
									<li><a href="${ppageMaker.startPage - 1 }">◀</a></li>
									</c:if>
									<c:forEach var = "pnum" begin="${ppageMaker.startPage }" end="${ppageMaker.endPage }">
									<li><a href="${pnum }">${pnum }</a></li>
									</c:forEach>
									<c:if test="${ppageMaker.next }">
									<li><a href="${ppageMaker.endPage + 1}">▶</a></li>
									</c:if>
								</ul>
							</div>
							<form id="ppageForm">
							<input id="ppage" type="hidden" name="ppage" value="${ppageMaker.criteria.page }"> <!-- 현재 페이지 -->
							<input id="pperPage" type="hidden" name="pperPage" value="${ppageMaker.criteria.numsPerPage }"> <!-- 한페이지에 보여줄 갯수 -->
							</form>
							
						</div>
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td><br></td>
					<td rowspan="2">
						<h5>mp3 구매 목록</h5>
						<div class="rigth_box">
							<table class="table">
								<thead>
									<tr style="background-color: #2E2E2E; color: white;">
										<th></th>
										<th class="text-center">제목</th>
										<th class="text-center">앨범</th>
										<th class="text-center">가수</th>
										<th class="text-center">Play</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="mp3" items="${mp3List }">
										<tr>
											<td><a href="music_detail?mid=${mp3.mid }"> <img
													class="albumart" alt="자켓이미지"
													src="././resources/images/${mp3.malbumart}">
											</a></td>

											<td><br> <a href="music_detail?mid=${mp3.mid }"
												style="text-decoration: none;"> ${mp3.mtitle} </a></td>
											<td><br>${mp3.malbum }</td>
											<td><br>${mp3.martist}</td>
											<td><br>

												<button class="button" style="float: right; background-color:white;border:none;" id="btn-playlist">
													<img src="././resources/images/play_button.png" >
												</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<!-- pagination -->
							<div class="text-center">
								<ul class="pagination" id="mpagination">
									<c:if test="${pageMaker.prev }">
									<li><a href="${pageMaker.startPage - 1 }">◀</a></li>
									</c:if>
									<c:forEach var = "num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
									<li><a href="${num }">${num }</a></li>
									</c:forEach>
									<c:if test="${pageMaker.next }">
									<li><a href="${pageMaker.endPage + 1}">▶</a></li>
									</c:if>
								</ul>
							</div>
							<form id="pageForm" action="member_detail" method="get">
							<input id="page" type="hidden" name="page" value="${pageMaker.criteria.page }"> <!-- 현재 페이지 -->
							<input id="perPage" type="hidden" name="perPage" value="${pageMaker.criteria.numsPerPage }"> <!-- 한페이지에 보여줄 갯수 -->
							</form>
						</div>
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
			</tbody>
		</table>


	</div>
	<script>
function getDetailPlaylist(pid){
	var userid = '${loginUserid}';
	window.open("playlist_detail_popup?userid="+userid+"&pid="+pid,
			"플레이리스트 상세", "width=400, height=300, left=300, top=100");
}

$(document).ready(function(){
	//시작하면 플레이리스트 select 해서 출력
	var userid = '${loginUserid}';
	
	//전체 플레이리스트 출력
	function getAllPlaylists(page = 1){
		//var page = $('#pnum').text();
		$.getJSON('/ex00/playlist/all/'+ userid + '?page=' + page, function(data){
			var playlist = '';
			
			$(data).each(function(){
				playlist += '<tr class="playlist-item" data-pid="' + this.pid + '">'
							+ '<td>'
							+ '<a href="javascript:void(0);" onclick="getDetailPlaylist('+this.pid+');"  style="text-decoration: none;" return false;>'
								+ this.ptitle 
							+ '</a>'
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
		window.open("insert_playlist_popup?userid="+userid, "플레이리스트 제목 입력", "width=400, height=300, left=300, top=100");
		
	});
	
	
	//플레이 리스트 위의 + 버튼 눌리면 - 빈 playlist 추가
	$('#btn-playlist').click(function(){
		//새 창 띄우기 - ptitle 입력 목적
		window.open("playlist_popup?userid="+userid, "플레이리스트 제목 입력", "width=400, height=1200");
		
	});
	
	
	//mp3down-pagination
	$('#mpagination li a').click(function(){
		/*클래스가 pagenation인거 아래에 li 아래에 a태그 찾음*/
		event.preventDefault(); //기본 이벤트 동작을 막겠다 - 클릭 안됨
		
		//href 속성에 이동해야할 페이지 번호를 넣어놨음
		var target = $(this).attr('href');
		
		//pageForm 만든거에 이동할 페이지 번호 넣겠음
		$('#page').val(target);
		//pageForm submit 여기서 함
		$('#pageForm').submit();
	});
	
	//playlist-pagination
	$('#ppagination li a').click(function(){
		event.preventDefault(); //기본 이벤트 동작을 막겠다 - 클릭 안됨
		
		//href 속성에 이동해야할 페이지 번호를 넣어놨음
		var target = $(this).attr('href');
		
		//pageForm 만든거에 이동할 페이지 번호 넣겠음
		$('#ppage').val(target);
		//pageForm submit 여기서 함
		//$('#ppageForm').submit();
		getAllPlaylists($(this).text());

	});
	
});
</script>
</body>
</html>

