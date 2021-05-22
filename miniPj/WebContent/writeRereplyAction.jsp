<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="board.boardDAO"%> 
<%@ page import="board.replyDAO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>


<% //사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환 
    request.setCharacterEncoding("UTF-8"); 
	String postNum = (String) request.getParameter("postNum"); 
	String replyID = (String) request.getParameter("replyID"); 
    String replyContent = (String) request.getParameter("replyContent").replace("\r\n", "<br/>"); 

    
    
	String results = "";
	String user_nick ="";
	if (session.getAttribute("loginCheck") == "true") {
	    userlistDAO userDAO = new userlistDAO(); 
	    String user_id = (session.getAttribute("userID")+"");
	} else {
		response.sendRedirect("plzReg.jsp");
	}
    
    
    
    if (postNum == "" || replyContent == "") { 
        PrintWriter script = response.getWriter();
        script.println("<script>"); 
        script.println("alert('[알림] 작성한 대댓글 양식이 올바르지 않습니다 "+ postNum +" .')"); 
        script.println("window.history.back()");
        script.println("</script>"); 
        script.close(); 
        return; 
    } 
    String user_id = (session.getAttribute("userID")+"");
    replyDAO replyDAO = new replyDAO(); 
    
    int result = replyDAO.reWrite(postNum, replyID, replyContent, user_id); 
    if (result == 1) { 
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
        script.println("console.log('[알림] 답글이 작성되었습니다.')"); 
        script.println("location.href='viewPost.jsp?postNum="+ postNum + "';");
        script.println("</script>"); 
        script.close(); 
        return; 
	} else if ( result < 0) {
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
		if ( result == -1) {
	        script.println("alert('[알림] 엥 답글 디비오류 관리자한테 문의쩜,,,.')"); 
		} else {
	        script.println("alert('[알림] 무언가 답글에 오류가 있다 이말이야~')"); 
		}
        script.println("location.href='index.jsp';"); 
        script.println("</script>"); 
        script.close(); 		
        return; 		
	}
    
    
    
    
%>

