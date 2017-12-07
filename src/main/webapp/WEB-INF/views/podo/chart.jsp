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
<style>

.topnav {
    background-color: #4D408A;
    overflow: hidden;
    float: left;
    color: #CBC1FA;
    text-align: center;
    width: 100%;
    height: 52px;
    font-size: 35px;
}

hr{
	border: 3px double #ff1aff;
}

table, th, td{
	border: 1px solid white;
}

table {
	width: 100%;
}
p {
	display: inline;
}

#albumart {
  width: 65px;
  height: 65px;
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
        <option value="4">장르별</option>
    </select>
    <input type="text" name="searchKeyword" placeholder="검색어"/>
    <input type="submit" value="검색"class= "btn btn-primary" />
</form>
<br>

<div class="topnav" id="myTopnav">
	<img src="../resources/images/grape.png" height="80%"> <p>포도차트</p>
</div>

<br>
<br>
<br>
<div class="container">
   <form>
  	  <input type="checkbox" name="choose_all" value="1">
  	  <input type="button" id="cart" name="cart" value="마이리스트에 담기">
	  <input type="button" id="mp3_down" name="mp3_down" value="MP3 다운">
	  <input type="button" id="listening_all" name="listening_all" value="전체 듣기(재생목록에 추가)">
	  <input type="button" id="change_listening" name="change_listening" value="전체 듣기(재생목록 교체)">
   </form>
</div>

<div class="container" >
   <table class="table table-striped" >
    	<thead>
	    	<tr>
		    	<th></th>
		    	<th><span id="t_head">순위</span></th>
		    	<th><span class="hidden">앨범이미지</span></th>
			    <th><span id="t_head">곡명</span></th>
			    <th><span id="t_head">아티스트</span></th>
			    <th><span id="t_head">앨범</span></th>
		    	<th>가사</th>
		    	<th>내앨범</th>
		    	<th>MP3다운</th>
		   </tr>
	  </thead>
      <tbody>
        <c:forEach var="music" items="${music}">
	   	    <tr>           
		   	   <td width="30" bordercolor="grey"><input type="checkbox" name="choose" value="2"></td>
		 	   <td>${music.mid}</td>
		 	   <td><img id="albumart" alt="자켓이미지" src="../resources/images/${music.malbumart}"></td>
		 	   <td>${music.mtitle}</td>
		 	   <td>${music.martist}</td>
		 	   <td>${music.malbum}</td>
		 	   <td><a href="${music.mlyrics}"><img alt="가사" src="../resources/images/t_lyrics.png"></a></td>
		 	   <td><a href=""><img alt="내앨범" src="../resources/images/t_myalbum.png"></a></td>
		 	   <td><a href=""><img alt="MP3다운" src="../resources/images/t_mp3.png"></a></td>		 	   	   	    
		    </tr>
		 </c:forEach>
	  </tbody>
   </table>
</div>

</body>
</html>