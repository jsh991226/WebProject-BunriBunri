<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="board.boardDAO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="javax.servlet.ServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>



<% //사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환 
	request.setCharacterEncoding("UTF-8"); 
	String upload = request.getParameter("uploadFile");
	String UserFile = "null";
	Enumeration<String> en = request.getHeaderNames();
	String saveDirectory = "C:/Users/jsh99/git/repository/miniPj/WebContent/upload";
	File saveDir = new File(saveDirectory);
	if (!saveDir.exists())
		saveDir.mkdirs();
	int maxPostSize = 1024 * 1024 * 10;
	String encoding = "UTF-8";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest mrequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy); 
	try{
		String name = mrequest.getParameter("name");
		File uploadFile = mrequest.getFile("uploadFile");
		String originalFileName = mrequest.getOriginalFileName("uploadFile");
		String filesystemName = mrequest.getFilesystemName("uploadFile"); 
		System.out.println("> 업로드된 파일 명 : " + filesystemName);		
		UserFile = filesystemName;
	} catch(Exception e){
		System.out.print(e);
	}
	
	 String boardTitle = (String)mrequest.getParameter("boardTitle"); 
	 String postNum = (String)mrequest.getParameter("postNum"); 
	 String editPhoto = (String)mrequest.getParameter("editPhoto"); 
     String boardContent = (String)mrequest.getParameter("boardContent").replace("\r\n", "<br/>"); 

    
    if (boardTitle == "" || boardContent == "") { 
        PrintWriter script = response.getWriter();
        script.println("<script>"); 
        script.println("alert('[알림] 제목이나 내용이 입력되지 않았습니다.')"); 
        script.println("window.history.back()");
        script.println("</script>"); 
        script.close(); 
        return; 
    } 
    
    String user_id = (session.getAttribute("userID")+"");
    boardDAO _boardDAO = new boardDAO(); 
    
    int result = _boardDAO.editPost(boardTitle, boardContent, user_id, UserFile, postNum);
    if (result == 1) { 
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
        script.println("alert('[알림] 게시물이 수정되었습니다.')"); 
        script.println("location.href='index.jsp';"); 
        script.println("</script>"); 
        script.close(); 
        return; 
	} else if ( result < 0) {
        PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
		if ( result == -1) {
	        script.println("alert('[알림] 엥 디비오류 관리자한테 문의쩜,,,.')"); 
		} else {
	        script.println("alert('[알림] 무언가 오류가 있다 이말이야~')"); 
		}
        script.println("location.href='index.jsp';"); 
        script.println("</script>"); 
        script.close(); 		
        return; 		
	}
    
    
    
    
%>

