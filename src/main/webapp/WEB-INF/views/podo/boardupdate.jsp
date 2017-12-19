<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" />
<title>UPDATE</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!-- jQuery: Bootstrap JS 파일은 jQuery 라이브러리를 사용 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>

	<h2>게시글 수정</h2>
	<hr />

	<ul>
		<li><a href="boardFnA" class="btn btn-primary">메인으로</a></li>
		<li><a href="delete?bno=${board.bno }" class="btn btn-primary">삭제하기</a></li>
	</ul>
	<hr />

	<div class="text-center">
		<form action="boardupdate" method="post">
			<label for="bno">번호</label> <input type="number" name="bno" id="bno"
				value="${board.bno}" readonly /><br /> <label for="title">제목</label>
			<input type="text" name="title" id="title" value="${board.title }" />
			<br /> <label for="content">내용</label><br />
			<textarea rows="10" cols="50" name="content" id="content">${board.content}</textarea>
			<br /> <label for="userid">작성자</label> <input type="text"
				name="userid" id="userid" value="${board.userid}" readonly /> <br />
			<label for="regdate">작성시간</label>
			<fmt:formatDate value="${board.regdate}" var="regdate"
				pattern="yyyy/MM/dd HH:mm:ss" />
			<input type="text" id="regdate" value="${regdate}" readonly /><br />

			<input type="submit" value="작성완료" class="btn btn-primary" /> <br />

		</form>

	</div>


</body>
</html>