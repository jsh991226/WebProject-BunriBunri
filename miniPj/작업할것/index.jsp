<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="./js/jquery-1.9.1.min.js"></script>
<script src="./js/index.js"></script>
<script src="./js/sweetalert.min.js"></script>
<script
	src="http://fatlinesofcode.github.io/jquery.smoothwheel/src/jquery.smoothwheel.js"></script>
<script>
	$(document).ready(function() {
		$("body").smoothWheel();
		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('.top').fadeIn();
			} else {
				$('.top').fadeOut();
			}
		});
		$('.top').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 200);
			return false;
		});
		$(document).keyup(function(e) {
			if (e.keyCode == 27) {
				$('#login').fadeOut();
				$('#register').fadeOut();
			}
		});

	})
</script>
</head>
<body>
	<a href="#" class="top">TOP</a>
	<div id="header">
		<a href="index.jsp"><img id="titleImg"
			src="./images/bunribunriWebLogo.png" /> </a>
		<ul>

			<%
			if (session.getAttribute("loginCheck") == "true") {
			%><li onClick="viewPage('logout')">로그아웃</li>
			<li onClick="viewPage('mypage')">마이페이지</li>
			<%
			} else {
			%><li onClick="viewPage('register')">회원가입</li>
			<li onClick="viewPage('login')">로그인</li>
			<%
			}
			%>
			<li>고객센터</li>
		</ul>

	</div>
	<div id="mainView"> <!-- 살야될거 -->
		<div id="wrapper">
			<div id="content">
				<!--  <div id="leftContent">
					<div id="header">
         			   <jsp:include page="board.jsp" />
					</div>-->
				<div id="leftContent">
					<div id="boardBtn">
						<a href="#" onClick="viewPage('board')">질문게시판</a>
					</div>
					<div id="policyBtn">
						<a href="main.jsp">분리수거 법률</a>
					</div>
				</div>

			</div>
			<div id="middleContent"></div>


		</div>
	</div>
	<div id="register">
		<div id="registerForm">
			<i>회원가입</i>
			<form action="./userJoinAction.jsp" method="post">
				<input type="text" placeholder="ID" class="form-control"
					name="userID"> <input type="password"
					placeholder="Password" class="form-control" name="userPW">
				<input type="text" placeholder="Nickname" class="form-control"
					name="userNICK"> <input type="email" placeholder="Email"
					class="form-control" name="userEMAIL"> <input type="submit"
					class="btn btn-primary" value="가입"> <input
					id="unRegisterBtn" type="button"
					onClick="$('#register').fadeOut();" class="btn btn-primary"
					value="취소">
			</form>

		</div>
	</div>
	<div id="login">
		<div id="loginForm">
			<i>로그인</i>
			<form action="./userLogin.jsp" method="post">
				<input type="text" placeholder="ID" class="form-control"
					name="userID"> <input type="password"
					placeholder="Password" class="form-control" name="userPW">
				<input type="submit" class="btn btn-primary" value="로그인"> <input
					id="unRegisterBtn" onClick="$('#login').fadeOut();" type="button"
					class="btn btn-primary" value="취소">
			</form>
		</div>
	</div>



</body>
</html>
