<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

<h2>결제창</h2>


<form id="paid-form" method="post">
	<h2>결제</h2>
	<input id="money" value="${money}" name="money" readonly required>원<br/>
	<input type="number" placeholder="카드번호를 입력하세요" required><br/>
	<input type="password" placeholder="카드 비밀번호" required><br/>
	<button id="payok">결제</button>
</form>


 
  
 
 



</body>
</html>