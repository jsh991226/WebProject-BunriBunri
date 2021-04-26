<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
	if (session.getAttribute("loginCheck") == "true") {
		response.sendRedirect("main.jsp");
	} else {
		response.sendRedirect("plzReg.jsp");
	}


%>

