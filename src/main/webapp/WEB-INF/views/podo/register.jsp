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
</head>
<body>
<h1 class="text-center">회원가입</h1>
<hr>
<div class="container text-center">
<form action="member-join" method="post">
<label for="userid" >아이디</label>
<input type="text" name="userid" id="userid">
<br>
<label for="password" >비밀번호</label>
<input type="password" name="password" id="password">
<br>
<label for="email" >이메일</label>
<input type="email" name="email" id="email">
<br>
<input type="submit" value="회원가입" class="btn">
</form>

</div>


<script>
$(document).ready(function(){
	
});
</script>
</body>
</html>