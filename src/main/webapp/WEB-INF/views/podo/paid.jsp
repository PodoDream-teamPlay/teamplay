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
	<input id="money" value="${money}" name="money" readonly required> 원<br/>
	<input value="${remainpoint}" readonly> 남은 포인트
	<input id="usingpoint" type="number" name="usingpoint" max="${remainpoint}" onchange="cal()"> 사용할 포인트<br>
	<input readonly id="finalmoney"> 결제할 금액<br>
	<input style="width: 31px">
	<input style="width: 31px">
	<input style="width: 31px">
	<input style="width: 31px"> 카드 번호 입력<br/>
	<input type="password" placeholder="카드 비밀번호" required><br/>
	<button id="payok">결제</button>
</form>


<script>

function cal() {
var money = document.getElementById('money').value;
var usingpoint =document.getElementById('usingpoint').value;
var finalmoney = money-usingpoint;
document.getElementById('finalmoney').value = finalmoney;
}

</script>

 
  
 
 



</body>
</html>