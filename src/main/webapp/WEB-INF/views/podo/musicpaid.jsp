<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<h1 class="text-center">
			<a style="text-decoration: none;"> &nbsp&nbsp
			<img alt="grape" src="././resources/images/grape3.png" style="width: 47px; height: 56px;">
			<img alt="PODO" src="././resources/images/podo_purple.png" style="width: 140px; height: 56px;">
			</a>
</h1>
<h5 style="size: 20px">&nbsp&nbsp 즐거움의 시작! 포도 플레이어</h5>	
<div align="left">
<form id="paid-form" method="post">
	&nbsp&nbsp<input id="money" value="${money}" style="width: 150px" name="money" readonly required> 원<br/>
	&nbsp&nbsp<input value="${remainpoint}" style="width: 150px" readonly> 남은 포인트<br>
	&nbsp&nbsp<input id="usingpoint" type="number" style="width: 150px" min="0" value="0" name="usingpoint" oninput="cal()"> 사용할 포인트<br>
	&nbsp&nbsp<input readonly id="finalmoney" style="width: 150px" value="${money}"> 결제할 금액<br>
	&nbsp&nbsp<input maxlength="4" style="width: 30px" required type="text" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
	<input maxlength="4" style="width: 30px" required type="text" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
	<input maxlength="4" style="width: 30px" required type="text" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
	<input maxlength="4" style="width: 30px" required type="text" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'> 카드 번호 입력<br/>
	&nbsp	<input style="width: 150px" type="password" placeholder="카드 비밀번호" required><br/><br/>
	<div align="center"><button id="payok" style="height: 30px; width: 150px">결제</button></div>
</form>
</div>

<script>
		function onlyNumber(event){
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				return false;
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
	</script>


  





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