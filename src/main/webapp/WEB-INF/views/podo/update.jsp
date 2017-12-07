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
<h1> 회원 정보 수정 </h1>

<form action="member-update" method="post">
			<label for="userid">아이디</label>
			 <input type="text" name="userid" id="userid" value ="${loginUserid}" readonly required="required"> <br>
			<label for="password">비밀번호</label>
			 <input	type="password" name="updatePassword" id="updatePassword" required="required"> <br>
			 <label for="password2">비밀번호 확인</label>
			 <input	type="password" onblur="double_check()" name="updatePassword2" id="updatePassword2"  required="required"> <br>
			<label	for="email">이메일</label> 
			<input type="email" name="updateEmail" id="updateEmail" required="required">	<br> 
			<input type="submit"  id ="btn3" value="정보수정" class="btn" disabled="disabled">
		</form>
	
	<!--비밀번호 중복 체크   -->
	<script>
	function double_check() {
		var password_input = document.getElementById("updatePassword");
		var password = password_input.value
		var password2_input = document.getElementById("updatePassword2");
		var password2 = password2_input.value
		if (password==password2) {
			document.getElementById("btn3").disabled = false;
			
		} else {
			alert("비밀번호를 일치시켜 주세요")
		}
		
	}
	
	</script>
	



</body>
</html>