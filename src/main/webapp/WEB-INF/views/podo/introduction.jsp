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
<div class="container" style="width: 1200px;background-color: #1C1637">
		<!-- 타이틀 -->
		<h1 class="text-center">
			<a href="http://192.168.11.11:8181/ex00/" style="text-decoration: none;">
			<img alt="grape" src="././resources/images/grape3.png" style="width: 58px;">
			<img alt="PODO" src="././resources/images/podo_white.png">
			</a>
		</h1>
</div>
</div>
<br><br>

<!-- 본문 -->
<div class="container" style="color: #7A797A;">
	
	<div>
	&nbsp;<img alt="logo" src="././resources/images/podo_purple.png"><br>
	<img alt="logo2" src="././resources/images/logo11.png">
	<hr>
	<p class="titlefont">
		<img alt="dot" src="././resources/images/dot.png" style="width: 5px;">
		연혁
	</p>
	<span>2017.11</span> - <span style="color: black;">회사 설립</span><br>
	<span>2017.12</span> - <span style="color: black;">서비스 베타테스트 완료</span><br>
	<span>2018.01</span> - <span class="highlight">서비스 시작</span>
	<br>
	<br>
	<br>
	
	<p class="titlefont">
		<img alt="dot" src="././resources/images/dot.png" style="width: 5px;">
		인재상
	</p>
	<div style="color: black; font-size: 20px;">
	<b>
		<span id="dojun">도전정신</span>, <span id="junmoon">전문성</span>, 
		<span id="chackim">책임감</span>, <span id="changeui">창의성</span>, 
		<span id="sotong">소통</span>
	</b>
	</div>
	<span></span>
	<br>
	<br>
	<br>
	
	<p class="titlefont">
		<img alt="dot" src="././resources/images/dot.png" style="width: 5px;">
		위치
	</p>
	<span>서울특별시 강남구 테헤란로 123 여삼빌딩 15층</span><br>
	<span>TEL : 02-6255-8002 | FAX : 02-569-8069</span>
	<br>
	<br>
	<br>
	<br>
	</div>
	
</div>
<hr>
<script>
$('#dojun').click(function(){
	$(this).html('졸려');
	$(this).css('color','#8701FC');
});
$('#junmoon').click(function(){
	$(this).html('포기해');
	$(this).css('color','#FD002E');
});
$('#chackim').click(function(){
	$(this).html('도망쳐');
	$(this).css('color','#02DB92');
});
$('#changeui').click(function(){
	$(this).html('망했어');
	$(this).css('color','#F6C501');
});
$('#sotong').click(function(){
	$(this).html('배고파');
	$(this).css('color','#458AF9');
});
</script>
</body>
</html>


















