<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/3.3.0/build/cssreset/reset-min.css">
<link href='http://fonts.googleapis.com/css?family=Lobster'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="http://code.jQuery.com/jQuery-latest.js"
	type="text/javascript"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/html5slider.js"></script>


<style>
/* Color Of The Year -- https://colorganize.com/?palette=75 */
$
rose_quartz__2016: #f7cac9 ;
 $serenity__2016: #8ea6d0 ;
 $marsala__2015: #965352 ;
 $radiant_orchid__2014: #b565a7 ;
 $emerald__2013: #169c78 ;
 $tangerine_tango__2012: #e1523d ;
 $honeysuckle__2011: #da4f70 ;
 $turquoise__2010: #41b6ab ;
 $mimosa__2009: #f0bf59 ;
 $blue_iris__2008: #595ca1 ;
 $chili_pepper__2007: #9c1b31 ;
 $sand_dollar__2006: #decdbf ;
 $blue_turquoise__2005: #4fb0ae ;
 $tigerlily__2004: #e4583e ;
 $aqua_sky__2003: #7ac5c5 ;
 $true_red__2002: #c02034 ;
 $fuchsia_rose__2001: #c94476 ;
 $cerulean__2000: #9bb7d6 ;


.albumart {
	width: 50px;
}


$albumCover: url(http://gagadaily.com/uploads/stories/monthly_2016_09/joanne.jpg.a6d8d6fd6e671a82ae75e80925ff43d3.jpg);

body {
  background-color: #000;
  color: rgba(255, 255, 255, 0.7);
  font-family: "Montserrat", sans-serif;
  cursor: default;
}

#bg-before {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  box-shadow: inset 0 0 200px #000;
  background: $albumCover 0 / cover fixed;
  filter: blur(20px);
  animation: blurAni 24s infinite;
}

#bg {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.6);
  animation: bgAni 18s infinite;
}

@keyframes blurAni {
  0% {
    filter: blur(20px);
  }
  25% {
    filter: blur(5px);
  }
  50% {
    filter: blur(15px);
  }
  75% {
    filter: blur(0);
  }
  100% {
    filter: blur(20px);
  }
}

@keyframes bgAni {
  0% {
    background-color: rgba(0, 0, 0, 0.6);
  }
  17% {
    background-color: rgba(0, 0, 0, 0.7);
  }
  33% {
    background-color: rgba(0, 0, 0, 0.9);
  }
  50% {
    background-color: rgba(0, 0, 0, 0.5);
  }
  67% {
    background-color: rgba(0, 0, 0, 0.8);
  }
  100% {
    background-color: rgba(0, 0, 0, 0.6);
  }
}


main {
	position: absolute;
	top: 2rem;
	right: 0;
	left: 0;
	bottom: 2rem;
	padding: 0 calc(50% - 10rem);
	text-align: center;
}

#albumCover {
	width: 100%;
	height: 20rem;
	background-size: cover;
	display: inline-block;
	box-shadow: 0 2rem 4rem rgba(0, 0, 0, 0.5);
}

#progress {
	width: 100%;
	background-color: rgba(142, 166, 208, 0.2);
}

#progress-bar {
	width: 0%;
	height: .4rem;
	background-color: #F7CAC9;
}

#progress-bar.play {
	animation: progress-bar 240s infinite;
}

@
keyframes progress-bar {from { width:0%;
	
}

to {
	width: 100%;
}

}
#title {
	margin: 1rem 0;
	width: 100%;
	overflow: hidden;
	height: 1.1rem;
}

#title-text {
	animation: scrolling-text 16s linear infinite;
}

@
keyframes scrolling-text {from { transform:translateX(100%);
	
}

to {
	transform: translateX(-100%);
}

}
#controls {
	display: flex;
	align-items: center;
	justify-content: center;
}

.control {
	width: 2.7rem;
	height: 2.7rem;
	border-radius: 50%;
	border: 1px solid;
	cursor: pointer;
	display: inline-block;
	margin: 1px;
	transition: transform .3s, box-shadow .5s, text-shadow .5s;
}

.control:hover, .control:focus {
	color: #fff;
	transform: scale(1.05);
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.5);
	text-shadow: 0 0 8px rgba(0, 0, 0, 0.5);
}

.control:active {
	transform: scale(0.9);
	box-shadow: none;
	text-shadow: none;
}

.control .icon {/* 
	font-size: 2.7rem; */
}

 #controls-play {
	width: 5rem;
	height: 5rem;/* 
	font-size: 2rem; */
} 

#controls-play .icon-pause {
  display: none;
}
#controls-play.play .icon-pause {
	display: block;
}

#controls-play.play .icon-play {
	display: none;
}

#controls-play .icon {
	font-size: 4rem;
}
}
</style>
</head>
<body onload="window.resizeTo(500,700)"
	style="background-color: #2E2E2E;">




	<div id="bg-before"></div>
	<div id="bg"></div>

	<table class="table">
		<main>
		<div id="albumCover">
			<img class="playlistAlbum" src="././resources/images/m43.jpg"
				style="width: 180px; text-align: center;">
		</div>
		<div id="progress">
			<div id="progress-bar"></div>
		</div>
		<div id="title">
			<div id="title-text">
				${music.mtitle }<br /> ${music.martist}
			</div>
		</div>
		<div id="controls">
			<div class="control">
				<i class="material-icons icon"><img
					src="././resources/images/prev_button.png"
					style="width: 25px; height: 25px;"></i>
			</div>
			<div class="control" id="controls-play" onclick="play()">
				<i class="material-icons icon icon-play"><img
					src="././resources/images/play-button2.png"
					style="width: 40px; height: 40px;"></i> <i
					class="material-icons icon icon-pause"><img
					src="././resources/images/pause_button.png"
					style="width: 40px; height: 40px;"></i>
			</div>
			<div class="control">
				<i class="material-icons icon"><img
					src="././resources/images/next_button.png"
					style="width: 25px; height: 25px;"></i>
			</div>
		</div>
		</main>
	</table>







	<script>
		$(document).ready(function() {

			function addClass(element, classname) {
				if (element.classList)
					element.classList.add(classname);
				else
					element.className += ' ' + classname;
			}

			function removeClass(classname, element) {
				var cn = element.className;
				var rxp = new RegExp("\\s?\\b" + classname + "\\b", "g");
				cn = cn.replace(rxp, '');
				element.className = cn;
			}

			var progressBarEl = document.getElementById("progress-bar");
			var controlsPlayEl = document.getElementById("controls-play");

			function play() {
				addClass(progressBarEl, "play");
				addClass(controlsPlayEl, "play");
			}

		});
	</script>
</body>
</html>

