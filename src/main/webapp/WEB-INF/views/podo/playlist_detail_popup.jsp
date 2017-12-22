<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>PODO</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
 <!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.albumart{
	width: 50px;
}
</style>
</head>
<body onload="window.resizeTo(500,700)" style="background-color: #2E2E2E;">
<div class="container">
	<p style="background-color: #2E2E2E; color: white; text-align: center; font-size: 25px; padding: 20px;">
		${ptitle}
	</p>
	
	<table class="table">
		<thead>
		<tr>
			<th style="color: white; background-color: #2E2E2E; text-align: center;"> </th>
			<th style="color: white; background-color: #2E2E2E; text-align: center;">제목</th>
			<th style="color: white; background-color: #2E2E2E; text-align: center;">가수</th>
		</tr>
		</thead>
		<tbody>
			<c:if test="${not empty musicList }">
			<c:forEach var="music" items="${musicList }">
			<tr style="background-color: white;">
					<td><img class="albumart" alt="자켓이미지" src="././resources/images/${music.malbumart}"></td>
					<td>${music.mtitle }</td>
					<td>${music.martist}</td>
			</tr>
			</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	

</div>
<script>
$(document).ready(function(){

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

