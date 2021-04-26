<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="board.boardDAO"%> 
<%@ page import="board.Board"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<%
	request.setCharacterEncoding("UTF-8"); 
	List<Board> results = new ArrayList<Board>();
	String user_nick ="";
	if (session.getAttribute("loginCheck") == "true") {
	    userlistDAO userDAO = new userlistDAO(); 
	    String user_id = (session.getAttribute("userID")+"");
	    String result = userDAO.getNICK(user_id); 
	    user_nick = result;
		boardDAO boardDAO = new boardDAO(); 
		results = boardDAO.load(); 
	} else {
		response.sendRedirect("plzReg.jsp");
	}



%>

<!DOCTYPE html> 

<html>
	<head>
        <link rel="stylesheet" href="./css/index.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <script src="./js/jquery-1.9.1.min.js"></script>
    	<script src="./js/board.js"></script>
    	<script src="./js/sweetalert.min.js"></script>
    	<script>
	    	var nowPage = 0;
	    	var maxPage = parseInt(boardList.length/10);
	    	if (boardList.length%10>0) maxPage++;
			$(document).ready(function(){
				pageSet(1);
				for ( i = 2 ; i<=maxPage ; i++) {
					var $li = $("<li onClick='pageSet("+i+")'/>");
					$li.html("<a>"+i+"</a>");
					$("#boardNumBtn").append($li)
				}				
				
				$("#boardNumBtn").append('<li onClick="movePage(+1)" class="page-item"><a class="page-link" href="#">Next</a></li>')
				
			});

    	</script>	
	</head>
    <body>
    	<table class="table table-hover table-bordered">
    		<thead>
    			<tr>
    				<td>게시물번호</td>
    				<td>제목</td>
    				<td>작성자 </td>
    				<td>작성일</td>
    				<td>조회수</td>
    			</tr>
    		</thead>
			<tbody id="boardBody">
				<%
					for(Board index : results) {
				%>
				<tr class="boardPost" postNum="<%= index.getB_id() %>">
					<td><%= index.getB_id() %></td>
					<td><%= index.getTitle() + " [ " + index.getReplyCnt() + " ]"  %></td>
					<td><%= index.getUser_nick() %></td>
					<td><%= index.getDate() %></td>
					<td><%= index.getView() %></td>
				</tr>
				
				<%
					}
				%>

			</tbody>    	
    	
    	</table>
    	<div class="text-center">
    		<ul id="boardNumBtn" class=" pagination">
    			<li onClick="movePage(-1)" class="page-item"><a class="page-link" href="#">Prev</a></li>
    			<li class="active" onClick='pageSet(1)'><a>1</a></li>
    			
    		</ul>
    	</div>

     </body> 
 </html>

