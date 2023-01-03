<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>    
<%
//session 삭제 후 다시 로그인 폼으로 이동
session.invalidate();
response.sendRedirect("loginForm.jsp");

%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My JSP Files</title>
</head>
<body>
<h3>logoutproc.jsp</h3>
</body>
</html>