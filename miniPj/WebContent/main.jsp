<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="userlist.userlistDTO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>


<%
	request.setCharacterEncoding("UTF-8"); 
	String user_nick ="";
	if (session.getAttribute("loginCheck") == "true") {
	    userlistDAO userDAO = new userlistDAO(); 
	    String userID = (session.getAttribute("userID")+"");
	    String result = userDAO.getNICK(userID); 
	    user_nick = result;
		
	} else {
		response.sendRedirect("plzReg.jsp");
	}


%>

<!DOCTYPE html> 

<html>
     <head> 
        <link rel="stylesheet" href="./css/index.css">
        <script src="./js/jquery-1.9.1.min.js"></script>
    	<script src="./js/index.js"></script>
    	<script src="./js/sweetalert.min.js"></script>
    	<script>
    	$(document).ready(function(){
	   		 var user_id = '<%=user_nick%>';
			$('#nickZone').text(user_id);    		
    	})

    	</script>
     </head> 
    <body> 


        <div id="wrapper">
            <div id="header">
            	<a href="main.jsp"><img id="titleImg" src="./images/logosample.png" />   </a>
            	             
            </div>
            <div id="content">
                <div id="leftContent">
					<div id="header">
         			   <jsp:include page="board.jsp" />
					</div>
						
                </div>
                <div id="rightContent">
                	<p><%=user_nick%> 님 환영한다능<p>
                	<button onclick="location='userLogout.jsp'">로그아웃</button>
                	<button onclick="location='writeBoard.jsp'">글쓰기</button>
                	<button onclick="location='mypage.jsp'">내정보</button>
               		
                
                </div>

            </div>

        </div>

        
     </body> 
 </html>

