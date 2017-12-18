
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




</style>



</head>



<body>


	<div class="container" style="width:970px;">
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
		
		
		
		
<div class="container" style="width:930px; ">
  <h2>F & A(자주 묻는 질문)</h2><br/>
   <div class="panel-group" id="accordion" >
    <div class="panel panel-default">
      <div class="panel-heading"style=" background-color:#C5C4CB; color:white;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">1. 회원가입 </a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
        <div class="panel-body">1-1. 회원가입 방법<br/> 1) PODO 홈에서 회원가입버튼을 클릭<br/>2) 양식에 맞게 정보를 입력해주세요<br/>3) 회원가입 버튼 클릭 <br/><br/> 
        1-2. 회원정보 수정 방법<br/> 1) 로그인 후, 마이페이지 버튼 클릭<br/> 2)왼쪽 프로필란에 '회원 정보 수정' 버튼 클릭<br/><br/>
        1-3. 회원 탈퇴 방법<br/> 탈퇴는 불가합니다.   </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading"style=" background-color:#C5C4CB; color:white;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">2. 포인트 </a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">2-1. 포인트 쌓는 법 <br/>1) 메뉴바 '이벤트' 클릭 <br/>2) 출석체크시, 10point 증정<br/> *(출석체크는 하루에 한 번만 가능합니다) 
        <br/><br/> 2-2. 포인트 사용법 <br/> 1) 메뉴바 '이용권' 클릭 <br/> 2) 결제 하려는 이용권 선택 후, 결제하기 버튼 클릭 <br/> 3) 남은 포인트칸에서 남은포인트를 확인하고 쓰려는 포인트를 입력해주세요. <br/>
         </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading"style=" background-color:#C5C4CB; color:white;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">3. 문의사항 </a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">기타 문의사항은 Q&A 칸에서 새 글 작성 버튼을 클릭해주세요.</div>
      </div>
    </div>
  </div> 
</div>
		
		
		
		
		
		
		
		<br/><br/>
		<hr/>

<div class="container" style="width:930px;">
 <h2>Q & A</h2><br/>

			

<ul>
	
	<c:if test="${empty loginUserid }">
	<a  href="" class="btn btn-primary" onclick="boardregister()" style="background-color:#D9D5E1;border: none;color:white; color:#33303A;float:right;"> 새 글 작성</a>
	</c:if>
	<c:if test="${not empty loginUserid}">
	<a href="boardregister"  class="btn btn-primary" onclick="boardregister()"style="background-color:#D9D5E1;border: none;color:white; float:right;">새 글 작성 </a></c:if>
	
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

<div class="container" style="width: 970px;">
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



</div>
		
		
		
		

</body>
</html> 

