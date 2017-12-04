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
<h1>
	PODO
</h1>
<h1 style="color:lightblue">PODO 로그인</h1>
<form action="login-post" method="post">
    <input type="text" name="userid" placeholder="아이디"
        required autofocus />
    <br/>
    <input type="password" name="password" placeholder="비밀번호"
        required />
    <br/>
    <!-- 로그인 후에 이동할 페이지 -->
    <input type="hidden" name="queryString" 
        value="${loginTarget}" />
        <br/>
</form>
<c:if test="${empty loginUserid}">
<button id="btn-login">로그인</button>
</c:if>
<c:if test="${not empty loginUserid}">
${loginUserid}님, 환영합니당♥
<button id="btn-logout">로그아웃</button>
</c:if>

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
