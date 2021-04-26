<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="board.boardDAO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>



<% //사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환 
	boardDAO boardDAO = new boardDAO(); 
	ArrayList<String> result = boardDAO.load(); 
	PrintWriter script = response.getWriter(); 
	script.close(); 
    
%>



<html>
     <head> 
        <link rel="stylesheet" href="./css/index.css">
        <script src="./js/jquery-1.9.1.min.js"></script>
    	<script src="./js/index.js"></script>
    	<script src="./js/sweetalert.min.js"></script>
    	<script>
    	
    	</script>
     </head> 
</html>


