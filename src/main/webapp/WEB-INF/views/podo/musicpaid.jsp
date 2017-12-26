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

<h2>결제창</h2>
<%-- <div class="container">
	<p style="background-color: #2E2E2E; color: white; text-align: center; font-size: 25px; padding: 20px;">
		${ptitle}
	</p>
	
	<table class="table">
		<thead>
		<tr>
			<th style="color: white; background-color: #2E2E2E; text-align: center;"> </th>
			<th style="color: white; background-color: #2E2E2E; text-align: center;">곡명</th>
			<th style="color: white; background-color: #2E2E2E; text-align: center;">아티스트</th>
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
	

</div> --%>

<form id="musicpaid" method="post">
	<h2>결제</h2>
	<%-- <c:forEach var="glist" items="${glist}">
	<input />	
	</c:forEach> --%>
		
	<input id="money" value="${money}" style="width: 150px" name="money" readonly required> 원<br/>
	<input value="${remainpoint}"  style="width: 150px" readonly> 남은 포인트<br>
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