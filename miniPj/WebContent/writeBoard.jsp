<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="board.boardDAO"%> 
<%@ page import="userlist.userlistDAO"%> 
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>


<%
	request.setCharacterEncoding("UTF-8"); 
	ArrayList<String> results = new ArrayList<String>();
	String user_nick ="";
	if (session.getAttribute("loginCheck") == "true") {
	    userlistDAO userDAO = new userlistDAO(); 
	    String user_id = (session.getAttribute("userID")+"");
	    String result = userDAO.getNICK(user_id); 
	    user_nick = result;
		boardDAO boardDAO = new boardDAO(); 

	} else {
		PrintWriter script = response.getWriter(); 
        script.println("<script>"); 
        script.println("alert('[알림] 로그인이 필요한 서비스 입니다.')"); 
        script.println("location.href='index.jsp';");
        script.println("</script>"); 
        script.close(); 
		
		
	}



%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

		<link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="./css/index.css">
        <script src="./js/jquery-1.9.1.min.js"></script>
    	<script src="./js/board.js"></script>
    	<script src="./js/index.js"></script>
    	<script src="./js/sweetalert.min.js"></script>
    	<script type="text/javascript">
			$(document).ready(function(){
				$("#fileInput").on('change', function(){ // 값이 변경되면
					if(window.FileReader){ // modern browser
						var filename = $(this)[0].files[0].name;
					} else { // old IE
						var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
					}
						// 추출한 파일명 삽입
					$("#userfile").val(filename);
				});
			});
		</script>



<title>글쓰기</title>

</head>

<body>





	<!-- 게시판 -->

	<div class="container">

		<div class="row">

			<form method="post" action="writeBoardAction.jsp?v=999" accept="image/*" enctype="Multipart/form-data">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">



					<tbody>

						<tr>

							<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50"/></td>

						</tr>

						<tr>

							<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 350px;"></textarea></td>

						</tr>
						<tr>
							<td>
								<img src="" id="loadImg" style="margin:10px;display:none;"/>
							</td>
						</tr>
						<tr>
							<td style="width:300px"	class="form-group">
								<label for="InputSubject1">파일첨부</label>
								<input id="fileInput" name="uploadFile" filestyle="" onchange="fileUpload(this);" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
								<div class="bootstrap-filestyle input-group">
									<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
									<span class="group-span-filestyle input-group-btn" tabindex="0">
									<label for="fileInput" class="btn btn-default">
									<span class="glyphicon fa fa-upload">파일선택</span>
									</label>
									</span>
								</div>

							</td>
						</tr>

					</tbody>
					

				</table>	

				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />
			</form>

		</div>

	</div>










</body>

</html>


