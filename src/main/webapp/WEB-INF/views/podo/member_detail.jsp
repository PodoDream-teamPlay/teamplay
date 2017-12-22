<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

a {
	outline: none;
	text-decoration: none;
	color: #555;
}

img {
	barder: 0;
}

#newalbum_place {
	padding: 10px;
	background-color: white;
}

#newalbum_place li {
	padding: 10px;
	float: left;
	display: inline;
}

#albumart:hover {
	/* filter : opacity(50%); */
	
}

#albumart {
	width: 65px;
	height: 65px;
}

.footer_item {
	width: 200px;
	text-align: center;
}

.navitem:hover {
	background-color: #8d8a9b;
}

#nav-chart:hover, #nav-jenre:hover, #nav-charge:hover, #nav-event:hover, #nav-fanda:hover, #nav-home:hover{
	background-color: #8d8a9b;
}
#nav-jenre:active, #nav-jenre:visited{
	background-color: #8d8a9b;
	
}

.albumart{
	width: 64px;
}
</style>



</head>



<body>

<div style="background-color: #1C1637"> <!-- 상단 배경색 정하는 div -->
<div class="container" style="width: 1200px;background-color: #1C1637">
		<!-- 타이틀 -->
		<h1 class="text-center">
			<a href="http://localhost:8181/ex00/" style="text-decoration: none;">
			<img alt="grape" src="././resources/images/grape3.png" style="width: 58px;">
			<img alt="PODO" src="././resources/images/podo_white.png">
			</a>
		</h1>



		<!-- 로그인  -->
		<div id="noline" style="float: right; margin-top: 20px;">
			<c:if test="${empty loginUserid}">
				<form action="login-post" method="post" id="noline">
					<table>
					<tr>
					<td>
						<input type="text" name="userid" id="userid" placeholder="아이디"
							style="width: 150px; margin-right: 5px;" required autofocus/>
					</td>
					<td rowspan="2">
						<input type="submit" id="btn-login" value="로그인" class="btn"
							style="background-color: #8d8a9b; color: white; height: 50px;
								font-weight: bold;">
					</td>
					</tr>
					<tr>
					<td>
						<input type="password" name="password" id="password"
							style="width: 150px; margin-right: 5px;" placeholder="비밀번호" required />
					</td>
					</tr>
					</table>
					<a href="register" style="color: #8d8a9b;">회원가입</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="" style="color: #8d8a9b;">아이디·비밀번호 찾기</a>
					<br>
					</tbody>



				</form>
			</c:if>

			<c:if test="${not empty loginUserid}">
				<form action="logout" method="get">
				<table>
					<tr>
					<td>
						<p style="margin-right: 5px; color: white;">${loginUserid}님, 환영합니다 </p>
					</td>
					<td rowspan="2">
						<input type="submit" id="btn-logout"
						class="btn" style="background-color: #8d8a9b; color: white; height: 50px;"
						name="btn-logout" value="로그아웃">
					</td>
					</tr>
					<tr>
					<td>
						<a href="member_detail" class="text-align:right" style="margin-right: 5px; color: #8d8a9b;">마이페이지</a>
					</td>
					</tr>
					</table>
					<br> 
					
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
		<!-- 검색창 -->
		<form action="search" method="get" class="text-center" id="form-search">			
			<input type="hidden" name="searchType" id="searchType" value="1">
			<table class="text-center" 
					style="margin-left: 280px; border: 1px solid #8d8a9b;">
			<tr>
			<td>
				<input type="text" name="searchKeyword" placeholder="검색"
					style="width: 580px; height: 42px; border: 3px solid #1C1637; margin: 5px;"/>
			</td>
			<td>
				<!-- 검색 버튼 -->
				<a href="#" id="btn-search" style="text-decoration : none;">
					<img alt="search" src="././resources/images/search_icon.png"
						style="background-color: #1C1637; padding: 5px;">
				</a>
			</td>
			</tr>
			</table>
		</form>
		<br>
			
</div>


<div style="background-color: #1C1637; height: 50px;">
		<!-- 메뉴 bar -->

		<div class="container">
		<nav class="navbar navbar-inverse" 
			style="width: 970px; display: inline-block; background-color: #1C1637; border: none;
				text-align: center;">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand navitem" href="http://localhost:8181/ex00/" style="color: #00FDFD;" id="nav-podo">PODO</a>
				</div>
				<ul class="nav navbar-nav">
					<li>
						<a href="http://localhost:8181/ex00/" 
							style="color: white;" id="nav-home">
							홈
						</a>
					</li>
					<li>
						<a href="chart" style="color: white;" id="nav-chart">
						차트
						</a>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" 
							style="color: white;" id="nav-jenre">
							장르 <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="search?searchType=4&searchKeyword=ballad">발라드</a></li>
							<li><a href="search?searchType=4&searchKeyword=dance">댄스</a></li>
							<li><a href="search?searchType=4&searchKeyword=indi">인디</a></li>
							<li><a href="search?searchType=4&searchKeyword=hiphop">힙합</a></li>
							<li><a href="search?searchType=4&searchKeyword=trot">트로트</a></li>
						</ul>
					</li>
					<li><a href="monthpay" style="color: white;" id="nav-charge">이용권</a></li>
					<li><a href="event" style="color: white;" id="nav-event">이벤트</a></li>
					<li><a href="boardFnA" style="color: white;" id="nav-fanda">F&A</a></li>

				</ul>
			</div>
		</nav>
		</div>
</div>
</div> <!-- 상단 배경색 정하는 div -->



<br>
<br>

		<div class="container" style="text-align: center;">
		
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
								style="background-color: white; color: #2E2E2E; width: 170px; height: 60px;
								 margin-left: 15px; padding: 20px; font-size: 20;">
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

							<a href="member_withdraw">회원 탈퇴</a>

						</div>
					</td>
					<td rowspan="2" style="padding-left: 100px;">
						<h5>플레이리스트 목록</h5>
						<div class="rigth_box">
							<button class="button" 
									style="float: right; margin-bottom: 5px; border: none; background-color: white;"
							 		id="btn-insert">
								<img alt="plus" src="././resources/images/plus.png" style="width: 15px;">
							</button>
							<br>
							<table class="table">
								<thead>
									<tr style="background-color: #2E2E2E; color: white;">
										<th class="text-center">리스트 제목</th>
										<th class="text-center">저장 날짜</th>
										<th style="width: 30px;"></th>
										<th style="width: 30px;"></th>
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
					<td rowspan="2" style="padding-left: 100px;">
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

												<button class="btn-player" data-mid="${mp3.mid }" 
														style="float: right; background-color: white; border: none;" >
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
							+ '<td class="td-pdate">'
							+ this.pdate
							+ '</td>'
							+ '<td>'
							+ '<button class="btn-delete" data-pid="' + this.pid + '" style=" border: none; background-color: white;">'
							+ '<img alt="x" src="././resources/images/x.png" style="width: 13px;">'							
							+'</button>'
							+ '</td>'
							+'<td>'
							+'<button class="btn-playlist-player" data-mids="' + this.mids + '"' 
							+'		style="float: right; background-color: white; border: none;" >'
							+'▶'
							+'</button></td>'
							+'</tr>';
							//+'	<img src="././resources/images/play_button.png">'
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
	
	//플레이리스트 play 버튼
	$('#playlists').on('click', '.playlist-item .btn-playlist-player', function(){
		var mids = $(this).attr('data-mids');
		window.open("playlist_player_popup?mids="+mids, "player", "width=400, height=900");
	});
	
	//mp3 play 버튼
	$('.btn-player').click(function(){
		var mid = $(this).attr('data-mid');
		window.open("playlist_popup?mid="+mid, "플레이리스트 제목 입력", "width=400, height=700");
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

<div>
		<img src="././resources/images/logo11.png" alt=" "
			style="margin-top: 100px;" />
	</div>
</body>
<footer>
	<div style="float: center;">
		<table style="text-align: center; font-size: 13; width: 700px;">
			<tr>
				<td class="footer_item"><a href="introduction">회사소개</a></td>
				<td class="footer_item"><a href="hiring">인재채용</a></td>
				<td class="footer_item"><a>제휴제안</a></td>
				<td class="footer_item"><a href="usingagreement">이용약관</a></td>
				<td class="footer_item"><a href="personalInformation">개인정보처리방침</a></td>
				<th class="footer_item"><a>ⓒ PODO Corp.</a></th>
			</tr>
		</table>
	</div>
</footer>
</html>

