<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" />
<title>PODO</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!-- jQuery: Bootstrap JS 파일은 jQuery 라이브러리를 사용 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

#innercontainer ul {
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

#menu {
	list-style: none;
	float: center;
	margin: 0;
	padding: 0;
}

#menuLi {
	margin: 0;
	padding: 0;
	border: 0;
	float: left;
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

#nav-chart:hover, #nav-jenre:hover, #nav-charge:hover, #nav-event:hover,
	#nav-fanda:hover, #nav-home:hover {
	background-color: #8d8a9b;
}

#nav-jenre:active, #nav-jenre:visited {
	background-color: #8d8a9b;
}
</style>



</head>



<body>

	<div style="background-color: #1C1637">
		<!-- 상단 배경색 정하는 div -->
		<div class="container" style="width: 1200px;">
			<!-- 타이틀 -->
			<h1 class="text-center">
				<a href="http://localhost:8181/ex00/" style="text-decoration: none;">
					<img alt="grape" src="././resources/images/grape3.png"
					style="width: 58px;"> <img alt="PODO"
					src="././resources/images/podo_white.png">
				</a>
			</h1>



			<!-- 로그인  -->
			<div id="noline" style="float: right; margin-top: 20px;">
				<c:if test="${empty loginUserid}">
					<form action="login-post" method="post" id="noline">
						<table>
							<tr>
								<td><input type="text" name="userid" id="userid"
									placeholder="아이디" style="width: 150px; margin-right: 5px;"
									required autofocus /></td>
								<td rowspan="2"><input type="submit" id="btn-login"
									value="로그인" class="btn"
									style="background-color: #8d8a9b; color: white; height: 50px; font-weight: bold;">
								</td>
							</tr>
							<tr>
								<td><input type="password" name="password" id="password"
									style="width: 150px; margin-right: 5px;" placeholder="비밀번호"
									required /></td>
							</tr>
						</table>
						<a href="register" style="color: #8d8a9b;">회원가입</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=""
							style="color: #8d8a9b;">아이디·비밀번호 찾기</a> <br>
						</tbody>



					</form>
				</c:if>

				<c:if test="${not empty loginUserid}">
					<form action="logout" method="get">
						<table>
							<tr>
								<td>
									<p style="margin-right: 5px; color: white;">${loginUserid}님,
										환영합니다</p>
								</td>
								<td rowspan="2"><input type="submit" id="btn-logout"
									class="btn"
									style="background-color: #8d8a9b; color: white; height: 50px;"
									name="btn-logout" value="로그아웃"></td>
							</tr>
							<tr>
								<td><a href="member_detail" class="text-align:right"
									style="margin-right: 5px; color: #8d8a9b;">마이페이지</a></td>
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
			<form action="search" method="get" class="text-center"
				id="form-search">
				<input type="hidden" name="searchType" id="searchType" value="1">
				<table class="text-center"
					style="margin-left: 280px; border: 1px solid #8d8a9b;">
					<tr>
						<td><input type="text" name="searchKeyword" placeholder="검색"
							style="width: 580px; height: 42px; border: 3px solid #1C1637; margin: 5px;" />
						</td>
						<td>
							<!-- 검색 버튼 --> <a href="#" id="btn-search"
							style="text-decoration: none;"> <img alt="search"
								src="././resources/images/search_icon.png"
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
					style="width: 970px; display: inline-block; background-color: #1C1637; border: none; text-align: center;">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand navitem"
								href="http://localhost:8181/ex00/" style="color: #00FDFD;"
								id="nav-podo">PODO</a>
						</div>
						<ul class="nav navbar-nav">
							<li><a href="http://localhost:8181/ex00/"
								style="color: white;" id="nav-home"> 홈 </a></li>
							<li><a href="chart" style="color: white;" id="nav-chart">
									차트 </a></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#" style="color: white;"
								id="nav-jenre"> 장르 <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a href="search?searchType=4&searchKeyword=ballad">발라드</a></li>
									<li><a href="search?searchType=4&searchKeyword=dance">댄스</a></li>
									<li><a href="search?searchType=4&searchKeyword=indi">인디</a></li>
									<li><a href="search?searchType=4&searchKeyword=hiphop">힙합</a></li>
									<li><a href="search?searchType=4&searchKeyword=trot">트로트</a></li>
								</ul></li>
							<li><a href="monthpay" style="color: white;" id="nav-charge">이용권</a></li>
							<li><a href="event" style="color: white;" id="nav-event">이벤트</a></li>
							<li><a href="boardFnA" style="color: white;" id="nav-fanda">F&A</a></li>

						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- 상단 배경색 정하는 div -->

	<div class="container">
		<img src="././resources/images/boardlogo5.png" alt="게시글 상세보기"
			style="margin-top: 50px;">
		<hr />

		<form>
				<label for="title">
					<img src="././resources/images/boardlogo2_2.png" alt="제목">
				</label>
					<input type="text" name="title" id="title" style="width: 800px"
							value="${board.title }" readonly />
					<br/>
				<label for="content"><img
				src="././resources/images/boardlogo3_3.png" alt="내용"
				style="display: inline;"></label>
			<textarea rows="15" cols="130" name="content" id="content" readonly>${board.content}</textarea>
			<br /> <label for="userid"><img
				src="././resources/images/boardlogo4_4.png" alt="아이디"></label> <input
				type="text" name="userid" id="userid" value="${board.userid}"
				readonly /> <label for="regdate"><img
				src="././resources/images/boardlogo7.png" alt="작성시간"></label>
			<fmt:formatDate value="${board.regdate}" var="regdate"
				pattern="yyyy/MM/dd HH:mm:ss" />
			<input type="text" id="regdate" value="${regdate}" readonly /><br />

		</form>
		<br />
		<hr />

		<ul id="menu" class="float:center;">
			<c:if test="${not empty loginUserid}">

				<li id="menuLi"><a href="boardupdate?bno=${board.bno}"
					style="width: 80px; height: 40px; background-color: #1c1637; font-family: 배달의민족 주아; font-size: 16px; color: #fff; border: 2px solid lightgrey;"
					class="btn btn-primary;">수정하기</a></li>
				<li id="menuLi"><a href="delete?bno=${board.bno }"
					style="width: 80px; height: 40px; background-color: #1c1637; font-family: 배달의민족 주아; font-size: 16px; color: #fff; border: 2px solid lightgrey;"
					class="btn btn-primary;">삭제하기</a></li>
			</c:if>

			<li id="menuLi"><a href="boardFnA"
				style="width: 80px; height: 40px; background-color: #1c1637; font-family: 배달의민족 주아; font-size: 16px; color: #fff; border: 2px solid lightgrey;"
				class="btn btn-primary;">메인으로</a></li>
		</ul>
		<br /> <br />
		<hr />
		<h1 class="text-left">
			<img src="././resources/images/boardlogo8.png" alt="댓글">
		</h1>

		<c:if test="${not empty loginUserid}">
			<input type="hidden" name="bno" id="bno" value="${board.bno}"
				style="width: 35px;" readonly />
			<input type="text" name="rtext" id="rtext" placeholder="댓글을 입력하세요"
				style="width: 400px;" />
			<input type="text" name="replier" id="replier" value="${loginUserid}" readonly style="width: 50px;"/>
			<button type="button" id="btn-insert"
				style="width: 80px; height: 40px; background-color: #1c1637; font-family: 배달의민족 주아; font-size: 16px; color: #fff; border: 2px solid lightgrey;">댓글
				입력</button>
		</c:if>



		<hr />
		<h2 class="text-left">
			<img src="././resources/images/boardlogo9.png" alt="댓글목록">
		</h2>
		<div id="replies" style="height: 300px;"></div>


	</div>
	<script>
$(document).ready(function(){
	
	$(document).ready(function(){
		//검색할 댓글의 게시글 번호 
		var bno = $('#bno').val();
		
		
		
		// jQuery 에서 ajax에게 요청을 보내는 함수들중에서  
		//put, delete는 $.ajax({settings}) 이거랑 배우지않은 메소드 하나 알려주심!!!
		//$.getJSON(url, data, callback)
		// 해당 url로 HTTP GET 방식의 ajax 요청을 보내고, (서버에서 JSON을 보낸다는게 확실할때에만 사용해야한다)
		//JSON 객체를 로드하는 함수
		// url (필수_서버로 요청을 보내는 주소)
		// data(선택_요청과 함께 서버로 보내는 데이터)
		// callback(선택 _ 응답(response)를 받았을 때 처리할 일을 정의하는 callback 함수)
		function getAllReplies() {
			$.getJSON('/ex00/replies/all/' + bno, // 여기서 bno는 input에서 읽어온값 
					 function(data){ // 서버에서 넘어온 Json 배열 
				
				//매개변수 data: Ajax 요청에 대한 응답으로 온 데이터 
				console.log("댓글 갯수: " + data.length); // 이 console가 출력되는 곳은 클라이언트. 
				
				var replyList = '';// 문자열들을 붙여가면서 할라고 비어있는 문자열 만든것.
				$(data).each(function() { // 위에서 서버에서 넘어온 JSON배열 (data)를 $ 붙여서 찾고  each라는 함수 안에다가 callback함수 등록 : 배열에서 원소 꺼내서 걔를 function 한테 준다...
					//each(): 배열(위에 function(data)에서 데이터 하나씩 꺼내서 이 function 안에다가 넣어주겠다. 즉, 일종의 향상된 for문이 된다.
						 replyList += // 첫번째 들어오면 비어있는 상태로 들어오니까 div를 붙이는것!   그리고 문자열을 계속 덧붙이는 거라서 += 를 사용한다. each문 
								'<div class = "reply-item" data-rno="'// 이름을 붙일때 규칙은 data를 붙이고나서 이름을 쓸 수 있다. 
								+ this.rno // JQuery에서의 this는  function호출한애가 누구냐니까 배열의 첫번째 원소, 두번째 function호출됐으면 두번째 원소!
								+ '">' // <div> 
								+ '<input type= "hidden" id="rno" value="'
								+ this.rno
								+ '" readonly />'
								+ '<input type= "text" id="rtext" style="width: 400px;" value="'
								+ this.rtext
								+ '" />&nbsp;'
								+ '<input type="text" id=replier" style="width: 50px;" value="'
								+ this.replier
								+ '" readonly />&nbsp;'
								+ '<button class="btn-update" style="width: 60px; height: 30px; background-color: #1c1637; font-family: 배달의민족 주아; font-size: 16px; color: #fff; border: 2px solid lightgrey;">수정</button>'
								+ '<button class="btn-delete" style="width: 60px; height: 30px; background-color: #1c1637; font-family: 배달의민족 주아; font-size: 16px; color: #fff; border: 2px solid lightgrey;">삭제</button>'
								+ '</div>';
								
				}); // 그래서 div가 테이블에 있는 갯수만큼 생긴다 
				$('#replies').html(replyList); // replies찾아서 replyList를 출력함.
				
			});
		}// 함수정의 , end function getAllReplies()

		getAllReplies(); // 함수 호출 
		
		
			// btn-insert 버튼 클릭 시, 댓글 입력 기능 
		
			$('#btn-insert').click(function() {
			// bno, rtext, replier 세 개 필요 -> 지금 보고있는 글 번호 bno찾음. var bno = $('#bno').val();
			//rtext 댓글내용은 input에서 찾고, replier도 마찬가지 
			//우선 변수 선언해서 찾자 
				var rtext = $('#rtext').val(); // 위에 id에서 rtext가 있잖아 그래서 위에도 찾아서 왕 안좋은 코드야..ㅎㅎ
				var replier = $('#replier').val();
				//입력된 값 읽어오고 
				
				
				//이제 ajax 요청 보내면 돼. 이 함수는 object 넘기지 
				$.ajax({ // 브라우저는 서버로 request보내고,다른거 하고있다가 서버에서 응답이오면 처리할수있는 callback function 만 등록해놓으면되는것이 ajax.
					//ajax의 {}object 넘기겠다!!!!! 단순명료!!!!
					type: 'post', // post방식과 // update는 put
					url: '/ex00/replies', // 이 주소로 요청을 보냄. 그리고 controller가 그 요청을 받는다. (ResponseEntity<Integer> createReply 여기부분 )
					headers: {// 댓글의 내용을 json타입으로 보낼거라서 headers 필수로 필요 
						'Content-Type': 'application/json',
						'X-HTTP-Method-Override': 'POST' //update put
					}, 
					data: JSON.stringify({ // 보낼 데이터 =>  JSON 문자열 만들어달라는 method. object가 갈수는 없으니까!문자열이 가야하자나~
						'bno': bno, 
						'rtext': rtext,
						'replier': replier // delete는 rno만 넘기면되니까 data가 필요없고 update는 필요하다.
					}), //서버로 보내질 JSON Object가 만들어지고 ReplyRestController의 @RequestBody에 들어간다. 
					
					//성공 시, 실행할 함수 등록
					success: function(result) { //()안의 변수이름은 상관없지만, ReplyRestController에서 insert할 때, 성공 실패를 Integer로 return하고나서 성공시, result =1 오니까 
						//비교해야할것! 그래서 callback함수에서 result 검사해준것이당. 
						if(result === 1) {
							alert("댓글 입력 성공^_^");
							getAllReplies();
						}else{
							alert("댓글 입력 실패T_T");
						}
						
						
					}
					
				});
			
			});
			
		
			$('#replies').on('click',' .reply-item .btn-update',function() {
						//alert();
						// $('#replies') : 댓글목록의 전체 div를 찾는것
						
						//on() : 원하는 event들을 등록할 수 있다.  
						//,'.reply-item', //매개변수를 하나를 더 줄 수 있다. 이렇게하면 아래쪽의 각각의 div들을 다 찾은것. 
						// btn-update까지쓰면 수정버튼을 눌렀을때만 alert창이 뜬다. 
						
						var rno = $(this).prevAll('#rno').val(); //버튼의 부모가 가진 element중에서 id가 rno인 애들 모두 찾아주세요 
						var rtext = $(this).prevAll('#rtext').val();
						var bno = ${board.bno};
						
						$.ajax({
							type: 'put',
							url: '/ex00/replies/' + rno,
							headers: {
								'Content-Type' : 'application/json',
								'X-HTTP-Method-Override': 'PUT'							
								
							},
							
							data: JSON.stringify({
								'rtext': rtext,
								'bno': bno,
								'rno': rno
							}),
							success: function(result) {
								if(result === 'success') {
									alert("댓글 수정 성공^_^");
									getAllReplies();
								}else{
									alert("댓글 수정 실패T_T");
								}
							}
						});
							
						
						
					}); 
			
			$('#replies').on('click', ' .reply-item .btn-delete' ,
					function() {
				var rno = $(this).prevAll('#rno').val();
				console.log('rno=' +rno);
				
				$.ajax({
					type: 'delete',
					url: '/ex00/replies/' + rno,
					headers: {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'DELETE'
					},
					success: function(result) {
						if(result === 'success') {
							alert("댓글 삭제 성공^_^");
							//입력 성공시, 목록 생신 
		
							getAllReplies();
						}else{
							alert("댓글 삭제 실패T_T");
						}
					}
					
				});
			});
		
		
		
	});
	
});
</script>


	<div>
		<img src="././resources/images/logo11.png" alt=" "
			style="margin-top: 100px;" />
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