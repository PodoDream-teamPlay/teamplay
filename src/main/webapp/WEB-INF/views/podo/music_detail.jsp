<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.m_detail_th {
	width: 200px;
	padding: 10px;
}

.m_detail_td {
	padding: 10px;
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

<div class="container">
		<!-- 본문 -->
		<div style="float: center;">
			<div style="font-size: 40px; font-weight: bold; margin: 20px;">
				${music.mtitle }</div>
			<table>
				<tr>
					<td><img class="albumart" alt="자켓이미지"
						src="././resources/images/${music.malbumart}"
						style="width: 300px; height: 300px;"></td>
					<td style="padding: 20px; border: 1px solid #2E2E2E;">
						<table style="font-size: 18px;">
							<tr>
								<th class="m_detail_th">제목</th>
								<td class="m_detail_td">${music.mtitle }</td>
							</tr>
							<tr>
								<th class="m_detail_th">앨범</th>
								<td class="m_detail_td">${music.malbum }</td>
							</tr>
							<tr>
								<th class="m_detail_th">아티스트</th>
								<td class="m_detail_td">${music.martist }</td>
							</tr>
							<tr>
								<th class="m_detail_th">발매일</th>
								<td class="m_detail_td">${music.mdate }</td>
							</tr>
						</table>
				</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<br>
					<c:if test="${not empty music.mvideo }">
						<iframe
							width="853" height="480"
							src="${music.mvideo}"
							frameborder="0" gesture="media" allow="encrypted-media"
							allowfullscreen>
						</iframe>
					</c:if>
					<c:if test="${empty music.mvideo }">
						<div style="width: 853; height: 480; 
						background-color: #E6E6E6; color: white; text-align: center;">
						뮤직비디오가 없습니다.
						</div>
					</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"
						style="padding: 20px; font-size: 15px; font-weight: bold;">
						가사</td>
				</tr>
				<tr>
					<td colspan="2">
					<!-- 
						<textarea rows="150" cols="100" readonly
							style="border: none; margin-top: 30px; text-align: center; width: 970px;">${music.mlyrics}
						</textarea>
					 -->
					 <pre style="border: none;margin-top: 30px; text-align: center; background-color: white; width: 970px;">${music.mlyrics }
					 </pre>
					</td>
				</tr>
			</table>
		</div>
		<!-- 본문 끝 -->

	</div>
</body>
</html>










					








