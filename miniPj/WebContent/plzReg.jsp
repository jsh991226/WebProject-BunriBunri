<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 


<!DOCTYPE html> 

<html>
     <head> 
		<link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="./css/index.css">
        <script src="./js/jquery-1.9.1.min.js"></script>
    	<script src="./js/index.js"></script>
    	<script src="./js/sweetalert.min.js"></script>
    	<script>
    	
    	</script>
     </head> 
    <body> 


        <div id="wrapper">
            <div id="header">
            	<img id="titleImg" src="./images/logosample.png" />                
            </div>
            <div id="content">
                <div id="leftContent">
					<h1>아직 개발중인 홈페이지입니다</h1>

                </div>
                <div id="rightContent">
                    <div id="loginBox">
                    	<i>로그인</i>
				        <form action="./userLogin.jsp" method="post"> 
				             <input type="text" placeholder="ID" class="form-control" name="userID"> 
				             <input type="password" placeholder="Password" class="form-control" name="userPW"> 
				             <input type="submit" class="btn btn-primary" value="로그인"> 
				        </form>                    
				        <div style="height:100px"></div>
				        <i>회원가입</i>
						<form action="./userJoinAction.jsp" method="post"> 
				             <input type="text" placeholder="ID" class="form-control" name="userID"> 
				             <input type="password" placeholder="Password" class="form-control" name="userPW"> 
				             <input type="text" placeholder="Nickname" class="form-control" name="userNICK"> 
				             <input type="email" placeholder="Email" class="form-control" name="userEMAIL"> 
				             <input type="submit" class="btn btn-primary" value="가입"> 
				        </form>    				        
                    </div>
                
                </div>

            </div>

        </div>

        
     </body> 
 </html>

