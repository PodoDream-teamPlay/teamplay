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
			<th></th>
		</tr>
		</thead>
		<tbody>
			<c:if test="${not empty musicList }">
			<c:forEach var="music" items="${musicList }">
			<tr style="background-color: white;">
					<td><img class="albumart" alt="자켓이미지" src="././resources/images/${music.malbumart}"></td>
					<td>${music.mtitle }</td>
					<td>${music.martist}</td>
					<td>
						<button class="btn_delete" style="border: none; background-color: white;" data-mid = "${music.mid }">
						<img alt="X" src="././resources/images/x.png" style="width: 13px;">
						</button>
					</td>
			</tr>
			</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	

</div>
<script>
$(document).ready(function(){
	$('.btn_delete').click(function(){
		var mid = $(this).attr('data-mid');
		var pid = ${pid};
		document.location.href='playlist_member_delete?mid='+mid+'&pid='+pid;
	});
});
</script>


</body>

</html>

