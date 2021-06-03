<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.boardDAO"%>
<%@ page import="userlist.userlistDAO"%>
<%
String results = "";
String user_nick = "";
String user_id = "";
if (session.getAttribute("loginCheck") == "true") {
	userlistDAO userDAO = new userlistDAO();
	user_id = (session.getAttribute("userID") + "");
	String result = userDAO.getNICK(user_id);
	user_nick = result;
} else {

}
%>

<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="./js/jquery-1.9.1.min.js"></script>
<script src="./js/index.js"></script>
<script src="./js/sweetalert.min.js"></script>
<style>
@import
	url(https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;
</style>

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

	})
	$(document).keyup(function(e) {
		if (e.keyCode == 27) {
			$('#login').fadeOut();
			$('#register').fadeOut();
			$('#mypage').fadeOut();
		}
	});
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
			<li onClick="viewPage('CallCenter')">고객센터</li>
		</ul>

		<label for="sidebar" class="background" onClick="sideClick()"></label>

		<!-- 모바일 사이드(nav)바 -->
		<aside id="sidebar">
			<div id=sidebar-content>
				<div id="sidebar-profile">
					<%
					if (session.getAttribute("loginCheck") == "true") {
					%>
					<div id="isSigned" class="bigMsg"><%=user_nick%>님 환영합니다
					</div>
					<div id="sidebar-loginRegister">
						<div class="mobileLI" onClick="viewPage('logout')">로그아웃</div>
						<div class="mobileLI" onClick="viewPage('mypage')">마이페이지</div>
					</div>
					<%
					} else {
					%>
					<div id="isSigned" class="bigMsg">로그인이 필요합니다.</div>
					<div id="sidebar-loginRegister">
						<div class="mobileLI" onClick="viewPage('register')">회원가입</div>
						<div class="mobileLI" onClick="viewPage('login')">로그인</div>
					</div>
					<%
					}
					%>

				</div>
				<ul id="sidebar-menu">
					<li class="mobileLI" onClick="viewPage('CallCenter')">고객센터</li>
					<hr class="solid">
					<li class="mobileLI" onClick="location.href='qBoard.jsp'">질문게시판</li>
					<hr class="solid">
					<li class="mobileLI" onClick="location.href='policy.jsp'">분리수거 법률</li>
				</ul>
			</div>
			<div class="sidebar-toggle-btn" onClick="sideClick()">
				<span></span>
			</div>
		</aside>
	</div>
	<div id="mainView">
		<div id="quickPhoto" onClick='$("#mainView").load("./writeBoard.jsp");'>바로 질문하기</div>
		<!-- 살야될거 -->
		<div id="wrapper">
			<div id="content">

				<div id="leftContent">
					<div id="boardBtn" class="goHover"
						onClick="location.href='qBoard.jsp'">
						<a>질문게시판</a>
					</div>
					<div id="policyBtn" class="goHover"
						onClick="location.href='policy.jsp'">
						<a>분리수거 법률</a>
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
	<div id="mypage">
		<jsp:include page="mypage.jsp" />
	</div>




</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</html>
