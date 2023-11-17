<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<title>GOALTALK</title>
</head>
<body>
	<%
		session.invalidate(); //세션을 빼았아서 로그아웃
		
	%>
	
<script>
	location.href = 'main.jsp';
</script>
</body>
</html>