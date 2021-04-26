<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="userlist.userlistDTO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>



<% 
	if (true) {
		request.setCharacterEncoding("UTF-8"); 
		session.setAttribute("loginCheck", null);
		session.setAttribute("userID", null);
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('[알림] 로그아웃 되었습니다.')"); 
		script.println("location.href='index.jsp';"); 
		script.println("</script>"); 
		script.close(); 
		return; 		
	}

%>

