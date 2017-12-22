<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>PODO</title>
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
.highlight{
	color: #FD004C;
}
.titlefont{
	font-weight: bold;
	color: black;
}
table, tr{
	width: 200px;
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
</div>
	<!-- 네비게이션 -->
	<nav class="navbar navbar-inverse"
		style="width: 970px; display: inline-block; background-color: #1C1637;
		border: none; text-align: center; color: white;">
		
		<ul class="nav navbar-nav">
			<li>아이디 찾기</li>
			<li>비밀번호 찾기</li>
		</ul>
	</nav>
</div>
<br><br>

<!-- 본문 -->
<div class="container">
<h3>아이디 / 비밀번호 찾기</h3>
	
	<div class="container text-center">
	<p>이메일</p>
		<form action="findingId" method="post">
			<input type="email" name="email" id="email" required="required">	
			<br> 
			<input type="submit"  id ="btn3" value="찾기" class="btn" >
		</form>
		
	<h4></h4>	
	
	</div>

</div>
<script type="text/javascript">
$(document).ready(function() {
		
		if (${not empty userid}) {
			alert("아이디는 : ${userid} 입니다.");
		} 
		else {
			alert("해당 이메일은 가입되어있지 않습니다.")
		}
	
});

</script>



</body>
</html>