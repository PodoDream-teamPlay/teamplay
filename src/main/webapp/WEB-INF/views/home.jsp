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
<!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>




ul {
	overflow: auto;
	list-style-type: none;
}

li {
	float: left;
	display: inline;
  
}

/* .navbar-inverse {

	background-color: #4D408A;
	color: white;
} */

#innercontainer li {

  position: relative;
  z-index: 10; 
  list-style: none; 
  margin: 0;
  padding: 2px; 
  max-height: 50px; 
  overflow-y: scroll;
  overflow-x: scroll;
}

#innercontainer ul{
   margin: 0;
   padding: 0 4px;
   border-radius: 2px;
   max-width: 10em;
   

   white-space: nowrap;
   color: black;
   cursor: pointer; 
   


}




</style>



</head>



<body>


	<div class="container" style="width:1000px;">
		<!-- 타이틀 -->
		<h1 class="text-center">
			<a href="http://localhost:8181/ex00/" style="text-decoration:none;">PODO DREAM</a>
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
					<input type="submit" id="btn-login" value="로그인" class="btn" style="background-color:#DFE0E7; color:white;">
					<a href="register"><input type="button" value="회원가입" class="btn"style="background-color:#DFE0E7; color:white;"> </a>
					<br>
					</tbody>


				</c:if>

			</form>

			<c:if test="${not empty loginUserid}">
				<form action="logout" method="get">
					${loginUserid}님, 환영합니다 <input type="submit" id="btn-logout" class="btn"
					style="background-color:#DFE0E7; color:white;"
						name="btn-logout" value="로그아웃" style="margin-right: 10px"><br>
					<a href="member_detail" class="text-align:right">마이페이지(test)</a>
				</form>
			</c:if>

			<!-- 로그인 후에 이동할 페이지 -->
			<input type="hidden" name="queryString" value="${loginTarget}" />
		</div>


		<br>
		<form action="search" method="get" class="text-center" style="margin-left: 50px; ">
			<select name="searchType" style="height:27px">
				<option value="1">노래 제목</option>
				<option value="2">가수</option>
				<option value="3">앨범명</option>
				<option value="4">장르별</option>
			</select> <input type="text" name="searchKeyword" placeholder="검색어"
				style="width: 500" /> <input type="submit" value="검색" class="btn " style="background-color:#1C1637; color:white;" />
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

		<!-- 본문 -->
		<!-- 배너 Slideshow  -->
		<div class="container-center" style="background:#E8E5F7;"> 
		<div class="float:center" style="width: 970; height: auto;">

			<img class="Slides" src="././resources/images/title1.jpg"
				style="width: 970px; height: auto; object-fit: cover;">
			<img class="Slides" src="././resources/images/title2.jpg"
				style="width: 970; height: auto; object-fit: cover;">
			<img class="Slides" src="././resources/images/title3.jpg"
				style="width: 970; height: auto; object-fit: cover;"> 
			<img class="Slides" src="././resources/images/title4.jpg"
				style="width: 970; height: auto; object-fit: cover;">
			<img class="Slides" src="././resources/images/title5.jpg"
				style="width: 970; height: auto; object-fit: cover;">
			<img class="Slides" src="././resources/images/title6.jpg"
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

			// 배너 수동 슬라이드 (주석처리함)
		/* 	function plusDivs(n) {
				showDivs(slideIndex += n);
			}

			function showDivs(n) {
				var i;
				var x = document.getElementsByClassName("Slides");
				var cnt = 0;
				if (n > x.length) {
					slideIndex = 1
				}
				if (n < 1) {
					slideIndex = x.length
				}
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				x[slideIndex - 1].style.display = "block";
			} */
			
			
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
		<h2 style="color: lightgrey">최신 앨범</h2><!-- 
		<section class="sectionPadding contents newAlbum"
			style="border: 1px solid lightgrey; background: #E8E5F7;"> -->
			<div class="innerContainer" style="overflow:scroll; white-space:nowrap;border: 1px solid lightgrey; background: #E8E5F7;">
				<ul class="albumList" id="newalbum_place">
					<li class="albumListLi">
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge"></p>
								<a href=""> <span class="mainMask"></span> <img
									src="././resources/images/wj_20122134.jpg" alt="앨범 대표 이미지"
									style="wigth: 150; height: 150">
								</a>
							</div>
						</figure>
					</li>
					<li class="albumListLi" id="albumListLi">
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge"></p>
								<a href=""> <span class="mainMask"></span> <img
									src="././resources/images/wj_20118739.jpg" alt="앨범 대표 이미지"
									style="wigth: 150; height: 150">
								</a>
							</div>
						</figure>
					</li>
					<li class="albumListLi" id="albumListLi">
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge"></p>
								<a href=""> <span class="mainMask"></span> <img
									src="././resources/images/m81.jpg" alt="앨범 대표 이미지"
									style="wigth: 150; height: 150">
								</a>
							</div>
						</figure>
					</li>
					
					<li class="albumListLi" id="albumListLi">
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge"></p>
								<a href=""> <span class="mainMask"></span> <img
									src="././resources/images/m46.jpg" alt="앨범 대표 이미지"
									style="wigth: 150; height: 150">
								</a>
							</div>
						</figure>
					</li>
					
					<li class="albumListLi" id="albumListLi">
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge"></p>
								<a href=""> <span class="mainMask"></span> <img
									src="././resources/images/wj_20131761.jpg" alt="앨범 대표 이미지"
									style="wigth: 150; height: 150">
								</a>
							</div>
						</figure>
					</li>
					<li class="albumListLi" id="albumListLi">
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge"></p>
								<a href=""> <span class="mainMask"></span> <img
									src="././resources/images/m75.jpg" alt="앨범 대표 이미지"
									style="wigth: 150; height: 150">
								</a>
							</div>
						</figure>
					</li>
					<li class="albumListLi" id="albumListLi">
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge"></p>
								<a href=""> <span class="mainMask"></span> <img
									src="././resources/images/m42.jpg" alt="앨범 대표 이미지"
									style="wigth: 150; height: 150">
								</a>
							</div>
						</figure>
					</li><li class="albumListLi" id="albumListLi">
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge"></p>
								<a href=""> <span class="mainMask"></span> <img
									src="././resources/images/wj_20133356.jpg" alt="앨범 대표 이미지"
									style="wigth: 150; height: 150">
								</a>
							</div>
						</figure>
					</li>
					

				</ul>

			</div>






		<hr />
		<!--  best 차트 (10곡)  -->
		<!--  chart 완성되고나면 하기  -->
		<div class="container">
			<form>
				<input type="checkbox" name="choose_all" value="1"> <input
					type="button" id="cart" name="cart" value="마이리스트에 담기"> <input
					type="button" id="mp3_down" name="mp3_down" value="MP3 다운">
				<input type="button" id="listening_all" name="listening_all"
					value="전체 듣기(재생목록에 추가)"> <input type="button"
					id="change_listening" name="change_listening"
					value="전체 듣기(재생목록 교체)">
			</form>
		</div>

		<div class="container">
			<table class="table table-striped">
				<thead>
					<tr>
						<th></th>
						<th>순위</th>
						<th>곡명</th>
						<th>아티스트</th>
						<th>앨범</th>
						<th>가사</th>
						<th>내앨범</th>
						<th>MP3다운</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="music" items="${music}">
						<tr>
							<td width="30" bordercolor="grey"><input type="checkbox"
								name="choose" value="2"></td>
							<td>${music.mid}</td>
							<td>${music.mtitle}</td>
							<td>${music.martist}</td>
							<td>${music.malbum}</td>
							<td><a href="${music.mlyrics}"><img alt="가사"
									src="../resources/images/lyrics.png"></a></td>
							<td><a href=""><img alt="내앨범"
									src="../resources/images/myalbum.png"></a></td>
							<td><a href=""><img alt="MP3다운"
									src="../resources/images/mp3.png"></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>




	</div>
</body>
</html>

