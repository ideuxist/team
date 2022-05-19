<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		ul{
			height : 200px;
			text-align:center;
		}
		ul li{
			margin:0 50px 0 50px;
			list-style-type:none;
			display: inline-block;
		}
		ul li a{
			color : white;
		}
	</style>
</head>
<body>
	<ul>
		<li><a href ="">영화검색</a></li>
		<li><a href ="${pageContext.request.contextPath}/reservation/reservation.tiles">예매하기</a></li>
		<li><a href ="">상영관</a></li>
		<li><a href ="${pageContext.servletContext.contextPath}/member.view/mypage.jsp" id = "mypage">마이페이지</a></li>
	</ul>
</body>
</html>