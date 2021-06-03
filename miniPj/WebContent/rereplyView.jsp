<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="board.boardDAO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>	
<%@ page import="board.reply"%> 
<%@ page import="board.replyDAO"%> 


<%
	String userNick = request.getParameter("userNick"); 
	String date = request.getParameter("date"); 
	String content = request.getParameter("content"); 
	String writerID = request.getParameter("writerID"); 
	String replyID = request.getParameter("replyID"); 
	String postNum = request.getParameter("postNum"); 



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


    	</script>
    	
	
	</head>
	

	<div class="container"style="width:100%;">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<div class="card mb-2">
							<div class="card-body">
								<div style="width:5%;float:left;text-align: center;line-height: 110px;font-size:1.3em;">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
								</svg></div>	
								<div style="width:95%;float:left;">						
								<ul class="list-group list-group-flush">
									<li class="list-group-item" style="min-height:110px;margin-bottom: -30px;">
										<span id="<%=writerID%>"><%=userNick%></span>
										<span style="margin-left: 10px;font-size:0.8em">(<%=date%>)</span>								
										<form method="post" class="form-inline mb-2 "> <!--  action="writeRereplyAction.jsp" target="_self" -->
											<input type="text" style="display:none;" id="postNumInput2" name="postNum"/>
											<input type="text" style="display:none;" id="replyIDInput2" name="replyID"/>
											<textarea class="form-control whiteinput" id="replyTag" readonly style="resize: none;width:100%" rows="3"><%=content%></textarea>
										</form>
									</li>
								</ul>
								</div>
							</div>
						</div>
					
					</tr>
				</tbody>
			</table>
		</div>
	</div>



</html>