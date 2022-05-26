<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		
		
		<style>
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

		#search_box{
			height:24px;
			width: 180px;
			border-top-left-radius: 5px;
			border-top-right-radius: 5px;
			border-bottom-left-radius: 5px;
			border-bottom-right-radius: 5px;
		}
		#search_box{
			height: 26px;
			margin-left : 20px;
		}
	</style>
</head>
<body>

	<%  
		String id = (String)session.getAttribute("id");
	%>
	<%if(id == null){ %>
	<ul class = "header">
		<li>
			<form action = "${pageContext.request.contextPath}/movieSearch/movieSearch.tiles" id = "form_search">
				<input type = "search" placeholder = "영화를 검색하세요" name = "keyword" id = "search_box">
			</form>
		</li>
		<li><a href ="${pageContext.request.contextPath}/reservation/reservation.tiles">예매하기</a></li>

		<li><a href ="${pageContext.request.contextPath }/boardController.boa">게시판</a></li>
	</ul>
	<%}else if(id !=null){ %>
			<ul  class = "header">
				<li>
					<form action = "${pageContext.request.contextPath}/movieSearch/movieSearch.tiles" id = "form_search">
						<input type = "search" placeholder = "영화를 검색하세요" name = "keyword" id = "search_box">
					</form>
				</li>
				<li><a href ="${pageContext.request.contextPath}/reservation/reservation.tiles">예매하기</a></li>

				<li><a href ="${pageContext.servletContext.contextPath}/member.view/mypage.tiles" id = "mypage">마이페이지</a></li>
				<li><a href ="${pageContext.request.contextPath }/boardController.boa">게시판</a></li>
			</ul>
	<%}%>

	
</body>
</html>