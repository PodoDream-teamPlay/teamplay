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
<style>
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
</style>
</head>
<body>

	<!--  로그인폼 오른쪽으로 가야행 !!!~  -->
	<!-- 타이틀 -->
	<h1 class="text-center" style="color: purple">PODO DREAM</h1>


	<form action="search" method="get" class="text-center">
		<select name="searchType">
			<option value="1">노래 제목</option>
			<option value="2">가수</option>
			<option value="3">앨범명</option>
			<option value="4">장르별</option>
		</select> <input type="text" name="searchKeyword" placeholder="검색어" /> <input
			type="submit" value="검색" class="btn btn-primary" />

	</form>
	<div class="topnav" id="myTopnav" align="center">
		<a class="active" href="">홈</a> 
		<a href="podo/chart">차트</a> 
		<a href=""></a>
		<a href=""></a>
		<a href=""></a><a href=""></a><a href=""></a>
		
		<!-- 로그인  -->
		<div align="right">
			<form action="login-post" method="post" >
				<c:if test="${empty loginUserid}">
					<table>
						<thead></thead>
						<tbody>
							<tr>
								<td><input type="text" name="userid" id="userid"
									placeholder="아이디" required autofocus /> <br> <input
									type="password" name="password" id="password"
									placeholder="비밀번호" required /></td>
								<td rowspan="2">

									<button id="btn-login" class="text-right btn"
										style="height: 52px">로그인</button> <br>
					</table>
					<td><a href="register">회원가입 </a>
				</c:if>
			</form>
			<table>
				<c:if test="${not empty loginUserid}">
					<form action="logout" method="get" style="color:white" >
						${loginUserid}님, 환영합니다
						 <input type="submit" id="btn-logout"
							name="btn-logout" value="로그아웃"><br>
							 <a href="member_detail" class="text-align:right">마이페이지(test)</a>

					</form>
				</c:if>
				<tr>
				</tr>
				<tr>
				</tr>
				</tbody>
			</table>
			<!-- 로그인 후에 이동할 페이지 -->
			<input type="hidden" name="queryString" value="${loginTarget}" />
			</div>
		</div>



	<script>
		$(document).ready(
				function() {
					$('#btn-login').click(
							function() {
								console.log(location.href);
								location = encodeURI('/podo/member/login?url='
										+ location.href);
							});
					$('#btn-logout').click(function() {
						location = '/podo/member/logout'
					});

				});
	</script>
		


	<!-- 본문 -->
		<!-- 배너 Slideshow  -->
		<div class="container-center" style="width:870; height:330; text-align:center; margin:10px 20px 30px 40px;"  >
	
			<img class="Slides" src="././resources/images/wj_20065430.jpg" style="width:870; height:330; object-fit: cover;">
			<img class="Slides" src="././resources/images/wj_20050546.jpg" style="width:870; height:330; object-fit: cover;">
			<img class="Slides" src="././resources/images/wj_20034282.jpg" style="width:870; height:330; object-fit: cover;">
			<img class="Slides" src="././resources/images/wj_20107410.jpg" style="width:870; height:330; object-fit: cover;">
			<img class="Slides" src="././resources/images/wj_279351.jpg" style="width:870; height:330; object-fit: cover;">
			<button onclick="plusDivs(-1)"
				class="button display left">◀</button>
			<button onclick="plusDivs(1)"
				class="button display right">▶</button>
		</div>
		<script>
			// 배너 슬라이드 스크립트 부분 시작 
			var slideIndex = 1;
			showDivs(slideIndex);

			function plusDivs(n) {
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
				x[slideIndex-1].style.display = "block";
			 } 
			
		</script>
		
		
		
		<!--  최신 앨범 리스트 ( 한줄로 넘어가게 하기)  -->
		<h2 style="color:lightgrey">최신 앨범</h2>
		<section class="sectionPadding contents newAlbum" style="border: 1px solid lightgrey; background: lightgrey;margin:10px 20px 30px 40px;" >
			<div class="innerContainer">
				<ul class="list titleView lineBreakArea albumList" id= "newalbum_place">
					<li>
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge">
								</p>
								<a href="">
								<span class="mainMask"></span>
								<img src="././resources/images/wj_279351.jpg" alt="앨범 대표 이미지" style="wigth:150; height:150">
								</a>
							</div>
						</figure>
						</li>
						<li>
						<figure class="albumInfo">
							<div class="thumbnaiil">
								<p class="badge">
								</p>
								<a href="">
								<span class="mainMask"></span>
								<img src="././resources/images/wj_20122134.jpg" alt="앨범 대표 이미지" style="wigth:150; height:150">
								</a>
							</div>
						</figure>
						</li>
					
				</ul>
			
			</div>	
		</section>
		
		
		
		
		<!--  best 차트 (10곡)  -->
		
		<div class="container">
   <form>
  	  <input type="checkbox" name="choose_all" value="1">
  	  <input type="button" id="cart" name="cart" value="마이리스트에 담기">
	  <input type="button" id="mp3_down" name="mp3_down" value="MP3 다운">
	  <input type="button" id="listening_all" name="listening_all" value="전체 듣기(재생목록에 추가)">
	  <input type="button" id="change_listening" name="change_listening" value="전체 듣기(재생목록 교체)">
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
		   	   <td width="30" bordercolor="grey"><input type="checkbox" name="choose" value="2"></td>
		 	   <td>${music.mid}</td>
		 	   <td>${music.mtitle}</td>
		 	   <td>${music.martist}</td>
		 	   <td>${music.malbum}</td>
		 	   <td><a href="${music.mlyrics}"><img alt="가사" src="../resources/images/lyrics.png"></a></td>
		 	   <td><a href=""><img alt="내앨범" src="../resources/images/myalbum.png"></a></td>
		 	   <td><a href=""><img alt="MP3다운" src="../resources/images/mp3.png"></a></td>		 	   
		    </tr>
		 </c:forEach>
	  </tbody>	
   </table>
</div>
		
		


		
</body>
</html>
