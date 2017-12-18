<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
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

.topnav {
    overflow: hidden;
    float: left;
    color: black;
    text-align: center;
    width: 100%;
    height: auto;
    font-size: 30px;
}

table, th, td{
	border: 1px solid white;
}

table {
	width: 100%;
}
p {
	display: inline;
}

#albumart {
  width: 65px;
  height: 65px;
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
					${loginUserid}님, 환영합니다
					<input type="submit" id="btn-logout" class="btn" style="background-color:#DFE0E7; color:white;"
						name="btn-logout" value="로그아웃" style="margin-right: 10px" required autofocus><br>
					<a href="member_detail" class="text-align:right">마이페이지(test)</a>
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
					<li><a href="boardFnA">F&A</a></li>
					
				</ul>
			</div>
		</nav>





<br>

<div class="topnav" id="myTopnav">
	<c:if test="${topnavTitle eq '2000sBallad'}">
		<img src="././resources/images/banner02.png"
		style="width: 970; height: auto; object-fit: cover;"> 
	</c:if>
	<c:if test="${topnavTitle ne '2000sBallad'}">
		[ ${topnavTitle } ] 검색 결과
	</c:if>
	<hr>
</div>

<br>
<br>
<br>

<div class="container">
   <form>
  	  <input type="checkbox" name="choose_all" value="1">
  	  <input type="button" id="cart" name="cart" value="마이리스트에 담기">
	  <input type="button" id="mp3_down" name="mp3_down" value="MP3 다운">
	  <input type="button" id="listening_all" name="listening_all" value="전체 듣기(재생목록에 추가)">
	  <input type="button" id="change_listening" name="change_listening" value="전체 듣기(재생목록 교체)">
   </form>
</div>

<div class="container" >
   <table class="table table-striped" >
    	<thead>
	    	<tr>
		    	<th></th>
		    	<th><span id="t_head">순위</span></th>
		    	<th><span class="hidden">앨범이미지</span></th>
			    <th><span id="t_head">곡명</span></th>
			    <th><span id="t_head">아티스트</span></th>
			    <th><span id="t_head">앨범</span></th>
		    	<th>가사</th>
		    	<th>내앨범</th>
		    	<th>MP3다운</th>
		   </tr>
	  </thead>
      <tbody>
        <c:forEach var="music" items="${musicList}">
	   	    <tr>           
		   	   <td width="30" bordercolor="grey"><input type="checkbox" name="choose" value="2"></td>
		 	   <td>${music.mid}</td>
		 	   <td><img id="albumart" alt="자켓이미지" src="././resources/images/${music.malbumart}"></td>
		 	   <td><a href="music_detail?${music.mid}">${music.mtitle}</a></td>
		 	   <td>${music.martist}</td>
		 	   <td>${music.malbum}</td>
		 	   <td><a href="${music.mlyrics}"><img alt="가사" src="././resources/images/t_lyrics.png"></a></td>
		 	   <td><a href=""><img alt="내앨범" src="././resources/images/t_myalbum.png"></a></td>
		 	   <td><a href=""><img alt="MP3다운" src="././resources/images/t_mp3.png"></a></td>		 	   	   	    
		    </tr>
		 </c:forEach>
	  </tbody>
   </table>
</div>


</div>
</body>
</html>