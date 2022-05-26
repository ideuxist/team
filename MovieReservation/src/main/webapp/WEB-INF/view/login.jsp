<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>login, logout</title>
<style>
	#login {
		background-color: black;
		text-align: right;
	}

	.login_btn{
		border: 0;
		outline: 0;
		color:#888888;
		background-color: black;
		font-size: 12px;
		margin-right:20px;
	}

	.find_btn{
		color:#888888;
		font-size: 12px;
	}
	.login_text{
		font-weight: 700;
		margin : 20px 20px 0 0;
	}
	.find_btn_no{
		border: 0;
		outline: 0;
		color:#888888;
		background-color: black;
		font-size: 12px;
		margin-right : 20px;
	}
	.login_btn_no{
		border: 0;
		outline: 0;
		color:#888888;
		background-color: black;
		font-size: 12px;
		margin-right : 20px;
	}
	#login_form{
		margin-top:20px;
	}
	.login_login{
		border: 0;
		outline: 0;
		color:#888888;
		background-color: black;
		font-size: 12px;
		margin: 0 20px 0 0;
	}
	#login_formform{
		margin-top : 20px;
	}
</style>

</head>
<body>
	<script type="text/javascript">
		function openFindId() {
			window.name = "parentFrom";
			window.open("member.view/findIdForm.jsp", "findIdForm",
					"width=500, height=300, resizable = no, scrollbars = no");
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
	<form action ="${pageContext.servletContext.contextPath}/member.view/login.tiles" method = "post" id = "login_formform">
	<input type ="submit" value ="로그인" class="login_login">

	</form>
	<form action = "${pageContext.servletContext.contextPath}/member.view/join.tiles" method = "post">
		<input type = "submit" value = "회원가입"  class="login_btn_no">
	</form>
	
	<%}else if(id.equals("admin")){%>
		<form action = "${pageContext.servletContext.contextPath}/member.view/logout.jsp" method = "post">
			<p class = "login_text">${id}님, 반갑습니다!</p>
			<input type = "submit" name = "logout" value = "로그아웃"  class="login_btn">
			<input type = "hidden" name = "account" value = "logout"> 
		</form>
		<form action = "${pageContext.servletContext.contextPath}/ReservationAutoControll.do" method = "post">
			<input type = "submit" name = "autoDB2" value = "영화 DB 상영등록(하루 한 번)" class="login_btn">
		</form>
	
		<form action = "${pageContext.servletContext.contextPath}/autoInputDB.do" method = "post" id = "form">
			<input type = "submit" name = "autoDB" value = "영화 DB 등록" class="login_btn">
			<script type="text/javascript">
		// key, postrt_url
		key = "90ad618fa3d2f888905f0b844cbb97df";

		let loginBase_url = "https://image.tmdb.org/t/p/w500";
		let popURL = "https://api.themoviedb.org/3/movie/popular?api_key="+key+"&language=kr-KR&page=1";
		let id = [];
		fetch(popURL)
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
					let poster = loginBase_url + res.results[i].poster_path;
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
		<form action = "${pageContext.servletContext.contextPath}/member.view/logout.jsp" method = "post" id = "user_form">
			<p  class= "login_text">${id}님, 반갑습니다!</p>
			<input type = "submit" name = "logout" value = "로그아웃" class="login_btn">
			<input type = "hidden" name = "account" value = "logout">
		</form> 
	<%} %>

	</div>

</body>
</html>