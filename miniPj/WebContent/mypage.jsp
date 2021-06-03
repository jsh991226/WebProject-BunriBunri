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
	String userNick = request.getParameter("userNick"); 
	String date = request.getParameter("date"); 
	String content = request.getParameter("content"); 
	String writerID = request.getParameter("writerID"); 
	String replyID = request.getParameter("replyID"); 
	String postNum = request.getParameter("postNum"); 
	String user_email = "";
	String results = "";
	String user_nick ="";
	String user_id = "";
	int user_replyCnt = 0;
	int user_boardCnt = 0;
	if (session.getAttribute("loginCheck") == "true") {
	    userlistDAO userDAO = new userlistDAO(); 
	    user_id = (session.getAttribute("userID")+"");
	    String result = userDAO.getNICK(user_id);
	    user_email = userDAO.getUserData(user_id, "user_email");
	    user_nick = result;
	    user_replyCnt = userDAO.getUserCnt(user_id, "reply");
	    user_boardCnt = userDAO.getUserCnt(user_id, "board");
	    

	} else {
		response.sendRedirect("plzReg.jsp");
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
	$(document).ready(function(){
		user_id = "<%=user_id%>";
		if (user_id == null) {
			$("#mypageContent").text("[!]비정상적 접근입니다, 로그인 후 이용 가능합니다");
		} else {
			var $id = $("<div />");
			$id.text("ID : <%=user_id%>");
			var $nick = $("<div />");
			$nick.text("닉네임 : <%=user_nick%>");
			var $email = $("<div />");
			$email.text("이메일 : <%=user_email%>");
			var $postCnt = $("<div />");
			$postCnt.text("작성한 게시물 : <%=user_boardCnt%>");		
			var $replyCnt = $("<div />");
			$replyCnt.text("작성한 댓글 : <%=user_replyCnt%>");			
						
			
			$("#mypageContent").append($id);
			$("#mypageContent").append($nick);
			$("#mypageContent").append($email);
			$("#mypageContent").append($postCnt);
			$("#mypageContent").append($replyCnt);
		}
		
	})


</script>
</head>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div id="mypageForm">
	<div id="mypageTop">
		<svg xmlns="http://www.w3.org/2000/svg"  onClick="$('#mypage').fadeOut();" width="32" height="32" fill="currentColor" class="bi bi-x pull-right mypageExit" viewBox="0 0 16 16">
		  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
		</svg>
	</div>
	<div id="mypageContent">
	
	</div>
	
	</div>


</body>
</html>
</div>

</body>
</html>

