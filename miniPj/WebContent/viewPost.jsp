<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.boardDAO"%>
<%@ page import="userlist.userlistDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="board.reply"%>
<%@ page import="board.replyDAO"%>


<%
String postNum = request.getParameter("postNum");
String results = "";
String user_nick = "";
String user_id = "";
boolean viewCheck = true;
List<reply> resultRp = new ArrayList<reply>();
if (session.getAttribute("loginCheck") == "true") {
	userlistDAO userDAO = new userlistDAO();
	user_id = (session.getAttribute("userID") + "");
	String result = userDAO.getNICK(user_id);
	user_nick = result;
	boardDAO boardDAO = new boardDAO();
	if (postNum.equals(session.getAttribute("viewCheck"))) {
	} else {
		session.setAttribute("viewCheck", postNum);
		viewCheck = false;
	}
	request.setCharacterEncoding("UTF-8");
	results = boardDAO.postLoad(postNum, viewCheck);
	replyDAO reply = new replyDAO();
	resultRp = reply.load(postNum);
} else {
	boardDAO boardDAO = new boardDAO();
	results = boardDAO.postLoad(postNum, viewCheck);
	user_id="noLogin";
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
<script
	src="http://fatlinesofcode.github.io/jquery.smoothwheel/src/jquery.smoothwheel.js"></script>
<script>
			var cvsResults = "<%=results%>";
			var sptemp = cvsResults.split("|");
			var writeUser = sptemp[3];
			var nowUser = "<%=user_id%>";
	$(document).ready(function() {
		$("#deletePostNum").val(sptemp[0]);
		$("#postTitle").val(sptemp[4]);
		$("#postContent").text(sptemp[6].replaceAll("<br/>", "\n"));
		$("#postView").val("조회수 : " + sptemp[7]);
		$("#postWriter").val("작성자 : " + sptemp[9]);
		$("#postDate").val("작성일 : " + sptemp[5]);
		$("#postNumInput").val(sptemp[0]);
		$("#postImage").text("사진이름: " + sptemp[8]); //C:\Users\jsh99\git\repository\miniPj\WebContent\upload

		if (sptemp[8] != "null") {
			$('#postImage').attr('src', 'upload/' + sptemp[8]);
			$('#postImage').css('display', '');
		}
		if (writeUser == nowUser) {
			$("#postOwner").css('display', '');
			$(".postDelete").attr('onClick', 'deletePost("' + sptemp[0] + '")')
			$(".postEdit").attr('onClick', 'editPost("' + sptemp[0] + '")')
		}
		$("textarea.autosize").height(1).height( $("textarea.autosize").prop('scrollHeight')+12 );	

	});
</script>
<title>게시물 보기</title>
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
		<input type="button" class="btn btn-primary"
			onClick='location.href="qBoard.jsp"'
			style="width: 100%; height: 40px; margin-bottom: 40px;"
			value="목록으로 돌아가기" />

		<div class="container" style="width: 100%;">

			<div class="row">

				<form method="post" action="writeBoardAction.jsp">

					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">

						<thead>
							<tr>
								<th colspan="3"
									style="background-color: #eeeeee; text-align: center;">게시물
									조회</th>
							</tr>
						</thead>

						<tbody>

							<tr>

								<td colspan="3"><input type="text"
									class="form-control form-control-plaintext whiteinput" readonly
									id="postTitle" maxlength="50" /></td>

							</tr>

							<tr>
								<td><input type="text"
									class="form-control form-control-plaintext whiteinput" readonly
									id="postWriter" maxlength="50" /></td>
								<td><input type="text"
									class="form-control form-control-plaintext whiteinput" readonly
									id="postDate" maxlength="50" /></td>
								<td><input type="text"
									class="form-control form-control-plaintext whiteinput" readonly
									id="postView" maxlength="50" /></td>
							</tr>
							<tr style="border-bottom:0px;">
								<td colspan="3" style="background-color:white;border-bottom:0px;"><img id="postImage" src=''
									style="display: none;" /></td>
							</tr>

							<tr>

								<td colspan="3"><textarea
										class="form-control form-control-plaintext whiteinput autosize"
										readonly id="postContent" maxlength="2048" style="border: 0px;"></textarea></td>

							</tr>
							<tr id="postOwner" style="display: none">
								<td colspan="3"><a class="postEdit">[수정]</a> <a
									class="postDelete">[삭제]</a></td>
							</tr>

						</tbody>


					</table>


				</form>

			</div>

		</div>
		<%if (session.getAttribute("loginCheck") == "true") { %>
		<div style="width: 100%;">
			<%
			List<reply> resultRrp = new ArrayList<reply>();
			int temp = 0;
			replyDAO reply = new replyDAO();
			for (reply index : resultRp) {
				resultRrp = reply.reLoad(postNum, index.getR_id());
			%>
			<div>
				<jsp:include page="replyView.jsp">
					<jsp:param name="userNick" value="<%=index.getUser_nick()%>" />
					<jsp:param name="writerID" value="<%=index.getUser_id()%>" />
					<jsp:param name="date" value="<%=index.getDate()%>" />
					<jsp:param name="content" value="<%=index.getContent()%>" />
					<jsp:param name="replyID" value="<%=index.getR_id()%>" />
					<jsp:param name="postNum" value="<%=index.getB_id()%>" />
				</jsp:include>
			</div>
			<%
			if (resultRrp.size() > 0) {
				for (reply subindex : resultRrp) {
			%>
			<div>
				<jsp:include page="rereplyView.jsp">
					<jsp:param name="userNick" value="<%=subindex.getUser_nick()%>" />
					<jsp:param name="writerID" value="<%=subindex.getUser_id()%>" />
					<jsp:param name="date" value="<%=subindex.getDate()%>" />
					<jsp:param name="content" value="<%=subindex.getContent()%>" />
					<jsp:param name="replyID" value="<%=subindex.getR_id()%>" />
					<jsp:param name="postNum" value="<%=subindex.getB_id()%>" />
				</jsp:include>
			</div>
			<%
			}

			}

			}
			%>
		</div>
		<%} else {%>
		<div style="width: 100%;">
			<div>
				<jsp:include page="replyLogin.jsp" />
			</div>
		</div>
		<% }%>
		<%if (session.getAttribute("loginCheck") == "true") { %>
		<div class="container" style="width: 100%;">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<div class="card mb-2">

								<div class="card-body">
									<ul class="list-group list-group-flush">

										<li class="list-group-item"
											style="width: 100%; min-height: 190px;"><i>댓글을 남겨주세요</i>
											<form method="post" class="form-inline mb-2"
												action="writeReplyAction.jsp">
												<input type="text" style="display: none;" id="postNumInput"
													value="" name="postNum" />
												<textarea class="form-control"
													id="exampleFormControlTextarea1" name="replyContent"
													style="resize: none; width: 100%" rows="5"></textarea>
												<input type="submit" class="btn btn-primary pull-right"
													style="min-width: 5%; margin-top: 5px;" value="작성" />
											</form></li>

									</ul>
								</div>
							</div>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<%} %>


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
