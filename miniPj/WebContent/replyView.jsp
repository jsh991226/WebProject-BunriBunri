<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="board.boardDAO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>	
<%@ page import="board.reply"%> 
<%@ page import="board.replyDAO"%> 


<%
	request.setCharacterEncoding("UTF-8"); 
	String userNick = request.getParameter("userNick"); 
	String date = request.getParameter("date"); 
	String content = request.getParameter("content"); 
	String writerID = request.getParameter("writerID"); 
	String replyID = request.getParameter("replyID"); 
	String postNum = request.getParameter("postNum"); 

	String results = "";
	String user_nick ="";
	String user_id = "";
	if (session.getAttribute("loginCheck") == "true") {
	    userlistDAO userDAO = new userlistDAO(); 
	    user_id = (session.getAttribute("userID")+"");
	    String result = userDAO.getNICK(user_id); 
	    user_nick = result;

	} else {
		response.sendRedirect("plzReg.jsp");
	}



%>



<html>
	<head>
		<link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="./css/index.css">
        <link rel="stylesheet" href="./css/index.css">
        
        <script src="./js/jquery-1.9.1.min.js"></script>
    	<script src="./js/index.js"></script>
    	<script src="./js/sweetalert.min.js"></script>

    	<script>
    		$(document).ready(function(){
    			$(".container").addClass('replyGroup_' + <%=replyID%>)
    			
    		})

    	</script>
    	
	
	</head>
	

	<div class="container" style="height: 130px;margin-bottom:10px;">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<div class="card mb-2">
							<div class="card-body">
								<ul class="list-group list-group-flush">
	
									<li class="list-group-item" style="width:100%; min-height:130px;">
										<span id="<%=writerID%>">작성자 : <%=userNick%></span>
										<span style="margin-left: 50px">작성일 : <%=date%></span>
										 <a class="rereplyWrite pull-right" postNum='<%=postNum%>' replyID='<%=replyID%>' onClick="rereplyWrite('<%=postNum%>', '<%=replyID%>')" >[답글]</a>
										<% 
											if (writerID.equals(user_id)) {
										%>	
											<svg xmlns="http://www.w3.org/2000/svg" style="margin-right: 10px" width="16" height="16" fill="currentColor" onClick="replyDelete('<%=postNum%>', '<%=replyID%>')" class="bi bi-x-circle pull-right replyDelete" viewBox="0 0 16 16">
											  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
											</svg>							
											<svg style="margin-right: 10px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" onClick="replyEdit('<%=postNum%>', '<%=replyID%>')" class="bi bi-pencil-square pull-right replyEdit" viewBox="0 0 16 16">
											  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
											  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
											</svg>											
										<%	}
										 %>			 
										 

										<form method="post" class="form-inline mb-2" action="writeReplyAction.jsp">
											<textarea class="form-control" id="replyTag" readonly name="replyContent" style="resize: none;width:100%" rows="3"><%=content%></textarea>
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
	<li style="list-style:none;" class="rrpTag rereplyli<%=replyID%>"></li>



</html>