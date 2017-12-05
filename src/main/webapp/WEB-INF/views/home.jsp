<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
 <!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!--  로그인폼 오른쪽으로 가야행 !!!~  -->
<!-- 타이틀 -->
<h1 style="color:lightblue" class="text-center">PODO</h1>

<form action="search" method="get"class="text-center">
    <select name="searchType">
        <option value="1">노래 제목</option>
        <option value="2">가수</option>
        <option value="3">앨범명</option>
    </select>
    <input type="text" name="searchKeyword" placeholder="검색어"/>
    <input type="submit" value="검색"class= "btn btn-primary" />

	
</form>

<!-- 본문 -->
<div class="container">
	<form action="login-post" method="post" class="text-right">
		<table>
			<thead></thead>
			<tbody>
				<tr>
					<td>
						<input type="text" name="userid" placeholder="아이디"
		        		required autofocus />
					</td>
					<td rowspan = "2">
						<c:if test="${empty loginUserid}">
							<button id="btn-login" class="text-right btn"
							style="height: 52px">로그인</button>
						</c:if>
						<c:if test="${not empty loginUserid}">
							${loginUserid}님, 환영합니다
							<button id="btn-logout">로그아웃</button>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="password" placeholder="비밀번호"
		        		required />
					</td>
				</tr>
				<tr>
					<td>
						<a href="register" >회원가입 </a>
					</td>
				</tr>
				
			</tbody>
		</table>
		<!-- 로그인 후에 이동할 페이지 -->
		<input type="hidden" name="queryString" 
		value="${loginTarget}" />
	</form>
	
	
	
</div>



<script>
$(document).ready(function(){
	$('#btn-login').click(function() {
		console.log(location.href);
		location = encodeURI ('/podo/member/login?url=' + location.href);
	});
	$('#btn-logout').click(function(){
		location = '/podo/member/logout'
	});
	
	
});

</script>
</body>
</html>
