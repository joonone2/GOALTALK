<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>GOALTALK</title>
<style>
	.image-container img {
            max-width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞추기 */
            height: auto;
            /* 그 외 이미지 스타일 */
        }
        
        .image-container {
        position: relative;
        width: 100%;
        text-align: left;
    }

    .image-text {
        position: absolute;
        top: 75%;
        left: 15%;
        transform: translate(-50%, -50%);
        color: white; /* 텍스트 색상 설정 */
        text-align: left;
    }

    /* 텍스트 스타일링 */
    .image-text h2 {
        font-size: 50px;
        /* 다른 스타일 옵션들 */
    }

    .image-text p {
        font-size: 30px;
        /* 다른 스타일 옵션들 */
    }
</style>
</head>

<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
	%>

	
	<nav class="navbar navbar-default" style="margin-bottom:0px;">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">GOALTALK</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="goaltalk.jsp">게시판</a></li>
			</ul>
			
			<%
				if(userID == null) {
					
				
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			
			<%
				
				} else {
			%>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			
			<% 
				}
			%>
			
			
			
		</div>
	</nav>
	
	<div class="image-container">
        <img src="media/main.jpg" alt="Your Image">
        <div class="image-text">
        <h2>GOALTALK</h2>
        <p>GOALTALK에서 축구팬들과 이야기를해보세요.</p>
    </div>
    </div>
	
	
	 
	 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	 <script src="js/bootstrap.js"></script>
</body>
</html>