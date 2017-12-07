<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Home</title>
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
<form action="monthly_pay">
<input type="submit" value="이용권 구매" >
</form>
	<!--  로그인폼 오른쪽으로 가야행 !!!~  -->
	<!-- 타이틀 -->
	<h1 class="text-center" style="color: purple">PODO DREAM</h1>


	<form action="search" method="get" class="text-center">
		<select name="searchType">
			<option value="1">노래 제목</option>
			<option value="2">가수</option>
			<option value="3">앨범명</option>
			<option value="4">장르별</option>
			<!-- 수진아 장르별 검색도 추가했덩 ^^- 우정 -->
		</select> <input type="text" name="searchKeyword" placeholder="검색어" /> <input
			type="submit" value="검색" class="btn btn-primary" />

	</form>
	<div class="topnav" id="myTopnav">
		<a class="active" href="">홈</a> <a href="podo/chart">차트</a> <a href=""></a>
		<a href=""></a>
	</div>


	<!-- 본문 -->
	<div>
		<div class="container">
			<form></form>
		</div>
		<div class="container" style="float: right">

			<form action="login-post" method="post">
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
										style="height: 52px">로그인</button>
									<br>
					</table>
					<td><a href="register">회원가입 </a>
				</c:if>
			</form>
			<table>
				<c:if test="${not empty loginUserid}">
					<form action="logout" method="get">

						${loginUserid}님, 환영합니다 <input type="submit" id="btn-logout"
							name="btn-logout" value="로그아웃"><br> <a
							href="member_detail">마이페이지(test)</a>

					</form>
				</c:if>
				<tr>
				</tr>
				<tr>

					<!-- 로그인 했을때 "마이페이지" 라는 <a>태그가 보일 수 있게 바꿔야함-->

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
</body>
</html>
