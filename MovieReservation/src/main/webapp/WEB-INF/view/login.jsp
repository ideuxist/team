<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>login, logout</title>
	<style>
		#login{
			text-align: right;
		}
	</style>
</head>
<body>
<script type="text/javascript">
function openFindId() {
	window.name = "parentFrom";
	window.open("member.view/findIdForm.jsp",
	"findIdForm", "width=500, height=300, resizable = no, scrollbars = no");
	
}

function openFindPw() {
	window.name = "parentFrom";
	window.open("member.view/findPwForm.jsp",
	"findPwForm", "width=500, height=300, resizable = no, scrollbars = no");
	
}
</script>
	<div id = "login">
	
	<%
		String id = (String)session.getAttribute("id");
	%>
	
	
	<%if(id == null){%>
	<form action ="${pageContext.servletContext.contextPath}/memberSearch.do" method = "post">
		아이디 : <input type = "text" name = "id">
		비밀번호 : <input type = "password" name = "passwd">
	<input type ="submit" value ="로그인" >
	<input type ="hidden" value = "search" name = "job">
	<a href='javascript:void(0);' onclick="openFindId();">아이디 찾기</a>
  <a href='javascript:void(0);' onclick="openFindPw();">비밀번호 찾기</a>
	</form>
	<form action = "${pageContext.servletContext.contextPath}/member.view/join.tiles" method = "post">
		<input type = "submit" value = "회원가입">
	</form>
	
	<%}else if(id.equals("admin")){%>
		<form action = "${pageContext.servletContext.contextPath}/member.view/logout.jsp" method = "post">
			<p>${id}님, 반갑습니다!</p>
			<input type = "submit" name = "logout" value = "로그아웃">
			<input type = "hidden" name = "account" value = "logout"> 
		</form>
	
		<form action = "${pageContext.servletContext.contextPath}/autoInputDB.do" method = "post" id = "form">
			<input type = "submit" name = "autoDB" value = "영화 DB 등록">
			<script type="text/javascript">
		// key, postrt_url
		key = "90ad618fa3d2f888905f0b844cbb97df";
		let posterBase_url = "https://image.tmdb.org/t/p/w500";
		let popularityURL = "https://api.themoviedb.org/3/movie/popular?api_key="+key+"&language=kr-KR&page=1";
	
		let id = [];
		fetch(popularityURL)
			.then(response => response.json())
			.then((res) => {
				console.log(res);
				// 데이터 위치 : res.results[n]....
				// 제목 : original_title
				// 인기도 : popularity
				// 포스터 : poster_path
				// 개봉일 : release_date
				// 점수 : vote_average
				// id : id
				// backdrop_path : backdrop_path

				let form = document.getElementById('form');
				
	
				// 메인 화면 포스터 생성
				for(let i = 0; i < 4; i++){
					// poster 주소값
					let poster = posterBase_url + res.results[i].poster_path;
					let movie_id = res.results[i].id;
					let movie_title = res.results[i].original_title;
		
					//상세 영화 목록가서 id, title, duration_min 가져오기
					fetch("https://api.themoviedb.org/3/movie/"+movie_id+"?api_key="+key+"&language=kr-KR")
						.then(response => response.json())
						.then((res)=>{
						console.log(res);
						let movie_runtime = res.runtime;
						let input_movie = [movie_id, movie_title, movie_runtime]; // 배열
	
	
						for(let i =0; i<3; i++){
	
							let input = document.createElement('input');
							input.setAttribute('type', 'hidden');
							
							if(i == 0){
								input.setAttribute('name', "inputMovieId");
								input.setAttribute('value',input_movie[0]);
								form.appendChild(input);
							} else if(i == 1){
								input.setAttribute('name', "inputMovieTitle");
								input.setAttribute('value',input_movie[1]);
								form.appendChild(input);
							} else if(i == 2){
								input.setAttribute('name', "inputMovieRuntime");
								input.setAttribute('value',input_movie[2]);
								form.appendChild(input);
							}
	
		
						}
							
		
					})
					.catch(error=>console.log(error));
	
				}
			})
			.catch(error => console.log(error));
	
		</script>
		</form>
	
	
	<%}else{ %>
		<form action = "${pageContext.servletContext.contextPath}/member.view/logout.jsp" method = "post">
			<p>${id}님, 반갑습니다!</p>
			<input type = "submit" name = "logout" value = "로그아웃">
			<input type = "hidden" name = "account" value = "logout">
		</form> 
	<%} %>
	</div>


	
	
</body>
</html>