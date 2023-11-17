<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="goaltalk.GoaltalkDAO" %>
<%@ page import="goaltalk.Goaltalk" %>
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
	String userID = null;
	
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
	
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} 
	
	
	int talkID = 0;
	if(request.getParameter("talkID") != null) {
		talkID = Integer.parseInt(request.getParameter("talkID"));
	}
	
	if(talkID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='goaltalk.jsp'");
		script.println("</script>");
	}
	
	Goaltalk goaltalk = new GoaltalkDAO().getGoaltalk(talkID);
	if(!userID.equals(goaltalk.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='goaltalk.jsp'");
		script.println("</script>");
	}	else {
		
				GoaltalkDAO goaltalkDAO = new GoaltalkDAO();
				int result = goaltalkDAO.delete(talkID);
			
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				
				else { 

					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'goaltalk.jsp'");
					script.println("</script>");
				}
			}
				
	
	
	
		
	
	
		
		
		
	%>
	
</body>
</html>