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
			if (${loginfail}==5) {
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
					<a class="navbar-brand" href="http://localhost:8181/ex00/">PODO</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="http://localhost:8181/ex00/">홈</a></li>

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

		<!-- 본문 -->
		<!-- 배너 Slideshow  -->
		<div class="container-center" style="background: ligthgrey;">
			<div class="float:center" style="width: 970; height: auto;">
				
				<a href="music_detail?mid=115">
				<img class="Slides" src="././resources/images/banner01.png"
					style="width: 970px; height: auto; object-fit: cover;"> 
				</a>
				<img
					class="Slides" src="././resources/images/title2.jpg"
					style="width: 970; height: auto; object-fit: cover;"> 
				<img
					class="Slides" src="././resources/images/title3.jpg"
					style="width: 970; height: auto; object-fit: cover;"> 
				<img
					class="Slides" src="././resources/images/title4.jpg"
					style="width: 970; height: auto; object-fit: cover;">
				<img
					class="Slides" src="././resources/images/title5.jpg"
					style="width: 970; height: auto; object-fit: cover;">
				<img
					class="Slides" src="././resources/images/title6.jpg"
					style="width: 970; height: auto; object-fit: cover;">
				
				<button onclick="plusDivs(-1)" class="button display left">◀</button>
				<button onclick="plusDivs(1)" class="button display right">▶</button>
			</div>
		</div>
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



		<!--  최신 앨범 리스트 ( 한줄로 넘어가게 하기)  -->
		<h3 style="color: #2E2E2E">최신 앨범</h3>
		<div class="innerContainer" style="">

			<ul class="albumList" id="newalbum_place"
				style="overflow: auto; list-style-type: none;">

				<!--  최신앨범 불러오기 8개  -->
				<c:forEach var="music" items="${musicList}">
					<li class="albumListLi" style="text-align: center;">
						<div class="album_img" style="width: 150px; height: 150px;">
							<a href="music_detail?mid=${music.mid }"
								style="position: relative;"> <img id="albumart"
								alt="최신앨범이미지" src="././resources/images/${music.malbumart}"
								style="width: 150px; height: 150px;">

							</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>



		<br />
		<hr />




	</div>
</body>
</html>

