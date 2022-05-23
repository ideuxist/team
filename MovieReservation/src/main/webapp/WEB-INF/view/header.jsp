<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		
		<style>
		.material-symbols-outlined {
			font-variation-settings:
			Fill: 0,
			Weight: 300G,
			rade: 200,
			Optical size: 40
		}
		.material-symbols-outlined {
			margin-top: 4px;
		}

		.header{
		    background-color: black;
			height : 50px;
			text-align:center;
			border-bottom: 1px solid rgba(255,255,255,.2);
			opacity : 0.9;
			font-size: large;
			font-family: 'Noto Sans KR', sans-serif;
			height: 70px;
		}
		.header li{
			margin: 0 50px;
			list-style-type:none;
			display: inline-block;
		}
		.header li a{
			color : white;
		}
	</style>
</head>
<body>

	<%  
		String id = (String)session.getAttribute("id");
	%>
	<%if(id == null){ %>
	<ul class = "header">
		<li><a href =""><span class="material-symbols-outlined">search</span></a></li>
		<li><a href ="${pageContext.request.contextPath}/reservation/reservation.tiles">예매하기</a></li>
		<li><a href ="">상영관</a></li>
<<<<<<< HEAD
		<li><a href ="${pageContext.servletContext.contextPath}/member.view/mypage.tiles" id = "mypage">마이페이지</a></li>
		<li><a href ="${pageContext.request.contextPath }/boardController.boa">게시판</a></li>
=======
		<li><a href ="${pageContext.request.contextPath }/boardController.boa">게시판</a></li>
>>>>>>> branch 'master' of https://github.com/ideuxist/team
	</ul>
	<%}else if(id !=null){ %>
			<ul  class = "header">
				<li><a href ="">영화검색</a></li>
				<li><a href ="${pageContext.request.contextPath}/reservation/reservation.tiles">예매하기</a></li>
				<li><a href ="">상영관</a></li>
				<li><a href ="${pageContext.servletContext.contextPath}/member.view/mypage.tiles" id = "mypage">마이페이지</a></li>
				<li><a href ="${pageContext.request.contextPath }/boardController.boa">게시판</a></li>
			</ul>
	<%}%>
</body>
</html>