<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>PODO</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js.prefixfree.jquery.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<style>
body{
	background-image: url("././resources/images/${music.malbumart}"); 
	background-size: 383px;
	color: white;
	width: 383px;
}
</style>
<head>
<meta charset="UTF-8" />
<title>가사</title>
</head>
<body>
<div>
	<h3 style="background-color: rgba( 0, 0, 0, 0.7 ); padding: 15px;">${music.mtitle }</h3>
	<h5 style="background-color: rgba( 0, 0, 0, 0.7 ); 
				padding: 15px; text-align: right; width: 383px;">${music.martist }</h5>
	<div>
		<textarea rows="150" cols="48"
				style="border: none; padding: 15px; background-color: rgba( 0, 0, 0, 0.7 );">${music.mlyrics}
	</textarea>
	</div>
</div>

</body>
</html>