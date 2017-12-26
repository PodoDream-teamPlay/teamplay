<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PODO</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<h1>결제 성공</h1>

<button id="payok">확인</button>


  
<script>
$(document).ready(function() {
	$('#payok').click(function() {
		window.close();
	});
});
</script>

</body>
</html>