<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
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
<body>
<div class="container">
	<h1>${ptitle}</h1>
	<table class="table">
	<thead>
	<tr>
		<th> </th>
		<th>제목</th>
		<th>가수</th>
	</tr>
	</thead>
	<tbody>
		<c:if test="${not empty musicList }">
		<c:forEach var="music" items="${musicList }">
		<tr>
				<td><img class="albumart" alt="자켓이미지" src="././resources/images/${music.malbumart}"></td>
				<td><br>${music.mtitle }</td>
				<td><br>${music.martist}</td>
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
</body>
</html>

