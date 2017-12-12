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




ul {
	overflow: auto;
	list-style-type: none;
}

li {
	float: left;
	display: inline;
  
} 

a{
outline: none; text-decoration:none; color: #555;
}
img{barder:0;}



#newalbum_place{

	top: 50%; left: 60px; margin-top:=280px;

}


#newalbum_place ul{
top:50%; left: 0px; margin-top:200; width: 200px; height:200px;


}


#newalbum_place li{
	float:left; 
	font-size: 15px;
	font-weight: bold;
	color: black; 
	width: 200px; 
	height: 200px;
	margin: 10px; 
	margin-top: 20px;
	box-sizing: border-box;
	folat: left; 
	background: #fff;
	border-radius: 5px; 
	box-shadow: 3px 3px 3px #bbb; 
	overflow: hidden; 
	transition: all 0.7s;
	
	
	
}
#newalbum_place li:hover{
color: lightgrey;}

#newalbum_place li.on{ color : lightgrey;}

/* .navbar-inverse {

	background-color: #4D408A;
	color: white;
} */
/* 
.innerContainer {


}


.innerContainer li {

  position: relative;
  z-index: 10; 
  list-style: none; 
  margin: 0;
  padding: 2px; 
  max-height: 50px; 
  overflow-y: scroll;
  overflow-x: scroll;
}

.innerContainer ul{

   margin: 0;
   padding: 0 4px;
   border-radius: 2px;
   max-width: 10em;
   

   white-space: nowrap;
   color: black;
   cursor: pointer; 
   
}
 */


section{top:50%; left: 0px; margin-top:200; width: 200px; height:200px;}
article{
	position : relative; 
	top: 50%;
	width: 180px; 
	height: 100px;
	margin: 10px; 
	margin-top: 200px;
	box-sizing: border-box;
	folat: left; 
	background: #fff;
	border-radius: 5px; 
	box-shadow: 3px 3px 3px #bbb; 
	overflow: hidden; 
	transition: all 0.7s;

}




</style>



</head>


<body>


	<div class="container" style="width:1000px;">
		<!-- 타이틀 -->
		<h1 class="text-center">
			<a href="http://localhost:8181/ex00/"style="text-decoration:none;">PODO DREAM</a>
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
		<form action="search" method="get" class="text-center"
			style="margin-left: 50px">
			<select name="searchType">
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
		
		<h1>이벤트 페이지</h1>

</body>
</html>