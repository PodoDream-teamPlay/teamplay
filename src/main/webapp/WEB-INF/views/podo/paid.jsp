<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PODO</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
#usingpoint {
	max="${money}";
}
</style>
</head>
<body>



<form id="paid-form" method="post">
	<h2>결제</h2>
	<input id="money" value="${money}" style="width: 150px" name="money" readonly required> 원<br/>
	<input value="${remainpoint}" style="width: 150px" readonly> 남은 포인트<br>
	<input id="usingpoint" type="number" style="width: 150px" min="0" value="0" name="usingpoint" oninput="cal()"> 사용할 포인트<br>
	<input readonly id="finalmoney" style="width: 150px" value="${money}"> 결제할 금액<br>
	<input maxlength="4" style="width: 30px" required>
	<input maxlength="4" style="width: 30px" required>
	<input maxlength="4" style="width: 30px" required>
	<input maxlength="4" style="width: 30px" required> 카드 번호 입력<br/>
	<input style="width: 150px" type="password" placeholder="카드 비밀번호" required><br/>
	<button id="payok">결제</button>
</form>


<script>

function cal() {
	var money = document.getElementById('money').value;
	var usingpoint = document.getElementById('usingpoint');
	if (${money} > ${remainpoint}) {
		usingpoint.max = "${remainpoint}";	
	} else {
		usingpoint.max = "${money}";
	}
	if (usingpoint.value>${money} | usingpoint>${remainpoint}){
		usingpoint.value= usingpoint.max;
	}
	 
	var finalmoney = money - usingpoint.value;

	
	
	document.getElementById('finalmoney').value = finalmoney;
}

</script>

 
  
 
 



</body>
</html>