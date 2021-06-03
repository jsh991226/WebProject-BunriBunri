<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="board.boardDAO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>	
<%@ page import="board.reply"%> 
<%@ page import="board.replyDAO"%> 





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
	

	<div class="container" style="height: 130px;margin-bottom:10px;width:100%;">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<div class="card mb-2">
							<div class="card-body">
								<ul class="list-group list-group-flush">
	
									<li class="list-group-item" style="width:100%; min-height:130px;">
										<span class="rpWriter">로그인 후 내용을 확인할 수 있습니다!</span>


										<form method="post" class="form-inline mb-2" action="writeReplyAction.jsp">
											<textarea class="form-control whiteinput" id="replyTag" readonly name="replyContent" style="resize: none;width:100%" rows="3">
											분리분리의 회원이 되어 더욱 많은 답변을 확인 해보세요!
											</textarea>
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




</html>