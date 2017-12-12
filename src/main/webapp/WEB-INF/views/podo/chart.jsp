<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
 <!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

.topnav {
    background-color: #4D408A;
    overflow: hidden;
    float: left;
    color: #CBC1FA;
    text-align: center;
    width: 100%;
    height: 52px;
    font-size: 35px;
}

hr{
	border: 3px double #ff1aff;
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

<div class="topnav" id="myTopnav">
	<img src="../resources/images/grape.png" height="80%"> <p>포도차트</p>
</div>

<br>
<br>
<br>


<!-- <br>
<br>
<br>
<nav class="navbar">
<div class="container">
 <ul class="nav navbar-nav">
   
  	  <li><input type="checkbox" name="choose_all" value="1"></li>
  	  <li><a class="dropdown-toggle" data-toggle="dropdown" href="#">담기</a> 
  	    <ul class="dropdown-menu">
  	      <li><a href="#">재생목록 1</a></li>
  	    </ul>
  	   </li>
	  <li><input type="button" id="mp3_down" name="mp3_down" value="MP3 다운"></li>
	  <li><input type="button" id="listening_all" name="listening_all" value="전체 듣기(재생목록에 추가)"></li>
	  <li><input type="button" id="change_listening" name="change_listening" value="전체 듣기(재생목록 교체)"></li>
   
 </ul> 
</div>
</nav>
 -->



<div class="container">
   <form id="chk_box">
  	  	<input type="checkbox" id="choose_all" name="choose_all">
   </form>
   <button id="cart">마이리스트에 담기</button>
   <button id="mp3_down">MP3 다운</button>
   <button id="listening_all">전체 듣기</button>
   <button id="change_listening">선택 듣기</button>
</div>

<div class="container" >
<form id="tbl_form" method="post">
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
        <c:forEach var="music" items="${music}">
	   	    <tr>           
		   	   <td width="30" bordercolor="grey"><input type="checkbox" id="cb_choose" name="cb_choose" value="${music.mid}" data-mid="${music.mid}" required="required"></td>
		 	   <td id="mid">${music.mid}</td>
		 	   <td><img id="albumart" alt="자켓이미지" src="././resources/images/${music.malbumart}"></td>
		 	   <td>${music.mtitle}</td>
		 	   <td>${music.martist}</td>
		 	   <td>${music.malbum}</td>
		 	   <td><a href="${music.mlyrics}"><img alt="가사" src="././resources/images/t_lyrics.png"></a></td>
		 	   <td><a href=""><img alt="내앨범" src="././resources/images/t_myalbum.png"></a></td>
		 	   <td><a href=""><img alt="MP3다운" src="././resources/images/t_mp3.png"></a></td>		 	   	   	    
		    </tr>
		    
		 </c:forEach>
	  </tbody>
   </table>
</form>
</div>
</div>

<script>
$(function(){
	// 체크 된 값의 mid 컨트롤러에 넘기기
	$('#mp3_down').click(function() {
		$('#tbl_form').attr('action', 'mp3_down');
		$('#tbl_form').submit();
	});
	
	// 체크박스 전체 선택
	$('#choose_all').click(function(){
		if($('#choose_all').prop('checked')){
			$('input[type=checkbox]').prop('checked',true);
		}else{
			$('input[type=checkbox]').prop('checked',false);
		}
	});
	
	// 체크 박스 개별 선택
	$('input:checkbox[name="cb_choose"]').click(function(){
		if(this.checked){
			alert($(this).attr('data-mid'));
		}
	});
	
})
</script>

</body>
</html>