<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.boardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="userlist.userlistDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<%
request.setCharacterEncoding("UTF-8");
List<Board> results = new ArrayList<Board>();
String comW = (String) request.getParameter("del");
String user_nick = "";
boardDAO boardDAO = new boardDAO();
results = boardDAO.load();
String user_id = "";
if (session.getAttribute("loginCheck") == "true") {
	userlistDAO userDAO = new userlistDAO();
	user_id = (session.getAttribute("userID") + "");
	String result2 = userDAO.getNICK(user_id);
	user_nick = result2;
} else {

}
%>

<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<script src="./js/jquery-1.9.1.min.js"></script>
<script src="./js/board.js"></script>
<script src="./js/index.js"></script>
<script src="./js/sweetalert.min.js"></script>
<script>
	$(document).ready(function() {

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
					<li class="mobileLI" onClick="location.href='policy.jsp'">분리수거
						법률</li>
				</ul>
			</div>
			<div class="sidebar-toggle-btn" onClick="sideClick()">
				<span></span>
			</div>
		</aside>
	</div>
	<div id="mainView">
		<div id="quickPhoto"
			onClick='$("#mainView").load("./writeBoard.jsp");'>게시물 작성</div>
		<!-- 살야될거 -->
		<div class="qBoardDiv">
			<!-- <div id="boardHeadBox">
				<input type="button"
					onClick="$('#mainView').load('./writeBoard.jsp')"
					class="btn btn-primary" value="글쓰기">
			</div> -->
			<%
			for (Board index : results) {
			%>
			<div class="boardPost" postNum="<%=index.getB_id()%>">
				<div id="boardTitleCss"><%=index.cutTitle(15, index.getTitle()) + " [ " + index.getReplyCnt() + " ]"%></div>
				<div id="boardNickCss">
					작성자 :
					<%=index.getUser_nick()%></div>
				<div id="boardViewCss">
					조회수 :
					<%=index.getView()%></div>
				<div id="boardDateCss" class="mobileNoShow">
					작성일 :
					<%=index.getDate()%></div>

			</div>

			<%
			}
			%>

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
