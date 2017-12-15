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
    overflow: hidden;
    float: left;
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

#ptitle {
	width: 70%;
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
			if ('${loginfail}' == 5) {
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
	<img src="././resources/images/grape.png" height="80%"> <p>포도차트</p>
</div>

<br>
<br>
<br>


<!--  차트 상단 버튼 -->
<div class="container">
<form action="playlist" method="post"  style="display: inline;">
 <!--   <form id="chk_box">
  	  	<input type="checkbox" id="choose_all" name="choose_all">
   </form> -->
     <div class="dropdown"  style="display: inline;">
			<button id="cart" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">마이리스트에 담기</button>
			<ul class="dropdown-menu" id="cart-list">
				<li>마이맬범에 담기</li>
				<li class="divider"></li>
				<li><input id="ptitle" type="text" name="ptitle" placeholder="새 앨범" />
				<input id="btn-insert" type="button" value="확인"/></li>		
				<li><input id="userid" name="userid" type="hidden" value="${loginUserid}" /></li>
			    <ul id="playlists">
			       <!-- Ajax로 플레이리스트 가져오기 -->
			    </ul>
			</ul>
	</div>
</form>
			<button id="mp3_down" class="btn btn-default" >MP3 다운</button>
			<button id="listening_all" class="btn btn-default">전체 듣기</button>
			<button id="change_listening" class="btn btn-default">선택 듣기</button>
</div>


<div class="container" style="width:1000px;" >
<form id="tbl_form" method="post">
   <table class="table table-striped" >
    	<thead>
	    	<tr>
		    	<th><input type="checkbox" id="choose_all" name="choose_all"></th>
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
      <%int rank = 0; %>
        <c:forEach var="music" items="${music}">
	   	    <tr>           
		   	  <td width="30" bordercolor="grey"><br><input type="checkbox" id="cb_choose" name="cb_choose" value="${music.mid}" data-mid="${music.mid}"></td>
		 	   <td id="mid"><br>
		 	   <%rank+=1; 
		 	   out.print(rank+"");
		 	   %></td>
		 	   <td>
		 	   		<a href="music_detail?mid=${music.mid }">
		 	   		<img id="albumart" alt="자켓이미지" src="././resources/images/${music.malbumart}">
		 	   		</a>
		 	   	</td>
		 	   <td>
		 	   		<br><a href="music_detail?mid=${music.mid }" style="text-decoration: none;">
		 	   		${music.mtitle}
		 	   		</a>
		 	   </td>
		 	   <td><br>${music.martist}</td>
		 	   <td><br>${music.malbum}</td>
		 	   <td><a href="${music.mlyrics}"><br><img alt="가사" src="././resources/images/t_lyrics.png"></a></td>
		 	   <td><a href=""><br><img alt="내앨범" src="././resources/images/t_myalbum.png"></a></td>
		 	   <td><a href="mp3_down_icon?mid=${music.mid}" id="down_icon"><br><img alt="MP3다운" src="././resources/images/t_mp3.png" name="down_icon"></a></td>		 	   	   	    
		    </tr>
		    
		 </c:forEach>
	  </tbody>
   </table>
</form>
</div>


<script>
$(function(){
	// 체크 된 값의 mid 컨트롤러에 넘기기
	$('#mp3_down').click(function() {
		if(${empty loginUserid}){
			alert('로그인을 했는지 확인하세요!!');
		} else {
			alert('선택한 MP3 목록 다운 완료');
			$('#tbl_form').attr('action', 'mp3_down');
			$('#tbl_form').submit();
		}
	});
	
	// 체크박스 전체 선택
	$('#choose_all').click(function(){
		if($('#choose_all').prop('checked')){
			$('input[type=checkbox]').prop('checked',true);
		}else{
			$('input[type=checkbox]').prop('checked',false);
		}
	});
	
	$('img[name=down_icon]').click(function(){
		if(${empty loginUserid}){
			alert('로그인을 했는지 확인하세요!!');
		} else {
			alert('선택한 MP3 목록 다운 완료');
		}
	});
});

// 플레이리스트 담기 리스트 목록 보여주기 런타임 
$(function() {        
        $("#cart-list").hide();
            
        $("#cart").click(function() {
        	
          $("#cart-list").slideToggle(500);
        });             
 });
 
 
$(document).ready(function(){
  var userid = '${loginUserid}';
 function getAllPlaylists(){
	
	$.getJSON('/ex00/playlist/all/'+ userid, function(data){
		var playlist = '';
		
		$(data).each(function(){
			playlist += '<li style="list-style-type: none;">'	
						+'<a href="" >'
						+ this.ptitle 
						+'</a>'
			           + '</li>'  											
		});
		
		$('#playlists').html(playlist);
	});
	
}
getAllPlaylists();

	//insert 하는 함수
	function insertPlaylist(){
		var ptitle = $('#ptitle').val();
		var userid = '${loginUserid}';
		
		$.ajax({
			type: 'post',
			url: '/ex00/playlist/',
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'POST'
			},
			data: JSON.stringify({
				'ptitle': ptitle,
				'userid': userid
			}),
			success: function(result){ 
				if(result === 'success'){ //성공
					getAllPlaylists();
				}else{
					alert('실패');
				}
			}
		});
		
		
		
	}
	
	//중복 체크하는 함수
	function checkTitle(){
		var ptitle = $('#ptitle').val();
		
		$.getJSON('/ex00/playlist/check/' + ptitle, function(data){
			var replyList = null;
			
			$(data).each(function(){
				replyList = this.ptitle;
			});
			
			if(replyList == null){
				//중복되는거 없으면 insert
				insertPlaylist();
			} else {
				alert('중복된 이름입니다.앨범명을 다시 입력해주세요!');
					
			}
		});
	}
	
	$('#btn-insert').click(function(){
		checkTitle();
	});

});
</script>


</body>
</html>