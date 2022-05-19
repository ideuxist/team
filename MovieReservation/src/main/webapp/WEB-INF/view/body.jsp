<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#div{
		background-size: cover;
	}
	#text{
		background: #000000; opacity: 0;
	}
	#text p{
		padding-top: 300px;
	}
	#img:hover #text{
		opacity: 0.5; text-align: center; color: aliceblue;
	}
</style>
</head>
	
<body>

	<div id = "div">
		<div id ="text">
		</div>
	</div>

	
	<script type="text/javascript">
	let key = "90ad618fa3d2f888905f0b844cbb97df";
	let posterBase_url = "https://image.tmdb.org/t/p/w500";
	let popularityURL = "https://api.themoviedb.org/3/movie/popular?api_key="+key+"&language=kr-KR&page=1";



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

			let img = document.getElementById('div');
			let p = document.createElement('p');

			

	    // 메인 화면 포스터 생성
	    for(let i = 0; i < 4; i++){
	      // poster 주소값
	      let poster = posterBase_url + res.results[i].poster_path;
	      let movie_id = res.results[i].id;
	      let movie_title = res.results[i].original_title;
			let p = document.createElement('p');
	      let img = document.getElementById('div');
	      let imgTag = document.createElement('img');
		  let text = document.createElement('div');	
		  let a = document.createElement('a');
	      // p -> div:text ->img -> div:div
		  text.appendChild(p);
		  imgTag.appendChild(text);
		  a.appendChild(imgTag);
		  div.appendChild(a);
		  //속성값 넣기
	      imgTag.setAttribute('src', poster);
			console.log(movie_id);
	      a.href = "./movieInfo.html?movieId="+movie_id;

				
	    }
	  })
	  .catch(error => console.log(error));
	</script>
</body>
</html>