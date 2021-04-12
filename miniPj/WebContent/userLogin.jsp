<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="userlist.userlistDTO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>


<% //사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환 
    request.setCharacterEncoding("UTF-8"); 
    String userID = null; String userPW = null;
    if (request.getParameter("userID") != null) { 
        userID = (String) request.getParameter("userID"); 
    } 
    if (request.getParameter("userPW") != null) { 
        userPW = (String) request.getParameter("userPW"); 
    } 

    
    if (userID == null || userPW == null) { 
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
        script.println("alert('[알림] 빈칸이 존재합니다.')"); 
        script.println("</script>"); 
        script.close(); 
        return; 
    } 
    userlistDAO userDAO = new userlistDAO(); 
    int result = userDAO.login(userID, userPW); 
    if (result == 1) {
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
        script.println("alert('[알림] true')"); 
        script.println("</script>"); 
        script.close(); 
        return; 
    } else if (result != 1 ){
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
        script.println("alert('[알림] false')"); 
        script.println("</script>"); 
        script.close(); 
        return; 
        
    }

    
    
    
%>

