<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
	String user_nick ="";
	List<reply> resultRp = new ArrayList<reply>();
	if (session.getAttribute("loginCheck") == "true") {
	    userlistDAO userDAO = new userlistDAO(); 
	    String user_id = (session.getAttribute("userID")+"");
	    String result = userDAO.getNICK(user_id); 
	    user_nick = result;
		boardDAO boardDAO = new boardDAO(); 
		boolean viewCheck;
		if ( postNum.equals(session.getAttribute("viewCheck"))) {
			viewCheck = true;
		} else {
			session.setAttribute("viewCheck", postNum);
			viewCheck = false;
		}
		request.setCharacterEncoding("UTF-8"); 
		results = boardDAO.postLoad(postNum, viewCheck); 
		replyDAO reply = new replyDAO(); 
		resultRp = reply.load(postNum); 
	} else {
		response.sendRedirect("plzReg.jsp");
	}



%>

<!DOCTYPE html>

<html>

	<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!-- 뷰포트 -->
	
	<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

		<link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="./css/index.css">
        <script src="./js/jquery-1.9.1.min.js"></script>
    	<script src="./js/board.js"></script>
    	<script src="./js/sweetalert.min.js"></script>
    	<script>

			var cvsResults = "<%=results%>";
			var sptemp = cvsResults.split("|");
			$(document).ready(function(){

				$("#postTitle").val(sptemp[4]);
				$("#postContent").text(sptemp[6].replaceAll("<br/>", "\n"));
				$("#postView").val("조회수 : " + sptemp[7]);
				$("#postWriter").val("작성자 : " + sptemp[3]);
				$("#postDate").val("작성일 : " + sptemp[5]);
				$("#postNumInput").val(sptemp[0]);
				console.log("테스트테스트 : " + $("#postNumInput").val(sptemp[0]) + "-"+sptemp[0]);
				
			})

			

    	</script>



		<title>게시물 보기</title>

	</head>

<body>





	<!-- 네비게이션  -->

	<nav class="navbar navbar-default">

		<div class="navbar-header">

			<button type="button" class="navbar-toggle collapsed"

				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

				aria-expaned="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span

					class="icon-bar"></span>

			</button>

			<a class="navbar-brand" href="main.jsp">분리분리</a>

		</div>

		<div class="collapse navbar-collapse"

			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="main.jsp">메인</a></li>

				<li class="active"><a href="bbs.jsp">게시물 조회</a></li>

			</ul>






		</div>

	</nav>

	<!-- 게시판 -->

	<div class="container">

		<div class="row">

			<form method="post" action="writeBoardAction.jsp">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시물 조회</th>
						</tr>

					</thead>

					<tbody>

						<tr>

							<td colspan="3"><input type="text" class="form-control form-control-plaintext" readonly id="postTitle" maxlength="50"/></td>

						</tr>
				
						<tr>
							<td><input type="text" class="form-control form-control-plaintext" readonly id="postWriter" maxlength="50"/></td>
							<td><input type="text" class="form-control form-control-plaintext" readonly id= "postDate" maxlength="50"/></td>
							<td><input type="text" class="form-control form-control-plaintext" readonly id="postView" maxlength="50"/></td>
						</tr>

						<tr>

							<td colspan="3"><textarea class="form-control form-control-plaintext" readonly id="postContent" maxlength="2048" style="height: 350px;"></textarea></td>

						</tr>
						<tr>

						</tr>

					</tbody>


				</table>	


			</form>

		</div>

	</div>
	<div>
		<% 
			for( reply index : resultRp) {
		%>
				<div>
					<jsp:include page="replyView.jsp" >
						<jsp:param name="userNick" value="<%= index.getUser_nick() %>" />
						<jsp:param name="writerID" value="<%= index.getUser_id() %>" />
						<jsp:param name="date" value="<%=index.getDate() %>" />
						<jsp:param name="content" value="<%=index.getContent() %>" />
					</jsp:include>
				</div>
		<%
			}
		%>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<div class="card mb-2">

							<div class="card-body">
								<ul class="list-group list-group-flush">
									
									<li class="list-group-item" style="width:100%; min-height:190px;">
										<i>댓글을 남겨주세요</i>
										<form method="post" class="form-inline mb-2" action="writeReplyAction.jsp">
											<input type="text" style="display:none;" id="postNumInput" value="" name="postNum" />
											<textarea class="form-control" id="exampleFormControlTextarea1" name="replyContent" style="resize: none;width:100%" rows="5"></textarea>
											<input type="submit" class="btn btn-primary pull-right" style="min-width:5%; margin-top: 5px;" value="작성" />
										</form>
									</li>
								   
								</ul>
							</div>
						</div>
					
					</tr>
				</tbody>
			</table>
		</div>
	</div>











</body>

</html>


