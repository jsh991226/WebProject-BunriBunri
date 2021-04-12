<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="userlist.userlistDTO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>


<% //사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환 
    request.setCharacterEncoding("UTF-8"); 
    String userID = null; String userPW = null; String userNICK = null; String userEMAIL = null; 
    if (request.getParameter("userID") != null) { 
        userID = (String) request.getParameter("userID"); 
    } 
    if (request.getParameter("userPW") != null) { 
        userPW = (String) request.getParameter("userPW"); 
    } 
    if (request.getParameter("userNICK") != null) { 
        userNICK = (String) request.getParameter("userNICK"); 
    } 
    if (request.getParameter("userEMAIL") != null) { 
        userEMAIL = (String) request.getParameter("userEMAIL"); 
    }     

    
    if (userID == null || userPW == null || userNICK == null || userEMAIL == null) { 
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
        script.println("alert('[알림] 빈칸이 존재합니다.')"); 
        script.println("</script>"); 
        script.close(); 
        return; 
    } 
    userlistDAO userDAO = new userlistDAO(); 
    int result = userDAO.join(userID, userPW, userNICK, userEMAIL); 
    if (result == 1) { 
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
        script.println("console.log('[알림] 회원가입에 성공했습니다.')"); 
        script.println("alert('[알림] 회원가입에 성공했습니다.')"); 
        script.println("location.href='index.jsp';"); 
        script.println("</script>"); 
        script.close(); 
        return; 
	} else if ( result < 0) {
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
		if ( result == -2) {
	        script.println("alert('[알림] 해당 ID는 이미 존재합니다.')"); 
		} else if ( result == -3) {
	        script.println("alert('[알림] 해당 닉네임은 이미 존재합니다.')"); 
		} else if ( result == -4) {
	        script.println("alert('[알림] 해당 이메일은 이미 존재합니다.')"); 
		} else {
	        script.println("alert('[알림] 무언가 오류가 있다 이말이야~')"); 
		}
        script.println("location.href='index.jsp';"); 
        script.println("</script>"); 
        script.close(); 		
        return; 		
	}
    
    
    
    
%>

