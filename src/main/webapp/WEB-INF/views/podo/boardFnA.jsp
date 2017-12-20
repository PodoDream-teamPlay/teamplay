
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




#innercontainer li {
float: left;
	display: inline;
  
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
	overflow: auto;
	list-style-type: none;
   margin: 0;
   padding: 0 4px;
   border-radius: 2px;
   max-width: 10em;

   white-space: nowrap;
   color: black;
   cursor: pointer; 


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
					<li><a href="boardFnA" style="color: #1C1637; background-color: white; font-weight: 900;" id="nav-fanda">F&A</a></li>

				</ul>
			</div>
		</nav>
		</div>
</div>
</div> <!-- 상단 배경색 정하는 div -->



<br>
<br>


		
		
		
		
<div class="container" style="width:930px; ">
  <h2><img alt="F&A" src="././resources/images/fna.png"></h2><br/>
   <div class="panel-group" id="accordion" >
    <div class="panel panel-default">
      <div class="panel-heading"style=" background-color:#1C1637; color:white;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"style="font-family:배달의민족 주아;">1. 회원가입 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼ </a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse"style="font-family:배달의민족 주아;">
        <div class="panel-body"style="font-family:배달의민족 주아;">1-1. 회원가입 방법<br/> 1) PODO 홈에서 회원가입버튼을 클릭<br/>2) 양식에 맞게 정보를 입력해주세요<br/>3) 회원가입 버튼 클릭 <br/><br/> 
        1-2. 회원정보 수정 방법<br/> 1) 로그인 후, 마이페이지 버튼 클릭<br/> 2)왼쪽 프로필란에 '회원 정보 수정' 버튼 클릭<br/><br/>
        1-3. 회원 탈퇴 방법<br/> 탈퇴는 불가합니다.   </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading"style=" background-color:#1C1637; color:white;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"style="font-family:배달의민족 주아;">2. 포인트  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body" style="font-family:배달의민족 주아;">2-1. 포인트 쌓는 법 <br/>1) 메뉴바 '이벤트' 클릭 <br/>2) 출석체크시, 10point 증정<br/> *(출석체크는 하루에 한 번만 가능합니다) 
        <br/><br/> 2-2. 포인트 사용법 <br/> 1) 메뉴바 '이용권' 클릭 <br/> 2) 결제 하려는 이용권 선택 후, 결제하기 버튼 클릭 <br/> 3) 남은 포인트칸에서 남은포인트를 확인하고 쓰려는 포인트를 입력해주세요. <br/>
         </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading"style=" background-color:#1C1637; color:white;font-family:배달의민족 주아;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"style="font-family:배달의민족 주아;">3. 문의사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body"style="font-family:배달의민족 주아;">기타 문의사항은 Q&A 칸에서 새 글 작성 버튼을 클릭해주세요.</div>
      </div>
    </div>
  </div> 
</div>
		
		
		
		
		
		
		
		<br/><br/>
		<hr/>

<div class="container" style="width:930px;">
 <h2><img alt="F&A" src="././resources/images/qna.png"></h2>
<ul style="display:inline;">
	
	<c:if test="${empty loginUserid }">
	<a  href="" class="btn btn-primary" onclick="boardregister()" style="background-color:#1c1637;border: none;font-family:배달의민족 주아; color:white;float:right;"> 새 글 작성</a>
	</c:if>
	<c:if test="${not empty loginUserid}">
	<a href="boardregister"  class="btn btn-primary" onclick="boardregister()"style="background-color:#1c1637;border: none;font-family:배달의민족 주아;color:white; float:right;">새 글 작성 </a></c:if>
	
	</ul>
</div>
	<script type="text/javascript">
	function boardregister() {
		if (${not empty loginUserid}) {
		} else {
			alert('로그인이 필요합니다');	
		}
	}

</script>


<hr/>


<!--  게시물 검색  -->
<!-- <form action="search" method="get"class="text-center">
    <select name="searchType">
        <option value="1">작성자</option>
        <option value="2">제목</option>
        <option value="3">제목 + 내용</option>
    </select>
    <input type="text" name="searchKeyword" placeholder="검색어"/>
    <input type="submit" value="검색"class= "btn btn-primary" />
</form>
 -->

<div class="container" style="width: 970px; height: auto;">
<table class="table table-hover;">
	
	<thead style="background: white; opacity:0.9;">
	<tr>
		<th>글 번호</th>
		<th>제목 </th>
		<th>작성자</th>
		<th>수정시간</th>
	</tr>
	</thead>
	
	
	<tbody  style=" background: white; opacity:0.6;">
		<c:forEach var="board" items="${boardList}"> 
		<tr>
			<td>${board.bno}</td>
			  <td>
                    <a href="boarddetail?bno=${board.bno}">${board.title}</a>
                           </td>
			<td>${board.userid}</td>
		
			<td>
				<fmt:formatDate var="regdate" value="${board.regdate}" pattern="yyyy/MM/dd HH:mm"/>${regdate}
			</td>
		</tr>
		</c:forEach>
	
	</tbody>

</table>
</div>



		
		
		
		
	<div>
<img src="././resources/images/logo11.png" alt=" "style="margin-top:100px;"/>
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

