<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.boardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="userlist.userlistDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<%

%>

<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/policy.css">
<script src="./js/jquery-1.9.1.min.js"></script>
<script src="./js/index.js"></script>
<script src="./js/policy.js"></script>
<script src="./js/sweetalert.min.js"></script>
<script>
	var nowShow = false;
	var finalShow;

	
</script>

<meta charset="UTF-8">
<title>Document</title>

</head>
<body style="padding:0;overflow:hidden;">
	<a href="#" class="top">TOP</a>
	<div id="header">
		<a href="index.jsp"><img id="titleImg"src="./images/bunribunriWebLogo.png" /> </a>
		<ul>
			<%
			if (session.getAttribute("loginCheck") == "true") {
			%><li onClick="viewPage('logout')">로그아웃</li>
			<li onClick="viewPage('mypage')">마이페이지</li>
			<%
			} else {
			%><li onClick="viewPage('register')">회원가입</li>
			<li onClick="viewPage('login')">로그인</li>
			<%
			}
			%>
			<li onClick="viewPage('CallCenter')">고객센터</li>
		</ul>

	</div>
	<div id="mainView" style="margin-top:120px;margin-left:400px;">
    <svg style='overflow:visible' xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 330 330">
        <defs>
            <filter id="dropshadow">
                <feGaussianBlur in="SourceAlpha" stdDeviation="3" />
                <feOffset dx="2" dy="2" result="offsetblur" />
                <feMerge>
                    <feMergeNode />
                    <feMergeNode in="SourceGraphic" />
                </feMerge>
            </filter>
        </defs> 
        <g filter="url(#dropshadow)" >
        <path id="Seoul" class="OUTLINE" d =" M 178 231 l -4 2 -4 3 -1 0 0 1 -3 1 -4 -5 -4 0 -6 1 -4 3 -2 -1 -1 -1 -3 2 -3 -3 -1 -3 -2 -3 0 0 -1 -2 -3 2 -3 1 -2 -4 0 -8 -3 -1 0 0 0 0 0 0 -2 -1 -3 -2 2 -4 3 -3 0 -1 0 0 0 0 0 -1 1 0 4 2 7 1 2 -2 0 1 2 0 1 -4 2 -8 7 -1 4 2 0 -3 1 -1 2 -4 3 -4 2 0 3 2 7 2 2 8 1 4 1 1 0 0 0 2 0 2 0 1 0 0 -1 6 3 0 8 -1 0 5 -4 3 -1 5 z " />
        <path id="Busan" class="OUTLINE" d =" M 496 722 l 0 4 -1 0 -2 -5 -1 6 -1 -2 0 0 -1 0 -1 1 -1 2 0 1 -1 -1 -1 -6 -1 -6 -2 3 -2 -3 0 2 0 0 0 0 0 0 0 0 -1 0 1 0 -4 1 -2 -5 -1 5 -1 2 0 0 -2 0 -7 -2 0 -2 2 -2 -1 -3 -5 -4 -2 -2 4 -1 9 0 0 -5 1 -6 5 -1 6 -2 7 -1 4 -6 1 -4 2 0 3 1 1 -3 6 -3 4 -1 1 -5 3 -6 7 0 3 -2 0 -3 0 0 2 -3 1 3 0 0 1 0 2 0 4 -1 4 4 1 3 0 1 -1 1 5 1 -7 4 -1 6 -1 4 -1 0 0 0 0 -1 -1 2 -1 1 2 2 -1 4 -2 4 -3 6 -3 4 0 1 0 0 -5 0 -4 0 -2 -1 -1 4 -1 4 1 -1 0 4 -7 0 -2 -4 -1 1 -3 4 z " />
        <path id="Daegu" class="OUTLINE" d =" M 441 530 l 3 1 3 7 0 4 2 9 1 7 -4 4 -2 -1 0 4 -1 2 -3 6 -2 7 0 8 -4 2 -4 2 -3 1 -3 -5 -6 0 -5 3 -1 6 -3 7 -2 3 -5 0 -7 3 -7 1 0 -8 -4 -4 -1 -3 5 -2 6 0 0 -5 -5 -4 -1 -5 3 -5 3 -2 8 -1 0 -5 -8 -4 -6 0 0 -5 2 -5 3 -4 3 -3 5 -1 2 7 3 3 1 0 2 -4 3 -7 0 -7 2 2 1 1 3 -2 6 -4 3 -3 5 -1 z " />
        <path id="Incheon" class="OUTLINE" d =" M 91 229 l 1 -2 0 1 0 0 1 0 1 0 0 -1 1 0 -1 -1 0 0 0 0 2 0 -4 -5 0 -5 1 -3 0 0 1 0 -1 0 0 -1 0 0 1 -1 0 -1 4 -1 4 -1 -5 -1 -3 -1 -1 -1 -2 1 1 -3 5 -3 3 -4 4 1 3 3 5 4 4 3 5 2 -2 4 -1 3 -1 5 -2 2 2 5 2 3 -1 7 -1 2 -2 3 -1 -3 -1 6 -7 2 -1 6 -6 1 -1 0 -3 -5 -2 -4 -1 -5 5 -2 -4 -2 0 -3 -2 2 z M 82 219 l 3 1 0 0 1 2 2 3 -2 2 -4 1 -8 5 -9 7 -4 -2 -3 -3 -1 0 -2 1 -2 -4 4 -5 4 -2 7 -1 7 -3 1 -4 z M 64 156 l 3 2 4 4 7 4 0 4 2 3 -1 2 -2 4 2 3 -1 4 0 3 2 0 0 2 -1 1 1 1 -1 1 1 2 1 2 1 1 -1 0 -5 4 -8 1 -8 0 -5 -4 0 -4 4 -3 0 -5 -2 -4 1 0 0 -1 -5 -3 -1 -8 0 -7 4 -4 0 0 1 0 z " />
        <path id="Gwangju" class="OUTLINE" d =" M 113 687 l 2 3 6 3 7 -3 4 -2 2 0 1 0 0 0 0 0 1 0 0 0 1 -1 4 0 4 3 2 3 -1 1 1 1 3 4 6 3 1 4 -1 7 -4 4 -3 4 -7 1 -7 0 -6 2 -1 1 -1 0 -1 1 -4 1 -8 -1 0 -4 -4 -5 -4 -1 -7 0 -4 -7 -1 -1 3 -3 2 -6 2 -4 2 0 1 1 4 -4 1 -4 0 0 0 0 z " />
        <path id="Daejeon" class="OUTLINE" d =" M 223 432 l 1 6 4 1 0 0 3 0 4 -4 1 0 0 2 -1 2 3 2 2 6 5 1 0 5 -2 6 -2 3 -2 7 -1 8 1 7 -5 3 -2 4 -7 -1 -3 -4 -2 -1 1 -2 -1 -2 1 -1 0 0 -3 -2 -2 6 -1 6 -3 4 -1 1 -1 -4 -3 -4 -1 1 -1 0 -2 -3 -1 -7 -5 -4 1 -2 1 -3 2 -8 1 -7 0 -6 9 -3 2 -3 2 -3 2 -5 z " />
        <path id="Ulsan" class="OUTLINE" d =" M 550 641 l 2 6 -1 7 -1 8 -3 3 0 0 -1 0 0 1 0 0 -2 1 -5 -1 1 -1 0 -1 -1 -3 -4 -4 -4 1 -2 0 -1 0 0 0 -1 -3 -1 -7 -4 -1 -6 -2 -4 -5 -2 -3 -4 -3 -5 -3 -1 -3 -3 1 -1 0 0 0 -2 0 -3 -2 -4 -4 5 -5 0 -8 3 -4 1 0 1 1 4 -3 3 0 -2 -3 0 -2 1 -1 0 -1 2 -4 4 -2 4 -1 9 -1 5 0 4 3 3 3 4 7 6 -1 3 -2 4 -2 7 2 1 0 7 3 2 8 0 7 -1 8 -2 4 2 -1 -2 5 -1 4 -1 -1 0 1 -2 1 -2 -6 -3 -6 -3 -1 2 2 -2 1 2 1 1 3 -3 1 2 0 0 0 1 1 0 4 z " />
        <path id="Sejong" class="OUTLINE" d =" M 184 410 l -2 -2 0 -5 1 -9 -1 -4 -1 1 0 0 -1 0 -1 -4 3 -4 3 0 5 2 5 3 6 3 2 0 0 0 0 0 0 0 2 1 2 2 -2 4 -1 4 2 4 0 3 0 3 2 1 3 3 6 2 3 4 3 2 0 8 -6 2 -2 5 -2 3 -2 3 -9 3 -6 -1 -6 -4 -1 -3 -3 -9 0 -7 2 -7 1 -4 0 0 0 0 -1 1 z " />
        <path id="Gyeonggi" class="OUTLINE" d =" M 81 192 l 1 -2 -1 -1 -1 -7 -1 -3 1 -3 1 -4 -2 -3 0 -5 4 2 4 2 4 1 3 -1 4 -2 4 0 3 5 -1 -4 -1 -12 -1 -1 0 -1 0 0 0 0 0 0 0 0 3 -2 -1 -5 0 0 1 -3 0 -5 -1 1 -1 -4 3 -6 7 -2 7 -2 3 -2 5 -2 1 -4 1 -1 1 -1 3 -3 1 -6 1 -7 4 -4 3 -2 3 2 1 0 3 -5 1 -3 0 0 1 -2 2 -3 3 -7 8 2 3 -5 1 0 1 0 3 0 0 0 1 0 0 0 0 0 1 0 0 0 1 0 3 1 3 -1 1 0 1 3 4 9 1 5 6 1 4 -2 3 -3 4 0 -1 1 -1 5 0 6 4 2 3 3 2 -1 5 -3 5 0 6 2 1 5 1 8 2 6 6 2 6 1 2 5 6 3 4 3 1 3 -1 1 1 2 0 1 -1 4 -4 3 -5 4 -4 6 0 5 -1 2 1 2 1 6 -3 3 -1 4 7 1 -1 7 0 8 8 0 5 1 4 3 5 3 3 4 4 0 4 0 1 -1 3 2 7 3 4 3 1 2 -5 2 -4 2 1 1 -1 0 -3 4 2 5 2 3 0 6 -1 3 -1 5 -4 7 0 8 -1 7 0 6 -1 4 -1 6 -4 6 -2 5 -4 3 -8 0 0 7 -3 4 -1 1 -1 -1 -1 1 0 -1 0 3 -5 3 0 2 0 0 -2 1 -4 -2 -2 0 -3 1 -2 -1 -3 0 -2 5 -3 4 -5 3 -4 3 1 1 1 1 -5 4 -4 2 -4 2 -4 1 1 3 0 1 0 0 0 0 -2 3 -4 -4 -6 -3 -3 -3 -5 -3 -5 -2 -8 2 -1 3 -1 0 -2 0 -4 1 -7 1 -8 2 -6 2 -3 4 0 -4 -8 1 -8 -1 0 -7 3 -8 -9 -1 2 -7 -6 -3 -1 -5 -10 -11 0 -5 0 -4 -2 1 -1 -1 -1 1 -1 0 0 0 0 0 0 0 1 -4 2 -3 -3 0 -1 -4 -3 -5 -2 0 -2 1 -2 -1 2 3 -7 1 0 -7 0 -7 3 -2 -1 -1 1 0 6 -4 2 0 -3 1 -4 4 -2 3 2 1 4 3 3 3 -1 1 2 1 3 3 0 1 0 4 2 -1 3 -1 -2 -2 0 0 0 -1 1 -1 -1 -2 0 0 0 0 -1 -2 5 -3 6 1 5 0 0 0 1 2 -1 1 1 1 0 1 1 -4 1 0 -1 6 3 -6 1 -4 2 -1 -1 -1 3 0 4 3 1 1 1 -2 1 0 0 0 2 1 -1 -2 -7 -3 -7 -2 -4 -1 0 0 -1 0 -2 -2 -8 -5 -1 -4 9 -7 7 -2 -5 -2 0 -1 1 -1 0 -1 1 -2 1 -7 -2 -3 -2 -5 2 -2 1 -5 1 -3 3 2 2 1 0 0 0 0 0 0 3 1 0 8 2 4 3 -1 3 -2 1 2 0 0 2 3 1 3 3 3 3 -2 1 1 2 1 4 -3 6 -1 4 0 4 5 3 -1 0 -1 1 0 4 -3 4 -2 3 -8 1 -5 4 -3 0 -5 -8 1 -3 0 1 -6 0 0 0 -1 0 -2 0 -2 0 0 -1 -1 -1 -4 -2 -8 -7 -2 -3 -2 -2 0 -3 4 -2 4 -1 1 0 3 -4 -2 -7 1 -2 8 -1 4 -2 0 0 -1 -2 2 -7 -1 -4 -2 -1 0 0 1 0 0 0 0 0 1 -3 3 -5 -2 -4 -3 -5 -4 -3 -3 -4 -1 -3 4 -5 3 -7 -1 -2 -5 z M 120 292 l -5 1 -3 4 -5 4 -2 2 9 10 5 0 -1 -7 -1 -2 0 -1 3 -2 5 -4 -3 -2 1 -1 1 -1 -1 -2 1 -4 z " />
        <path id="Gangwon" class="OUTLINE" d =" M 409 61 l 2 3 0 0 0 3 3 4 3 5 -2 4 2 -1 2 4 1 6 2 4 2 4 4 5 1 0 -1 0 2 3 4 6 5 5 1 3 4 5 0 0 1 0 0 3 4 6 4 4 3 5 2 4 3 3 3 5 0 -1 0 0 0 0 0 1 3 4 4 4 5 5 3 4 3 2 4 5 3 4 4 6 0 5 2 5 -1 0 1 0 4 4 4 3 0 0 0 0 0 0 0 0 0 1 0 -1 1 4 0 4 0 -1 1 4 2 7 4 4 4 4 2 4 1 1 -1 -1 0 0 0 2 2 4 4 3 4 3 2 7 1 4 0 -1 1 2 3 3 2 3 1 0 1 1 2 1 0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 1 1 2 5 0 6 1 8 2 5 -1 0 0 0 0 0 0 0 -1 -1 -1 1 -1 -1 -1 1 -5 4 -5 2 -3 4 -3 4 0 3 0 3 0 1 1 0 -5 0 -6 -3 -5 -4 -3 -2 -7 -1 -3 5 -3 0 -4 -2 0 1 -1 -1 -5 0 -4 0 0 0 -3 -2 -4 1 -4 6 -7 1 -6 -5 -4 -2 -2 0 -3 4 -1 7 -6 -1 -4 -1 -5 -3 -5 -3 -2 -2 -2 1 -1 0 0 -1 -1 0 0 0 -2 1 -3 -1 -6 -2 -4 -4 -2 -2 -2 2 -5 1 -5 0 -4 -7 -2 -3 -1 1 0 0 -2 -1 -1 1 -2 -1 -1 1 -1 -1 0 1 -1 0 1 0 -4 2 -6 -1 -1 -3 5 -4 4 -5 -10 -2 -3 -2 0 0 -2 0 -3 -2 -5 -1 -3 5 -3 -1 -2 -1 -1 0 -1 -1 -2 4 -2 2 -4 2 -1 0 -1 0 -3 1 -2 -5 -2 -4 0 -1 0 0 -4 -3 -7 1 -5 4 0 1 1 5 0 4 -2 3 -4 2 -1 -1 -3 0 -2 1 -1 -1 -1 1 -4 1 -7 0 -4 -5 -2 -7 1 -6 1 -4 0 -6 1 -7 0 -8 4 -7 1 -5 1 -3 0 -6 -2 -3 -2 -5 3 -4 1 0 -1 -1 4 -2 5 -2 -1 -2 -4 -3 -7 -3 -3 -2 -1 1 -4 0 -4 0 -3 -4 -5 -3 -4 -3 -5 -1 -8 0 0 -8 1 -7 -7 -1 1 -4 3 -3 -1 -5 -1 -3 1 -2 0 -5 4 -6 5 -4 4 -3 1 -4 0 -1 -1 -2 1 -1 -1 -3 -4 -3 -6 -3 -2 -5 -6 -1 -6 -2 -2 -6 -1 -8 -1 -5 -6 -2 -5 0 -5 3 -2 1 -3 -3 -4 -2 0 -6 1 -5 1 -1 -4 0 -3 3 -4 2 -6 -1 -1 -5 -4 -9 -1 -3 -1 0 -3 1 -3 -1 0 -3 0 -3 -1 0 -1 -3 3 -1 -1 -1 2 -2 2 -2 0 0 0 0 1 4 6 -2 2 -2 -1 0 0 0 0 0 2 -1 4 -2 7 1 4 4 1 0 0 -1 0 0 -1 -1 0 0 1 0 0 0 0 0 0 -1 0 1 1 0 0 1 8 1 3 -6 6 0 8 3 3 1 4 2 4 -2 4 -2 6 -3 5 1 0 0 0 0 0 0 0 0 0 0 1 1 7 1 0 2 0 0 2 -2 1 2 6 0 3 0 3 -2 5 4 5 3 7 0 5 -5 0 0 4 1 8 3 2 3 1 1 1 -1 2 1 2 -3 5 0 6 -2 3 -5 6 -1 7 -1 2 -6 5 -3 6 -1 1 -5 2 -6 5 0 0 -5 0 1 0 -2 -3 0 3 -1 4 -8 1 -8 -1 -6 4 -2 6 3 1 4 2 8 3 5 2 4 2 6 2 6 3 4 3 5 3 7 1 3 z " />
        <path id="Chungcheongbugdo" class="OUTLINE" d =" M 321 275 l 4 3 0 0 0 1 2 4 2 5 3 -1 1 0 1 0 4 -2 2 -2 2 -4 1 1 1 0 2 1 3 1 3 -5 5 1 3 2 2 0 0 0 3 2 10 2 -4 5 -5 4 1 3 6 1 4 -2 -1 0 1 0 0 -1 1 1 1 -1 2 1 1 -1 1 1 1 0 1 -1 2 3 4 7 5 0 5 -1 2 -2 2 2 4 4 6 2 3 1 2 -1 0 0 1 0 0 1 1 0 2 -1 2 2 5 3 -4 1 -2 2 -3 -1 0 1 -5 3 -3 5 -4 3 -4 4 -4 2 -4 4 -2 5 -3 7 2 8 -2 6 -5 1 -7 1 -7 -3 -4 -3 -4 -4 -4 -2 0 0 -3 4 -2 6 -6 0 -5 -2 -1 -1 -3 2 -4 4 -1 2 -3 -3 -3 1 -1 5 -1 8 3 4 1 2 -5 0 -3 -3 -1 0 -4 2 -3 -2 -2 -1 -3 6 -6 2 -3 1 -1 1 0 0 0 1 4 1 4 3 1 5 -1 4 -1 2 1 1 -2 -1 -4 -5 -2 -4 0 -1 -4 4 0 4 0 0 -1 1 -6 2 1 5 7 3 2 5 4 3 0 5 -3 3 0 2 0 1 0 0 0 0 0 0 0 1 0 0 0 1 -1 4 0 2 2 2 -2 3 -1 3 3 3 -1 2 1 0 0 3 -3 4 -3 5 1 6 6 0 2 -3 2 3 4 3 2 2 1 0 1 1 2 0 3 -3 6 1 2 5 2 6 1 2 -4 -1 -7 0 0 8 -1 6 -3 4 0 1 0 2 -1 3 -3 6 -5 2 -4 3 -4 2 -9 -1 -8 2 -6 -2 -5 -2 -2 -3 -3 3 -2 -1 -5 -3 -1 -7 -4 -9 0 -6 0 -7 -2 -6 -6 -2 -8 0 -1 -7 1 -8 2 -7 2 -3 2 -6 0 -5 -5 -1 -2 -6 -3 -2 1 -2 0 -2 -1 0 -4 4 -3 0 0 0 -4 -1 -1 -6 0 -8 -3 -2 -3 -4 -6 -2 -3 -3 -2 -1 0 -3 0 -3 -2 -4 1 -4 2 -4 -2 -2 -1 -2 3 -4 5 -5 5 -4 7 1 -1 -5 -1 -5 -5 -4 -5 -2 -2 -5 -3 -5 -3 -3 2 -3 0 0 0 0 0 -1 -1 -3 4 -1 4 -2 4 -2 5 -4 -1 -1 -1 -1 4 -3 5 -3 3 -4 2 -5 3 0 2 1 3 -1 2 0 4 2 2 -1 0 0 0 -2 5 -3 0 -3 0 1 1 -1 1 1 1 -1 3 -4 0 -7 8 0 4 -3 2 -5 4 -6 2 7 4 5 7 0 4 -1 1 -1 1 1 2 -1 3 0 1 1 4 -2 2 -3 0 -4 -1 -5 0 -1 5 -4 z " />
        <path id="Chungcheongnamdo" class="OUTLINE" d =" M 53 418 l 1 8 2 5 2 2 0 4 -1 2 3 2 1 2 0 0 -1 5 -6 -1 -5 -2 0 -3 1 0 -3 -2 -1 -6 -2 2 1 -5 1 -3 -1 0 0 0 -1 0 0 -3 0 -8 -2 -3 0 0 0 0 0 -2 3 -3 6 1 0 3 -1 0 0 1 0 0 z M 30 354 l 1 1 2 -3 4 -3 2 -6 0 -8 2 -4 1 1 0 0 0 0 0 0 -1 2 1 1 0 0 1 0 -2 3 0 4 2 4 1 3 -2 2 1 0 -1 2 -2 4 3 3 -1 0 1 0 -1 1 -3 3 6 -1 2 -5 4 3 0 0 0 -1 -1 -3 1 -1 3 -5 6 -3 0 -5 0 -4 0 0 -1 0 -1 1 -2 0 -2 -1 0 0 -2 -2 -4 -3 5 -1 2 -1 -1 0 -1 -2 -6 -2 3 -3 0 -1 3 1 2 -1 6 0 2 1 3 1 2 -4 8 -7 3 3 5 2 3 1 0 1 0 0 6 3 3 2 10 1 6 2 7 -1 2 5 2 7 2 4 1 3 11 3 4 -2 3 -4 6 -2 8 -2 7 -1 4 -1 2 0 1 0 1 -3 8 -2 5 2 5 3 3 3 6 3 4 4 3 3 3 5 2 5 5 2 5 4 1 5 1 5 -7 -1 -5 4 -5 5 -3 4 -1 1 0 0 0 0 0 0 0 0 -2 0 -6 -3 -5 -3 -5 -2 -3 0 -3 4 1 4 1 0 0 0 1 -1 1 4 -1 9 0 5 4 3 2 3 1 -1 0 0 0 0 -1 4 -2 7 0 7 3 9 1 3 6 4 6 1 0 6 -1 7 -2 8 -1 3 -1 2 5 4 1 7 2 3 1 0 1 -1 3 4 1 4 1 -1 3 -4 1 -6 2 -6 3 2 0 0 -1 1 1 2 -1 2 2 1 3 4 7 1 2 -4 5 -3 8 0 6 2 2 6 0 7 0 6 4 9 1 7 -1 4 1 0 0 2 -2 1 1 3 -1 2 -1 0 -3 -4 -8 -2 -2 8 -5 2 -7 -1 -3 -5 -1 -3 0 0 -4 2 -5 -3 -3 -6 -1 -7 -1 -5 -3 -2 -6 2 -5 1 -1 0 -1 0 -3 3 -7 1 -8 2 -2 2 -6 0 -3 -1 -3 -3 -3 -8 -4 -2 -3 -2 -1 1 -2 0 -4 -2 -4 1 -2 2 -7 3 -2 7 0 5 -6 3 -7 4 -8 4 -2 2 -1 0 0 1 -7 -2 -4 1 1 -3 -3 -6 -3 -4 -1 -3 3 -2 -4 -2 -2 -2 0 0 -1 -2 -6 -3 -4 -2 -3 -1 -4 1 0 0 1 2 -2 -1 0 -3 1 -1 0 0 3 -1 3 -9 0 -7 1 -3 0 0 0 -1 1 -1 -1 -3 -5 -6 2 -5 6 -3 5 0 -4 -1 -4 -2 -4 -3 -5 -3 1 -5 1 -2 0 0 2 -1 2 -2 -3 1 -1 0 0 -1 0 0 0 0 1 -1 -2 -3 -1 -6 -1 -9 -2 -6 -1 -6 -7 -4 0 -1 -7 -2 -5 1 -3 3 -4 2 -1 -6 -2 -9 -3 -3 0 -1 0 0 0 0 0 0 0 -2 1 -3 1 -4 -1 0 0 -1 -1 2 -4 3 -5 4 -3 2 -5 0 1 -6 7 0 -1 -6 -4 -4 -2 0 -1 0 -1 0 -1 4 -2 4 -2 1 1 -3 1 -3 0 0 0 0 -1 -2 -1 -4 2 -1 0 -1 0 0 -1 0 1 -1 0 0 1 0 1 -4 2 -7 2 4 2 4 2 3 -1 -5 -1 -4 -1 -1 2 -3 0 -7 3 -4 0 1 0 -1 0 1 2 -1 4 -1 -2 3 -2 2 z " />
        <path id="Jeollabugdo" class="OUTLINE" d =" M 134 519 l 0 -5 2 -7 7 -3 2 -2 4 -1 4 2 2 0 1 -1 3 2 4 2 3 8 3 3 3 1 6 0 2 -2 8 -2 7 -1 3 -3 1 0 1 0 5 -1 6 -2 3 2 1 5 1 7 3 6 5 3 4 -2 0 0 1 3 3 5 7 1 5 -2 2 -8 8 2 3 4 1 0 1 -2 -1 -3 2 -1 0 -2 -1 0 1 -4 5 3 2 1 3 -3 2 3 5 2 6 2 8 -2 9 1 2 4 0 1 0 0 2 4 3 7 -4 7 -3 2 -3 5 -4 3 -3 2 -6 2 -5 2 -3 6 -3 4 -5 3 -2 8 0 5 -3 3 -2 7 -1 8 -2 4 -1 3 -2 8 6 6 2 8 0 5 4 3 -1 5 -3 3 -3 5 -2 3 0 1 0 0 0 0 1 4 -2 3 -4 4 -3 -3 -4 -2 -5 -4 -4 -2 -6 -1 -4 1 -2 4 -4 5 -4 1 -3 -2 -1 0 -3 2 -8 0 -4 -1 -5 -3 -2 2 -2 1 -4 -3 -3 1 -4 3 -5 2 -8 -3 -1 -4 0 -8 -4 -3 0 -2 3 -3 -1 -4 -1 -3 -1 -4 -3 1 -2 -1 -1 4 -1 2 -2 2 -1 0 -1 5 -7 -1 -4 -3 -2 -5 -5 -3 -1 -1 -2 1 -1 -4 -6 2 -5 1 -4 4 0 7 -3 3 0 1 0 2 -3 3 -3 3 -5 3 -4 1 1 2 -4 0 -6 0 -1 1 1 0 -2 2 -7 -1 -2 -5 -1 -4 -2 0 -1 1 -1 -4 -1 -8 -2 -3 -6 -2 4 -9 1 -3 4 -5 4 -3 1 0 0 0 0 0 0 0 2 -1 0 1 1 -1 0 1 1 0 0 1 1 -2 0 1 1 0 -1 0 0 -1 4 -1 3 2 1 1 0 -1 0 -1 2 -4 2 -3 0 0 0 0 0 0 2 0 2 0 4 4 2 5 -1 -5 -2 -5 -8 -2 -9 0 -6 0 -3 1 0 0 -3 -3 -4 -3 -1 -1 1 -2 -1 0 1 -1 -1 -2 1 0 3 -2 6 -5 1 -1 1 0 1 -2 3 -2 -1 -3 -4 -4 -3 -6 -4 -11 -2 0 -3 -1 0 -2 5 -2 6 -11 3 -8 -1 -2 -1 -7 5 1 0 -1 3 0 9 0 7 -2 7 -2 4 2 3 -2 0 -4 8 -4 7 -4 z M 70 573 l 1 6 2 3 3 6 6 7 2 0 3 -3 3 -5 2 -8 1 -4 4 0 7 -1 -1 -8 -1 -4 -3 -5 -7 -1 -2 -6 -1 -6 -5 0 -6 1 -4 12 -2 4 -1 5 z " />
        <path id="Jeonlanamdo" class="OUTLINE" d =" M 118 837 l 1 -4 -1 -7 -2 -4 1 0 0 -1 -1 -3 1 -3 0 -1 0 0 -1 3 -2 8 0 9 -2 8 -3 2 0 0 2 3 -3 4 -3 2 -7 4 -4 0 0 0 0 1 -4 4 -2 6 -2 5 -2 4 -7 2 -3 3 -3 0 0 -1 0 0 0 0 0 0 0 -2 1 -2 0 -1 1 -1 -1 -1 0 -1 0 0 -3 -3 -4 1 0 1 -1 -1 1 -1 0 -1 0 0 -1 -2 1 0 -1 -1 0 0 1 -1 -1 0 3 -3 1 -7 -6 -2 0 -2 2 1 -1 -4 0 -4 0 0 0 0 0 0 -1 -4 -1 -4 0 1 0 -1 -2 1 0 -3 -2 -2 1 -1 -2 -1 -2 -1 -2 3 -3 0 -3 -4 -9 -3 -2 -3 -1 -1 -1 1 -1 -4 -2 -6 -3 -5 0 -1 1 -1 -1 -1 1 -2 2 -5 3 -8 5 1 3 5 2 3 2 2 3 -3 2 -3 0 -1 -2 -4 3 -4 6 -1 3 -1 -6 -1 -7 0 1 -7 5 -4 0 -5 -2 -4 -1 1 2 -5 -1 -6 0 -6 -2 -4 -1 -3 -1 5 0 8 -4 3 -2 0 -3 -3 -2 -5 -1 -2 3 -2 6 -1 0 -3 -2 0 4 -3 4 -3 1 -2 -5 -3 -4 -2 -1 -1 1 0 0 0 1 -2 -4 -1 -2 5 -2 1 0 -1 -1 -1 -1 -1 -2 3 -2 6 -2 0 -1 -2 -1 2 -2 -7 -3 -1 0 1 0 0 0 1 -1 -1 -1 -2 0 0 -1 0 0 0 -2 -1 -3 -1 1 -1 0 0 0 -1 -1 -2 0 -2 5 -1 6 1 4 1 0 0 0 0 2 0 0 -1 -2 -3 1 -3 0 -1 1 1 3 -2 4 1 2 1 3 -3 3 -1 -1 5 -1 4 0 3 2 0 1 -1 0 3 3 4 1 -1 1 -2 0 -1 2 2 1 6 0 4 2 -1 1 1 1 -1 0 0 0 -2 2 -3 2 -6 0 -4 -5 -3 -3 -4 -1 0 -1 -2 -3 -4 -1 -5 2 -4 -4 2 -3 1 1 -2 0 -2 -1 0 1 1 0 1 -2 0 -3 -4 1 -5 1 2 2 -1 0 -1 0 -1 1 0 -2 0 2 -4 -1 0 0 -2 4 -1 4 -2 -1 -3 1 -1 0 -1 0 -1 0 0 0 0 0 0 0 0 1 -2 3 -6 4 1 2 3 0 -3 -4 -4 -1 -4 2 -6 3 -1 6 2 2 3 1 8 1 4 1 -1 2 0 1 4 2 5 7 1 2 -2 -1 0 1 -1 6 0 4 0 -1 -2 4 -1 5 -3 3 -3 3 -3 0 -2 0 -1 3 -3 0 -7 4 -4 5 -1 6 -2 1 4 2 -1 1 1 5 3 2 5 4 3 7 1 1 -5 1 0 2 -2 1 -2 1 -4 2 1 3 -1 1 4 1 3 1 4 -3 3 0 2 4 3 0 8 1 4 8 3 5 -2 4 -3 3 -1 4 3 2 -1 2 -2 5 3 4 1 8 0 3 -2 1 0 3 2 4 -1 4 -5 2 -4 4 -1 6 1 4 2 5 4 4 2 3 3 3 8 2 3 1 4 0 8 4 6 5 3 4 6 0 4 4 4 3 4 4 3 3 5 1 2 0 3 -3 6 -5 3 -1 -2 -3 5 -3 3 0 2 -3 -2 -2 3 -1 1 -4 0 -5 -3 -1 -5 -3 8 5 3 0 1 -2 5 1 3 1 0 0 0 0 0 0 -1 0 0 3 3 9 0 3 -2 0 -1 -1 -1 5 0 3 2 0 0 3 -2 2 7 -2 6 -2 9 1 2 -1 1 -5 2 -3 1 0 0 -3 -3 -4 -2 -1 1 -2 3 0 4 -3 -1 0 5 2 9 0 3 -3 -2 -5 -1 -1 3 -2 -2 -2 -4 0 -2 0 0 0 -3 3 -3 -2 -1 -1 -1 -1 1 1 -4 3 -2 1 -6 -3 -3 -1 0 1 0 0 -1 0 1 0 0 1 -1 0 1 0 -2 -4 -4 -4 -1 0 0 2 -5 -2 -2 0 0 0 -1 0 0 0 -1 -1 -3 0 -4 1 0 -1 0 -4 3 -1 6 -6 1 -1 -3 -1 1 0 -1 -1 1 -4 4 -7 -1 -4 -1 4 2 4 3 0 0 1 0 1 0 1 0 1 1 1 -1 -3 3 -3 3 1 1 -1 0 0 1 1 3 -2 2 0 6 2 3 1 0 0 0 3 3 4 4 1 1 0 0 3 2 2 1 0 1 2 1 -3 0 1 2 1 0 0 0 1 1 1 -1 1 4 -1 7 -6 0 -7 1 -2 3 1 2 4 1 0 0 0 0 -1 1 1 1 -1 1 -2 4 -4 2 0 -1 -2 1 1 3 0 0 -2 1 -3 -1 -1 1 -1 1 0 0 -3 2 -1 5 -3 -1 0 0 0 0 0 -1 0 0 1 1 -1 -2 -3 -3 -2 -3 1 0 -1 -3 -6 -3 -3 -3 -1 1 -1 1 0 -1 -1 1 -3 -1 -3 0 0 1 1 0 -2 0 -2 -1 -1 1 -2 -1 0 1 -1 -1 0 0 0 0 -2 -3 0 -4 0 0 1 -1 1 -1 0 0 2 -2 1 -4 2 2 2 -4 1 -2 -1 -1 1 -1 3 -3 6 -3 2 -6 2 -4 3 -1 2 5 0 4 0 0 1 1 4 0 2 -5 2 -7 -3 -6 -3 1 -3 2 -4 0 -3 -4 -4 3 -2 4 -3 5 -6 1 -4 -2 0 0 0 0 0 -1 -3 4 -3 4 -2 0 1 1 -4 2 -3 4 -1 0 -1 0 -2 2 -8 0 -4 -1 4 2 4 3 -1 1 1 0 0 0 -2 4 3 3 -1 2 0 -1 -1 0 -3 4 -1 7 0 6 -5 2 -2 4 -2 -1 -6 0 -1 4 -4 -2 -3 -2 -1 1 -2 0 -1 -1 -1 1 -2 -4 0 -4 -1 0 z M 61 823 l 3 -2 2 -2 -4 -2 -2 -3 -2 1 0 -2 -1 0 0 0 -1 -3 -2 -3 0 0 -1 0 -1 2 -3 0 -1 -4 1 2 1 0 1 -3 -1 -3 2 0 -1 -2 -2 -1 -4 4 -3 0 1 4 2 5 3 6 5 3 4 2 z M 49 798 l 1 0 2 0 3 4 3 -2 2 -1 0 4 -3 4 0 0 4 3 4 2 0 0 0 0 0 0 4 1 3 1 0 0 0 1 0 0 0 0 1 0 0 -2 -4 -4 -3 -4 4 3 7 2 5 3 5 1 2 1 1 -1 -8 -2 -4 -4 1 -2 1 -2 -1 0 1 0 -3 1 -6 -2 2 -1 -3 -1 -2 -3 -4 -2 2 -3 -1 -1 0 0 0 0 0 0 0 0 -1 0 -2 1 -2 -2 -1 1 -2 0 0 0 0 0 0 0 0 -1 0 0 0 0 -2 0 -4 2 -1 2 0 1 0 0 0 0 z M 122 727 l 4 -1 1 -1 1 0 1 -1 6 -2 7 0 7 -1 3 -4 4 -4 1 -7 -1 -4 -6 -3 -3 -4 -1 -1 1 -1 -2 -3 -4 -3 -4 0 -1 1 0 0 -1 0 0 0 0 0 -1 0 -2 0 -4 2 -7 3 -6 -3 -2 -3 -4 1 0 0 0 0 -1 4 -4 4 -2 -1 -1 0 -2 4 -2 6 -3 3 1 1 4 7 7 0 4 1 4 5 0 4 z M 95 876 l -1 0 -1 -7 0 -5 6 -2 6 2 3 6 1 4 0 0 0 0 2 4 2 6 -4 -1 1 0 -3 0 -7 -1 z M 191 843 l 1 0 0 1 0 0 1 3 -2 6 -2 3 -10 1 -7 -4 0 -6 3 -3 0 0 0 0 0 1 4 2 5 -3 0 0 0 0 1 0 0 0 1 0 2 0 1 0 1 0 z M 27 823 l 5 2 4 3 -1 1 0 0 0 0 0 0 4 2 3 2 0 0 2 2 3 6 1 4 -1 -1 -2 3 0 6 -4 5 -2 2 -1 -2 -2 2 -1 -1 0 0 0 1 0 1 -3 1 -5 2 1 1 -3 1 -3 1 -5 1 -7 1 -5 0 1 -1 -1 0 1 -1 1 -2 -5 -2 -2 -8 3 -4 1 1 1 0 0 0 -1 -3 5 -4 4 -1 0 -1 4 -3 4 -3 0 -1 -1 0 2 -3 z M 281 794 l 2 1 5 3 0 2 -1 0 -1 -1 -1 1 0 -1 0 3 2 5 1 0 1 0 0 4 0 7 1 5 -6 0 -3 -1 -1 0 0 -1 0 0 0 0 -3 -3 0 -7 4 -3 1 -5 -1 -6 -1 -1 0 0 0 0 0 0 0 0 0 -1 z " />
        <path id="Gyeongsangbugdo" class="OUTLINE" d =" M 560 528 l 7 2 5 -4 3 -4 3 -4 1 -1 0 0 3 -4 3 2 2 6 -1 8 -2 3 -1 0 0 0 -1 4 0 4 0 0 -1 0 0 -1 0 1 0 0 -2 2 -2 3 0 2 1 0 0 0 1 4 0 4 -1 -1 -1 1 0 0 1 4 -1 3 0 0 0 0 0 0 0 1 -1 3 0 3 0 0 0 1 -1 -1 -1 4 -1 8 -2 7 -1 6 -2 4 -2 4 -7 -3 -1 0 -7 -2 -4 2 -3 2 -6 1 -4 -7 -3 -3 -4 -3 -5 0 -9 1 -4 1 -4 2 -2 4 0 1 -1 1 0 2 2 3 -3 0 -4 3 -1 -1 -1 0 -3 4 -7 0 -5 -4 -3 0 -3 1 -4 3 -4 5 -5 1 -6 3 -8 0 -7 -2 -8 -1 -7 2 -6 -3 -3 -3 -3 -3 -1 -7 0 -5 1 -6 5 -3 6 0 3 5 3 -1 4 -2 4 -2 0 -8 2 -7 3 -6 1 -2 0 -4 2 1 4 -4 -1 -7 -2 -9 0 -4 -3 -7 -3 -1 -9 0 -5 1 -3 3 -7 4 -2 2 -1 -1 -2 -2 0 7 -3 7 -2 4 -1 0 -3 -3 -2 -7 -5 1 -3 3 -3 4 -2 5 0 5 6 0 8 4 0 5 -8 1 -3 2 -3 5 1 5 5 4 0 5 -6 0 -5 2 1 3 4 4 0 8 -5 -3 -3 -3 -7 -1 -8 1 -3 2 -2 0 -3 -2 -5 -3 2 -3 0 0 1 0 2 -4 -1 -7 -2 -4 -3 -3 -5 -4 -2 -4 -1 -4 -1 0 -1 0 -5 -2 -8 0 -7 -2 -5 -3 -1 0 -3 1 -1 -4 -4 -3 -4 -5 4 -7 -3 -7 -2 -4 0 0 0 -1 -2 -4 4 -2 4 -3 5 -2 3 -6 1 -3 0 -2 0 -1 3 -4 1 -6 0 -8 7 0 4 1 -1 -2 -2 -6 -2 -5 -6 -1 -3 3 -2 0 -1 -1 -1 0 -2 -2 -4 -3 -2 -3 -2 3 -6 0 -1 -6 3 -5 3 -4 0 -3 -1 0 1 -2 -3 -3 1 -3 2 -3 -2 -2 0 -2 1 -4 0 -1 0 0 0 -1 0 0 0 0 0 0 0 -1 0 -2 3 -3 0 -5 -4 -3 -2 -5 -7 -3 -1 -5 6 -2 1 -1 0 0 0 -4 4 -4 0 1 2 4 4 5 2 1 -1 -1 1 -2 1 -4 -1 -5 -4 -3 -4 -1 0 -1 0 0 1 -1 3 -1 6 -2 3 -6 2 1 3 2 4 -2 1 0 3 3 5 0 -1 -2 -3 -4 1 -8 1 -5 3 -1 3 3 1 -2 4 -4 3 -2 1 1 5 2 6 0 2 -6 3 -4 0 0 4 2 4 4 4 3 7 3 7 -1 5 -1 2 -6 -2 -8 3 -7 2 -5 4 -4 4 -2 4 -4 4 -3 3 -5 5 -3 0 -1 3 1 2 -2 4 -1 5 3 4 1 6 1 1 -7 3 -4 2 0 4 2 6 5 7 -1 4 -6 4 -1 3 2 4 0 5 0 1 1 1 -1 3 2 3 0 3 -5 7 1 3 2 5 4 6 3 5 0 -1 0 0 -1 0 -3 0 -3 3 -4 3 -4 5 -2 5 -4 1 -1 1 1 1 -1 1 1 0 0 0 0 0 0 1 0 0 -1 1 2 1 4 2 5 6 7 -1 3 0 1 0 1 -1 2 1 3 0 4 0 1 0 1 -1 1 1 1 0 0 0 1 1 5 0 6 1 5 -1 -1 0 4 4 7 2 3 -1 0 1 1 1 4 3 7 0 9 0 6 -2 5 -1 -2 -1 1 -3 5 -2 6 0 7 4 8 1 5 0 2 0 0 1 2 -1 2 0 1 0 0 0 0 0 0 -1 3 0 7 -2 8 -3 6 -2 3 -1 6 -1 7 0 7 1 8 -1 4 0 -1 1 4 2 3 1 5 1 5 6 3 0 0 0 3 -4 4 -4 3 -1 0 -2 4 6 2 z M 797 205 l 2 1 1 0 -1 3 0 6 1 2 -3 2 -3 3 -6 0 -4 -2 -3 -5 1 -5 6 -2 4 -2 0 0 2 0 z " />
        <path id="Gyeongsangnamdo" class="OUTLINE" d =" M 307 751 l 4 2 0 5 -1 4 0 0 -1 0 -1 4 1 4 1 0 -1 1 3 3 3 4 3 0 -1 -1 0 0 4 -2 7 -1 4 1 0 0 1 1 0 5 0 7 -1 4 -1 4 1 2 0 0 0 0 0 0 1 0 -1 1 0 0 0 0 -1 1 -2 -1 -1 1 -2 -3 -4 1 -6 -3 -2 -8 -6 2 -2 6 -6 -1 -2 -6 1 -4 -1 1 -1 -4 -2 -3 -2 -4 0 -7 2 -3 0 -1 0 0 0 -2 0 0 0 -1 0 -1 3 -1 2 -5 z M 441 731 l 3 1 1 2 -2 3 0 1 0 0 0 1 -1 0 0 4 3 3 1 5 0 4 0 0 -1 2 -2 3 -1 3 2 0 -1 1 2 -1 3 -2 3 -1 -1 1 -2 5 -1 4 -2 -1 -1 1 -1 1 3 2 0 7 -2 -3 -1 0 0 0 0 0 -1 1 -3 -1 -2 3 -3 4 -1 3 4 4 3 0 -1 1 -1 1 0 -1 -1 0 -1 0 -1 0 -4 2 -6 1 -1 -3 0 0 -1 0 -1 0 2 -5 -1 -3 -2 1 -2 0 -1 -3 5 -3 0 -6 0 -4 0 1 -1 -2 -2 1 0 1 0 0 -3 2 -4 2 -1 3 0 0 -1 0 -2 -4 -3 -3 -1 -4 0 -4 1 -1 0 0 3 -3 4 -4 1 0 0 0 0 0 3 3 4 1 0 -1 4 1 4 0 -1 -2 1 -1 -1 0 0 0 0 0 -3 -4 2 -5 5 -1 3 -5 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 -1 -1 1 0 1 1 0 -4 z M 429 693 l -4 1 -3 2 -2 4 1 3 0 0 0 1 2 3 0 3 0 0 0 1 -1 -1 -1 0 -1 1 4 2 3 6 2 2 -2 1 3 2 -2 1 0 0 0 0 -3 1 -4 1 1 -2 1 -1 -4 -1 3 -3 -4 -1 -3 -4 -3 1 -1 2 0 0 -1 0 0 0 -1 0 -1 -1 -2 -1 -1 2 0 0 -1 0 -3 -1 0 5 -3 2 -3 2 -7 4 0 4 2 -3 5 -2 4 -2 0 -1 0 -1 1 -1 1 1 1 0 0 0 1 -1 2 1 0 0 -1 4 1 4 0 0 0 0 1 -1 0 1 0 0 0 1 2 1 -4 3 -2 2 -1 0 0 0 -1 0 0 0 0 0 0 0 0 0 -4 -1 -1 2 4 2 -2 3 -1 5 -1 7 1 6 1 -2 0 0 1 0 1 -1 0 0 0 0 -1 -1 1 0 0 0 0 -2 -1 -1 4 2 1 5 -1 -2 -1 4 -2 4 -4 2 -6 0 0 -4 5 -1 -5 -3 -1 -3 -1 2 0 -1 -1 2 -2 -1 -1 -1 -2 1 -2 -1 -1 1 -1 -1 -1 0 1 0 -1 -3 4 -1 4 -1 0 -1 -3 -5 -1 -4 -1 1 0 -1 -1 0 0 0 -1 2 -2 3 0 3 0 0 0 0 0 0 0 0 0 0 -4 2 -2 -1 0 0 0 -1 -1 -1 1 -1 0 -1 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 -4 0 -6 0 -2 7 -6 1 -4 2 0 1 -3 -4 -3 -2 3 -1 -2 0 -2 0 0 -1 -1 0 1 0 -1 1 0 0 -4 -1 -5 -4 -1 -3 0 1 2 -2 1 -2 -1 -2 0 -4 1 -2 0 0 0 0 -2 -2 0 -5 1 -4 2 -3 -3 2 -2 5 -1 4 0 0 0 0 0 0 0 0 -2 0 0 0 1 -3 -2 0 1 0 -3 1 2 2 2 4 0 3 -1 0 0 1 -1 1 1 0 0 0 0 -1 -1 0 -1 -1 -2 2 -3 -2 0 0 -1 0 0 0 0 1 0 0 -3 1 -1 -2 0 0 0 -2 -4 -3 1 3 -1 2 1 0 0 0 -1 1 1 0 0 1 0 0 0 0 0 0 0 0 0 1 -2 1 -4 5 -5 0 -2 -2 0 0 0 0 -1 1 -5 2 -4 1 0 0 -1 -1 -2 -5 3 -6 0 -3 -1 -2 -3 -5 -4 -3 -3 -4 -4 -4 0 -4 -4 -6 -5 -3 -4 -6 0 -8 -1 -4 -2 -3 -3 -8 4 -4 2 -3 -1 -4 0 0 0 0 0 -1 2 -3 3 -5 3 -3 1 -5 -4 -3 0 -5 -2 -8 -6 -6 2 -8 1 -3 2 -4 1 -8 2 -7 3 -3 0 -5 2 -8 5 -3 3 -4 3 -6 5 -2 6 -2 3 -2 4 -3 3 -5 3 -2 4 5 4 3 1 4 3 -1 1 0 5 3 7 2 8 0 5 2 1 0 1 0 1 4 2 4 5 4 3 3 2 4 1 7 -2 4 -1 0 0 0 -2 3 5 3 3 2 2 0 3 -2 8 -1 7 1 3 3 5 3 7 -1 7 -3 5 0 2 -3 3 -7 0 5 1 7 3 3 3 3 6 3 7 -2 8 1 7 2 8 0 6 -3 5 -1 4 -5 4 -3 3 -1 3 0 5 4 7 0 0 8 -5 5 4 4 3 2 2 0 0 0 1 0 3 -1 1 3 5 3 4 3 2 3 4 5 6 2 4 1 1 7 -2 3 0 0 0 3 -3 2 -7 0 -3 6 -1 5 -4 1 -6 3 -1 3 -3 -1 -2 0 -1 4 -4 6 -7 1 -6 2 -5 1 -1 6 0 5 -9 0 -4 1 2 2 5 4 1 3 -2 2 -3 2 -4 1 2 -2 0 -1 -4 -1 -2 6 -3 -2 -1 -3 -3 1 -2 -1 -2 0 -1 1 0 -3 -2 -6 -2 3 -1 1 0 -1 -1 -1 0 -1 -1 1 -3 -3 -3 2 1 0 -1 0 1 1 -1 0 -2 -5 -2 -6 4 -6 z " />
        <path id="Jeju" class="OUTLINE" d =" M 115 920 l 5 2 3 2 5 3 6 2 3 5 -1 4 0 0 1 0 0 0 1 1 2 1 -2 1 3 0 -1 7 -2 1 -3 7 -4 4 -3 5 -3 5 -5 4 -5 0 -3 1 0 0 0 0 0 0 -1 1 -2 1 0 1 -3 1 -8 2 -4 0 0 0 -2 0 -3 2 -6 3 -7 0 -8 1 -7 1 -7 -1 -8 0 -7 0 -6 1 -3 5 -6 -1 -3 -4 -4 -3 -5 -2 -2 -4 -2 -8 2 -7 3 -4 1 0 1 0 3 -3 4 -3 3 -5 3 -4 4 -2 6 -4 4 -2 5 -1 6 -1 7 -3 4 -2 4 -1 5 -1 -1 1 4 -1 7 -1 6 -2 3 -3 1 1 0 0 1 0 0 1 0 0 1 0 2 -1 2 0 1 0 0 0 1 0 6 -1 z " />
        </g>
        <g filter="url(#dropshadow)">
        <text id="LSeoul" class="TEXT" x="156" y="214">서울특별시</text>
        <text id="LBusan" class="TEXT" x="503" y="695">부산광역시</text>
        <text id="LDaegu" class="TEXT" x="418" y="567">대구광역시</text>
        <text id="LIncheon" class="TEXT" x="67" y="177">인천광역시</text>
        <text id="LGwangju" class="TEXT" x="127" y="707">광주광역시</text>
        <text id="LDaejeon" class="TEXT" x="221" y="463">대전광역시</text>
        <text id="LUlsan" class="TEXT" x="531" y="622">울산광역시</text>
        <text id="LSejong" class="TEXT" x="199" y="418">세종특별자치시</text>
        <text id="LGyeonggi" class="TEXT" x="216" y="245">경기도</text>
        <text id="LGangwon" class="TEXT" x="370" y="179">강원도</text>
        <text id="LChungcheongbugdo" class="TEXT" x="294" y="381">충청북도</text>
        <text id="LChungcheongnamdo" class="TEXT" x="105" y="449">충청남도</text>
        <text id="LJeollabugdo" class="TEXT" x="179" y="592">전라북도</text>
        <text id="LJeonlanamdo" class="TEXT" x="138" y="764">전라남도</text>
        <text id="LGyeongsangbugdo" class="TEXT" x="447" y="460">경상북도</text>
        <text id="LGyeongsangnamdo" class="TEXT" x="367" y="672">경상남도</text>
        <text id="LJeju" class="TEXT" x="76" y="960">제주특별자치도</text>
        </g>
    </svg>
    <div class = "Seoul policyP" name = "서울특별시">
        <div class = "gangnamgu policyC" name = "강남구">강남구</div>
        <div class = "gangdonggu policyC" name = "강동구">강동구</div>
        <div class = "gangbukgu policyC" name = "강북구">강북구</div>
        <div class = "gangseogu policyC" name = "강서구">강서구</div>
        <div class = "gwanakgu policyC" name = "관악구">관악구</div>
        <div class = "gwangjingu policyC" name = "광진구">광진구</div>
    
        <div class = "gurogu policyC" name = "구로구">구로구</div>
        <div class = "geumchungu policyC" name = "금천구">금천구</div>
        <div class = "nowongu policyC" name = "노원구">노원구</div>
        <div class = "dobonggu policyC" name = "도봉구">도봉구</div>
        <div class = "dongdaemoongu policyC" name = "동대문구">동대문구</div>
        <div class = "dongjakgu policyC" name = "동작구">동작구</div>
    
        <div class = "mapogu policyC" name = "마포구">마포구</div>
        <div class = "seodaemoongu policyC" name = "서대문구">서대문구</div>
        <div class = "seochogu policyC" name = "서초구">서초구</div>
        <div class = "seongdonggu policyC" name = "성동구">성동구</div>
        <div class = "seongbukgu policyC" name = "성북구">성북구</div>
        <div class = "songpagu policyC" name = "송파구">송파구</div>
    
        <div class = "yangcheongu policyC" name = "양천구">양천구</div>
        <div class = "yeongdengpogu policyC" name = "영등포구">영등포구</div>
        <div class = "yongsangu policyC" name = "용산구">용산구</div>
        <div class = "enpyonggu policyC" name = "은평구">은평구</div>
        <div class = "jongrogu policyC" name = "종로구">종로구</div>
        <div class = "joonggu policyC" name = "중구">중구</div>
    
        <div class = "joongranggu policyC" name = "중랑구">중랑구</div>
      </div>
    
      <div class = "Busan policyP" name = "부산광역시">
        <div class = "joonggu policyC" name = "중구">중구</div>
        <div class = "seogu policyC" name = "서구">서구</div>
        <div class = "donggu policyC" name = "동구">동구</div>
        <div class = "youngdogu policyC" name = "영도구">영도구</div>
        <div class = "busanjingu policyC" name = "부산진구">부산진구</div>
        <div class = "dongraegu policyC" name = "동래구">동래구</div>
    
        <div class = "namgu policyC" name = "남구">남구</div>
        <div class = "bukgu policyC" name = "북구">북구</div>
        <div class = "haeundaegu policyC" name = "해운대구">해운대구</div>
        <div class = "sahagu policyC" name = "사하구">사하구</div>
        <div class = "geumjeonggu policyC" name = "금정구">금정구</div>
        <div class = "gangseogu policyC" name = "강서구">강서구</div>
    
        <div class = "yeonjaegu policyC" name = "연제구">연제구</div>
        <div class = "sooyounggu policyC" name = "수영구">수영구</div>
        <div class = "sasanggu policyC" name = "사상구">사상구</div>
        <div class = "gijanggun policyC" name = "기장군">기장군</div>
      </div>
    
      <div class = "Daegu policyP" name = "대구광역시">
        <div class = "joonggu policyC" name = "중구">중구</div>
        <div class = "donggu policyC" name = "동구">동구</div>
        <div class = "seogu policyC" name = "서구">서구</div>
        <div class = "namgu policyC" name = "남구">남구</div>
        <div class = "bukgu policyC" name = "북구">북구</div>
        <div class = "sooseonggu policyC" name = "수성구">수성구</div>
    
        <div class = "dalseogu policyC" name = "달서구">달서구</div>
        <div class = "dalseolgun policyC" name = "달성군">달성군</div>
      </div>
    
      <div class = "Incheon policyP" name = "인천광역시">
        <div class = "joonggu policyC" name = "중구">중구</div>
        <div class = "donggu policyC" name = "동구">동구</div>
        <div class = "michuholgu policyC" name = "미추홀구">미추홀구</div>
        <div class = "yeonsugu policyC" name = "연수구">연수구</div>
        <div class = "namdonggu policyC" name = "남동구">남동구</div>
        <div class = "bupyounggu policyC" name = "부평구">부평구</div>
    
        <div class = "gyeyanggu policyC" name = "계양구">계양구</div>
        <div class = "seogu policyC" name = "서구">서구</div>
        <div class = "ganghwagun policyC" name = "강화군">강화군</div>
        <div class = "ongjingun policyC" name = "옹진군">옹진군</div>
      </div>
    
      <div class = "Gwangju policyP" name = "광주광역시">
        <div class = "donggu policyC" name = "동구">동구</div>
        <div class = "seogu policyC" name = "서구">서구</div>
        <div class = "namgu policyC" name = "남구">남구</div>
        <div class = "bukgu policyC" name = "북구">북구</div>
        <div class = "gwangsangu policyC" name = "광산구">광산구</div>
      </div>
    
      <div class = "Daejeon policyP" name = "대전광역시">
        <div class = "donggu policyC" name = "동구">동구</div>
        <div class = "joonggu policyC" name = "중구">중구</div>
        <div class = "seogu policyC" name = "서구">서구</div>
        <div class = "yooseonggu policyC" name = "유성구">유성구</div>
        <div class = "daedeokgu policyC" name = "대덕구">대덕구</div>
      </div>
    
      <div class = "Ulsan policyP" name = "울산광역시">
        <div class = "joonggu policyC" name = "중구">중구</div>
        <div class = "namgu policyC" name = "남구">남구</div>
        <div class = "donggu policyC" name = "동구">동구</div>
        <div class = "bukgu policyC" name = "북구">북구</div>
        <div class = "uljugun policyC" name = "울주군">울주군</div>
      </div>
    
      <div class = "Sejong policyP" name = "세종특별자치시">
        <div class = "sejongsi policyC" name = "세종특별자치시">세종특별자치시</div>
      </div>
    
      <div class = "Gyeonggi policyP" name = "경기도">
        <div class = "goyangsi policyC" name = "고양시">고양시</div>
        <div class = "gwacheonsi policyC" name = "과천시">과천시</div>
        <div class = "gwangmyeongsi policyC" name = "광명시">광명시</div>
        <div class = "gwangjusi policyC" name = "광주시">광주시</div>
        <div class = "gulisi policyC" name = "구리시">구리시</div>
        <div class = "gunposi policyC" name = "군포시">군포시</div>
    
        <div class = "gimposi policyC" name = "김포시">김포시</div>
        <div class = "namyangjusi policyC" name = "남양주시">남양주시</div>
        <div class = "dongducheonsi policyC" name = "동두천시">동두천시</div>
        <div class = "bucheonsi policyC" name = "부천시">부천시</div>
        <div class = "seongnamsi policyC" name = "성남시">성남시</div>
        <div class = "suwonsi policyC" name = "수원시">수원시</div>
    
        <div class = "siheungsi policyC" name = "시흥시">시흥시</div>
        <div class = "ansansi policyC" name = "안산시">안산시</div>
        <div class = "anseongsi policyC" name = "안성시">안성시</div>
        <div class = "anyangsi policyC" name = "안양시">안양시</div>
        <div class = "yangjusi policyC" name = "양주시">양주시</div>
        <div class = "yeojusi policyC" name = "여주시">여주시</div>
    
        <div class = "osansi policyC" name = "오산시">오산시</div>
        <div class = "yonginsi policyC" name = "용인시">용인시</div>
        <div class = "uiwangsi policyC" name = "의왕시">의왕시</div>
        <div class = "uijeongbusi policyC" name = "의정부시">의정부시</div>
        <div class = "icheonsi policyC" name = "이천시">이천시</div>
        <div class = "pajusi policyC" name = "파주시">파주시</div>
    
        <div class = "pyeongtaegsi policyC" name = "평택시">평택시</div>
        <div class = "pocheonsi policyC" name = "포천시">포천시</div>
        <div class = "hanamsi policyC" name = "하남시">하남시</div>
        <div class = "hwaseongsi policyC" name = "화성시">화성시</div>
        <div class = "gapyeonggun policyC" name = "가평군">가평군</div>
        <div class = "yangpyeonggun policyC" name = "양평군">양평군</div>
    
        <div class = "yeoncheongun policyC" name = "연천군">연천군</div>
      </div>
    
      <div class = "Gangwon policyP" name = "강원도">
        <div class = "gangleungsi policyC" name = "강릉시">강릉시</div>
        <div class = "donghaesi policyC" name = "동해시">동해시</div>
        <div class = "samcheogsi policyC" name = "삼척시">삼척시</div>
        <div class = "sogchosi policyC" name = "속초시">속초시</div>
        <div class = "wonjusi policyC" name = "원주시">원주시</div>
        <div class = "chuncheonsi policyC" name = "춘천시">춘천시</div>
    
        <div class = "taebaegsi policyC" name = "태백시">태백시</div>
        <div class = "goseonggun policyC" name = "고성군">고성군</div>
        <div class = "yanggugun policyC" name = "양구군">양구군</div>
        <div class = "yangyanggun policyC" name = "양양군">양양군</div>
        <div class = "yeongwolgun policyC" name = "영월군">영월군</div>
        <div class = "injegun policyC" name = "인제군">인제군</div>
    
        <div class = "jeongseongun policyC" name = "정선군">정선군</div>
        <div class = "cheolwongun policyC" name = "철원군">철원군</div>
        <div class = "pyeongchanggun policyC" name = "평창군">평창군</div>
        <div class = "hongcheongun policyC" name = "홍천군">홍천군</div>
        <div class = "hwacheongun policyC" name = "화천군">화천군</div>
        <div class = "hoengseonggun policyC" name = "횡성군">횡성군</div>
      </div>
    
      <div class = "Chungcheongbugdo policyP" name = "충청북도">
        <div class = "jecheonsi policyC" name = "제천시">제천시</div>
        <div class = "cheongjusi policyC" name = "청주시">청주시</div>
        <div class = "chungjusi policyC" name = "충주시">충주시</div>
        <div class = "goesangun policyC" name = "괴산군">괴산군</div>
        <div class = "danyanggun policyC" name = "단양군">단양군</div>
        <div class = "boeungun policyC" name = "보은군">보은군</div>
    
        <div class = "yeongdonggun policyC" name = "영동군">영동군</div>
        <div class = "ogcheongun policyC" name = "옥천군">옥천군</div>
        <div class = "eumseonggun policyC" name = "음성군">음성군</div>
        <div class = "jeungpyeonggun policyC" name = "증평군">증평군</div>
        <div class = "jincheongun policyC" name = "진천군">진천군</div>
      </div>
    
      <div class = "Chungcheongnamdo policyP" name = "충청남도">
        <div class = "gyelyongsi policyC" name = "계룡시">계룡시</div>
        <div class = "gongjusi policyC" name = "공주시">공주시</div>
        <div class = "nonsansi policyC" name = "논산시">논산시</div>
        <div class = "dangjinsi policyC" name = "당진시">당진시</div>
        <div class = "bolyeongsi policyC" name = "보령시">보령시</div>
        <div class = "seosansi policyC" name = "서산시">서산시</div>
        
        <div class = "asansi policyC" name = "아산시">아산시</div>
        <div class = "cheonansi policyC" name = "천안시">천안시</div>
        <div class = "geumsangun policyC" name = "금산군">금산군</div>
        <div class = "buyeogun policyC" name = "부여군">부여군</div>
        <div class = "seocheongun policyC" name = "서천군">서천군</div>
        <div class = "yesangun policyC" name = "예산군">예산군</div>
    
        <div class = "cheongyanggun policyC" name = "청양군">청양군</div>
        <div class = "taeangun policyC" name = "태안군">태안군</div>
        <div class = "hongseonggun policyC" name = "홍성군">홍성군</div>
      </div>
    
      <div class = "Jeollabugdo policyP" name = "전라북도">
        <div class = "gunsansi policyC" name = "군산시">군산시</div>
        <div class = "gimjesi policyC" name = "김제시">김제시</div>
        <div class = "nam-wonsi policyC" name = "남원시">남원시</div>
        <div class = "igsansi policyC" name = "익산시">익산시</div>
        <div class = "jeonjusi policyC" name = "전주시">전주시</div>
        <div class = "jeongeubsi policyC" name = "정읍시">정읍시</div>
    
        <div class = "gochanggun policyC" name = "고창군">고창군</div>
        <div class = "mujugun policyC" name = "무주군">무주군</div>
        <div class = "buangun policyC" name = "부안군">부안군</div>
        <div class = "sunchanggun policyC" name = "순창군">순창군</div>
        <div class = "wanjugun policyC" name = "완주군">완주군</div>
        <div class = "imsilgun policyC" name = "임실군">임실군</div>
    
        <div class = "jangsugun policyC" name = "장수군">장수군</div>
        <div class = "jinangun policyC" name = "진안군">진안군</div>
      </div>
    
      <div class = "Jeonlanamdo policyP" name = "전라남도">
        <div class = "gwangyangsi policyC" name = "광양시">광양시</div>
        <div class = "najusi policyC" name = "나주시">나주시</div>
        <div class = "mogposi policyC" name = "목포시">목포시</div>
        <div class = "suncheonsi policyC" name = "순천시">순천시</div>
        <div class = "yeosusi policyC" name = "여수시">여수시</div>
        <div class = "hampyeonggun policyC" name = "함평군">함평군</div>
    
        <div class = "gangjingun policyC" name = "강진군">강진군</div>
        <div class = "goheunggun policyC" name = "고흥군">고흥군</div>
        <div class = "gogseonggun policyC" name = "곡성군">곡성군</div>
        <div class = "gulyegun policyC" name = "구례군">구례군</div>
        <div class = "haenamgun policyC" name = "해남군">해남군</div>
        <div class = "damyanggun policyC" name = "담양군">담양군</div>
    
        <div class = "muangun policyC" name = "무안군">무안군</div>
        <div class = "boseonggun policyC" name = "보성군">보성군</div>
        <div class = "sinangun policyC" name = "신안군">신안군</div>
        <div class = "yeonggwanggun policyC" name = "영광군">영광군</div>
        <div class = "yeongamgun policyC" name = "영암군">영암군</div>
        <div class = "wandogun policyC" name = "완도군">완도군</div>
    
        <div class = "jangseonggun policyC" name = "장성군">장성군</div>
        <div class = "jangheunggun policyC" name = "장흥군">장흥군</div>
        <div class = "jindogun policyC" name = "진도군">진도군</div>
        <div class = "hwasungun policyC" name = "화순군">화순군</div>
      </div>
    
      <div class = "Gyeongsangbugdo policyP" name = "경상북도">
        <div class = "gyeongsansi policyC" name = "경산시">경산시</div>
        <div class = "gyeongjusi policyC" name = "경주시">경주시</div>
        <div class = "golyeonggun policyC" name = "고령군">고령군</div>
        <div class = "gumisi policyC" name = "구미시">구미시</div>
        <div class = "gunwigun policyC" name = "군위군">군위군</div>
        <div class = "gimcheonsi policyC" name = "김천시">김천시</div>
    
        <div class = "mungyeongsi policyC" name = "문경시">문경시</div>
        <div class = "bonghwagun policyC" name = "봉화군">봉화군</div>
        <div class = "sangjusi policyC" name = "상주시">상주시</div>
        <div class = "seongjugun policyC" name = "성주군">성주군</div>
        <div class = "andongsi policyC" name = "안동시">안동시</div>
        <div class = "yeongdeoggun policyC" name = "영덕군">영덕군</div>
    
        <div class = "yeongyanggun policyC" name = "영양군">영양군</div>
        <div class = "yeongjusi policyC" name = "영주시">영주시</div>
        <div class = "yeongcheonsi policyC" name = "영천시">영천시</div>
        <div class = "yecheongun policyC" name = "예천군">예천군</div>
        <div class = "ulleunggun policyC" name = "울릉군">울릉군</div>
        <div class = "uljingun policyC" name = "울진군">울진군</div>
    
        <div class = "uiseonggun policyC" name = "의성군">의성군</div>
        <div class = "cheongdogun policyC" name = "청도군">청도군</div>
        <div class = "cheongsonggun policyC" name = "청송군">청송군</div>
        <div class = "chilgoggun policyC" name = "칠곡군">칠곡군</div>
        <div class = "pohangsi policyC" name = "포항시">포항시</div>
      </div>
    
      <div class = "Gyeongsangnamdo policyP" name = "경상남도">
        <div class = "geojesi policyC" name = "거제시">거제시</div>
        <div class = "gimhaesi policyC" name = "김해시">김해시</div>
        <div class = "milyangsi policyC" name = "밀양시">밀양시</div>
        <div class = "sacheonsi policyC" name = "사천시">사천시</div>
        <div class = "yangsansi policyC" name = "양산시">양산시</div>
        <div class = "jinjusi policyC" name = "진주시">진주시</div>
        
        <div class = "changwonsi policyC" name = "창원시">창원시</div>
        <div class = "tongyeongsi policyC" name = "통영시">통영시</div>
        <div class = "geochanggun policyC" name = "거창군">거창군</div>
        <div class = "goseonggun policyC" name = "고성군">고성군</div>
        <div class = "namhaegun policyC" name = "남해군">남해군</div>
        <div class = "sancheonggun policyC" name = "산청군">산청군</div>
    
        <div class = "uilyeonggun policyC" name = "의령군">의령군</div>
        <div class = "changnyeonggun policyC" name = "창녕군">창녕군</div>
        <div class = "hadonggun policyC" name = "하동군">하동군</div>
        <div class = "hamangun policyC" name = "함안군">함안군</div>
        <div class = "hamyanggun policyC" name = "함양군">함양군</div>
        <div class = "habcheongun policyC" name = "합천군">합천군</div>
      </div>
    
      <div class = "Jeju policyP" name = "제주특별자치도">
        <div class = "seogwiposi policyC" name = "서귀포시">서귀포시</div>
        <div class = "jejusi policyC" name = "제주시">제주시</div>
      </div>
	</div>
	<div id="register">
		<div id="registerForm">
			<i>회원가입</i>
			<form action="./userJoinAction.jsp" method="post">
				<input type="text" placeholder="ID" class="form-control"
					name="userID"> <input type="password"
					placeholder="Password" class="form-control" name="userPW">
				<input type="text" placeholder="Nickname" class="form-control"
					name="userNICK"> <input type="email" placeholder="Email"
					class="form-control" name="userEMAIL"> <input type="submit"
					class="btn btn-primary" value="가입"> <input
					id="unRegisterBtn" type="button"
					onClick="$('#register').fadeOut();" class="btn btn-primary"
					value="취소">
			</form>

		</div>
	</div>
	<div id="login">
		<div id="loginForm">
			<i>로그인</i>
			<form action="./userLogin.jsp" method="post">
				<input type="text" placeholder="ID" class="form-control"
					name="userID"> <input type="password"
					placeholder="Password" class="form-control" name="userPW">
				<input type="submit" class="btn btn-primary" value="로그인"> <input
					id="unRegisterBtn" onClick="$('#login').fadeOut();" type="button"
					class="btn btn-primary" value="취소">
			</form>
		</div>
	</div>
	<div id="mypage">
		<jsp:include page="mypage.jsp" />
	</div>




</body>
</html>


