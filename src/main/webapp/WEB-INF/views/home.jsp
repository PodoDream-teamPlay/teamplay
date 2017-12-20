<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>PODO Home</title>
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

/*

ul {
	overflow: auto;
	list-style-type: none;
}

li {
	float: left;
	display: inline;
  
} 

*/
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

#nav-chart:hover, #nav-jenre:hover, #nav-charge:hover, #nav-event:hover, #nav-fanda:hover{
	background-color: #8d8a9b;
}
#nav-jenre:active, #nav-jenre:visited{
	background-color: #8d8a9b;
	
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
			if (${loginfail}==5) {
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
					<li class="active">
						<a href="http://localhost:8181/ex00/" 
							style="color: #1C1637; background-color: white; font-weight: 900;">
							홈
						</a>
					</li>
					<li><a href="chart" style="color: white;" id="nav-chart">차트</a></li>
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
	
<div class="container"  style="width: 1000px;">
		<!-- 본문 -->
		<!-- 배너 Slideshow  -->
		<div style="background: ligthgrey;">
			<div class="float:center" style="width: 970; height: auto;">
				<!-- banner01 : 트와이스 신곡 홍보 -->
				<a href="music_detail?mid=115"> <img class="Slides"
					src="././resources/images/banner01.png"
					style="width: 970px; height: auto; object-fit: cover;">
				</a>
				<!-- banner02 : 2000년대 발라드 추천 -->
				<a href="generation?startYear=2000&endYear=2009&genre=ballad"> <img
					class="Slides" src="././resources/images/banner02.png"
					style="width: 970; height: auto; object-fit: cover;"></a>
					
					<!--  banner 03:  -->
					 <img class="Slides" src="././resources/images/title3.jpg"
					style="width: 970; height: auto; object-fit: cover;">
					
					
					
				<!--  banner04 : 태기pick  뽕짝 추천 -->
				<a href="search?searchType=4&searchKeyword=trot">
					<img
					class="Slides" src="././resources/images/banner04.png"
					style="width: 970; height: auto; object-fit: cover;">
					<!--  banner05 -->
					 <img class="Slides" src="././resources/images/title5.jpg"
					style="width: 970; height: auto; object-fit: cover;">
					<!-- banner06 --> <img
					class="Slides" src="././resources/images/title6.jpg"
					style="width: 970; height: auto; object-fit: cover;">
			</div>
		</div>
		<br>
		<script>
			// 배너 슬라이드 스크립트 부분 시작 
			var slideIndex = 0;
			carousel();
			showDivs(slideIndex); 
			
			//배너 자동슬라이드 
			function carousel() {
				var i; 
				var x = document.getElementsByClassName("Slides");
				for( i = 0; i < x.length; i++) {
					x[i].style.display = "none";
					
				}slideIndex++;
				if(slideIndex > x.length) {slideIndex =1}
				x[slideIndex-1].style.display ="block";
				setTimeout(carousel, 2000); 
			}
			
		
			
			
		</script>
		<br>


		<!--  최신 앨범 리스트 ( 한줄로 넘어가게 하기)  -->
		<div class="innerContainer" style="width: 1000px;">
			<div style="background-color: white; color: #1C1637; font-size: 30; width: 970px; ">
				&nbsp;<img alt="grape_r" src="././resources/images/grape_r.png" style="width: 30px;">
				 NEW ALBUM
			</div>
			<ul class="albumList" id="newalbum_place"
				style="list-style-type: none; overflow: hidden; background-color: white; width: 970px; display: inline-block;
						 text-align: center; padding-left: 55px; border: 3px solid #E6E6E6;">
				<!--  최신앨범 불러오기 8개  -->
				<c:forEach var="music" items="${musicList}">
					<li class="albumListLi"
						style="text-align: center; display: inline-block;">
						<div class="album_img" style="width: 150px; height: 200px;">
							<a href="music_detail?mid=${music.mid }" id="artTag"> <img
								id="albumart" alt="최신앨범이미지"
								src="././resources/images/${music.malbumart}"
								style="width: 150px; height: 150px;">
							<span style="background-color: #8d8a9b; height: 55px; display: block;">
									<label for="artTag" style="color: white; font-size: 15;">${music.mtitle }</label><br>
									<label for="artTag" style="color: white; font-size: 5;">${music.martist}</label>
							</span>
							</a> <br>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>

		<br>
		<hr>
		<br>
		<div class="innerContainer" style="width: 970px;">
			<div style="background-color: white; color: #1C1637; font-size: 30; width: 970px; border-bottom: 1px solid white;
						 vertical-align: middle;">
				&nbsp;<img alt="grape_r" src="././resources/images/grape_r.png" style="width: 30px;">&nbsp;
				TOP 10
				<a href="chart" style="float: right; font-size: 15; color: #8d8a9b;">더보기</a>
			</div>
			<table class="table" style="border: 3px solid #E6E6E6; color: white;">
				<thead>
					<tr style="font-size: 15; background-color: #8d8a9b;">
						<th><input type="checkbox" id="choose_all" name="choose_all"></th>
						<th><span>순위</span></th>
						<th><span class="hidden">앨범이미지</span></th>
						<th><span>곡명</span></th>
						<th><span>아티스트</span></th>
						<th><span>앨범</span></th>
						<th>가사</th>
						<th>내앨범</th>
						<th>MP3다운</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="music" items="${music}">
						<tr style="font-size: 13;">
							<td width="30" bordercolor="grey"><br> <input
								type="checkbox" id="cb_choose" name="cb_choose"
								value="${music.mid}" data-mid="${music.mid}"></td>
							<td id="mid"><br>${music.mid}</td>
							<td><a href="music_detail?mid=${music.mid }"> <img
									id="albumart" alt="자켓이미지"
									src="././resources/images/${music.malbumart}">
							</a></td>
							<td><br> <a href="music_detail?mid=${music.mid }"
								style="text-decoration: none;"> ${music.mtitle} </a></td>
							<td><br>${music.martist}</td>
							<td><br>${music.malbum}</td>
							<td><a href="${music.mlyrics}"><br> <img alt="가사"
									src="././resources/images/t_lyrics.png"></a></td>
							<td><a href=""><br> <img alt="내앨범"
									src="././resources/images/t_myalbum.png"></a></td>
							<td><a href="mp3_down_icon?mid=${music.mid}" id="down_icon"><br>
									<img alt="MP3다운" src="././resources/images/t_mp3.png"
									name="down_icon"></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br> <br> <br>

	</div>
	
	
	
<script>
$(document).ready(function(){
	$('#btn-search').click(function(){
		event.preventDefault();
		$('#form-search').submit();
	});
});
</script>
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

