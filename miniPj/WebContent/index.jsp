<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 

<html>
     <head> 
        <link rel="stylesheet" href="./css/index.css">
        <script src="./js/jquery-1.9.1.min.js"></script>
    	<script src="./js/index.js"></script>
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


                </div>
                <div id="rightContent">
                    <div id="loginBox">
				        <form action="./userLogin.jsp" method="post"> 
				             <input type="text" placeholder="ID" name="userID"> 
				             <input type="password" placeholder="Password" name="userPW"> 
				             <input type="submit" value="로그인"> 
				        </form>                    
						<form action="./userJoinAction.jsp" method="post"> 
				             <input type="text" placeholder="ID" name="userID"> 
				             <input type="password" placeholder="Password" name="userPW"> 
				             <input type="text" placeholder="Nickname" name="userNICK"> 
				             <input type="email" placeholder="Email" name="userEMAIL"> 
				             <input type="submit" value="가입"> 
				        </form>    				        
                    </div>
                
                </div>

            </div>

        </div>

        
     </body> 
 </html>

