<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
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
.selected, .selected:hover{
	color: #1C1637;
	background-color: white;
	font-weight: 900;
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
</div>
<!-- 네비게이션 -->
<div style="height: 50px; background-color: #1C1637;">
<div class="container">
		<nav class="navbar navbar-inverse"
			style="width: 100%; display: inline-block; background-color: #1C1637;
			border: none; text-align: center; color: white;">
		
		<ul class="nav navbar-nav">
			<li>
				<a href="iforgotMyId" id="nav-findId" >
					아이디 찾기
				</a>
			</li>
			<li><a href="iforgotMyPw" id="nav-findPw"class="selected" 
					style="color: white; color: #1C1637; background-color: white; font-weight: 900;">
			비밀번호 찾기
			</a></li>
		</ul>
		</nav>
</div>
</div>
<br><br>

<!-- 본문 -->
<div class="container">
<h3>아이디  찾기</h3>
<hr>
<br>	

	<div style="margin-left: 50px;">
	<form action="findingPw" method="post">
		<div>
			<img alt="check" src="././resources/images/check_p.png"
				style="width: 20px; font-weight: bold;">
			<b>아이디를 입력 해 주세요.</b>
			<br><br>
			<input type="text" name="userid" id="userid" required style="width: 310px;">
		</div>
		<br><br>
		<div>
			<img alt="check" src="././resources/images/check_p.png"
				style="width: 20px; font-weight: bold;">
			<b>회원가입 시 사용한 이메일을 입력 해 주세요.</b>
			<br>
			<span style="color: gray; font-size: 7;">입력 양식 : xxxx@xxxx.xxx</span>
			<br><br>
			<input type="email" name="email" id="email" required="required" style="width: 310px;">
			<br><br>
			<input type="submit"  id ="btn3" value="찾기" class="btn" >
		</div>
		<br>
	</form>
	<br><br>
	<div id="result" style="color: #F6354E; font-size: 50px;"></div>
	</div>

</div>
<script>
$(document).ready(function() {
		
	
});

</script>

</body>
</html>