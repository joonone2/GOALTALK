<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="goaltalk.GoaltalkDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="goaltalk" class="goaltalk.Goaltalk" scope="page" />
<jsp:setProperty name="goaltalk" property="talkTitle" />
<jsp:setProperty name="goaltalk" property="talkContent"/>

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
	} else {
		if(goaltalk.getTalkTitle() == null || goaltalk.getTalkContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 정보가 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}  
			
			else {
				GoaltalkDAO goaltalkDAO = new GoaltalkDAO();
				int result = goaltalkDAO.write(goaltalk.getTalkTitle(), userID, goaltalk.getTalkContent());
			
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
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
				
	}
	
	
		
	
	
		
		
		
	%>
	
</body>
</html>