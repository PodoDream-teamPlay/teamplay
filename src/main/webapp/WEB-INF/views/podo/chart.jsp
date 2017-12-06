<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
hr{
	border: 3px double #ff1aff;
}

table, th, td{
	border: 1px solid white;
}

table {
	width: 100%;
}
p{
	display: inline;
}

</style>

</head>
<body>

<h1 class="text-center" style="color:purple">PODO DREAM</h1>


<form class="text-center" action="search_result" method="get">
    <select name="searchType">
        <option value="1">노래 제목</option>
        <option value="2">가수</option>
        <option value="3">앨범명</option>
    </select>
    <input type="text" name="searchKeyword" placeholder="검색어"/>
    <input type="submit" value="검색"class= "btn btn-primary" />
</form>

<br/>
<br/>
<br/>

<form>
	<input type="checkbox" name="choose_all" value="1">
	<input type="button" id="cart" name="cart" value="마이리스트에 담기">
	<input type="button" id="mp3_down" name="mp3_down" value="MP3 다운">
	<p>|</p>
	<input type="button" id="listening_all" name="listening_all" value="전체 듣기(재생목록에 추가)">
	<input type="button" id="change_listening" name="change_listening" value="전체 듣기(재생목록 교체)">
</form>

<hr/>

<h2 class="text-center">차트  top 100</h2>

<table>
	<thead>
		<tr>
			<th></th>
			<th>순 위</th>
			<th>곡 명</th>
			<th>아티스트</th>
			<th>앨 범</th>
			<th>가 사</th>
			<th>내 앨범</th>
			<th>MP3 다운</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td width="30" bordercolor="grey"><input type="checkbox" name="choose" value="2"></td>
		</tr>
	</tbody>
	
</table>
</body>
</html>