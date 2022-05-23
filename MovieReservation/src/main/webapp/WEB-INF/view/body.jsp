<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.poster_img{
		width: 300px;
		height: 450px;
		margin: 100px 20px 0 0;
		z-index: 1;
	}
	#poster_div{
		opacity: 1;
		text-align: center;


		
	}
	.poster_ul{
		z-index: 1;
		list-style: none;
		display: inline-block;
	}
	
</style>
</head>
	
<body>
	<div id = "poster_body">
		<div id = "poster_div">
		</div>
		<div id = "poster_btn">
		</div>
	</div>
	

	<script type="text/javascript">
	// key, postrt_url
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
	    // backdrop_path : backdrop_path${pageContext.request.contextPath}/reservation/reservation.tiles

	    // 메인 화면 포스터 생성
	    for(let i = 0; i < 4;  i++){
	      // poster 주소값
	      let poster = posterBase_url + res.results[i].poster_path;
	      let movie_id = res.results[i].id;
	      let movie_title = res.results[i].original_title;

	      let imgTag = document.createElement('img');
	      let a = document.createElement('a');
		  let ul = document.createElement('ul');
		  let li = document.createElement('li');
	      let div = document.getElementById('poster_div');

		  //속성값 넣기
	      imgTag.setAttribute('src', poster);
		  imgTag.setAttribute('class', 'poster_img');
		  a.setAttribute('class', 'poster_a')
	      a.href = "./movieInfo.html?movieId="+movie_id;
		  li.setAttribute('class', 'poster_li');
		  ul.setAttribute('class', 'poster_ul');

	      // img -> a -> li -> ul -> div
		  a.appendChild(imgTag);
		  li.appendChild(a);
		  ul.appendChild(li);
		  div.appendChild(ul);
	    }
		// 뒷 배경 넣기
		document.getElementById('poster_body').style.backgroundImage = "url('"+ posterBase_url + res.results[0].poster_path + "')";
		
		//poster_btn 만들기
		let input = document.createElement('input');
		let btn_a = document.createElement('a');
		let poster_btn = document.getElementById('poster_btn');
		//속성 부여
		input.setAttribute('type', 'button');
		input.setAttribute('class', 'poster_div_btn');
		btn_a.setAttribute('href', '$/reservation/reservation.tiles');
		btn_a.setAttribute('class', 'reservation_btn');
		btn_a.setAttribute('title', '영화 예매');
		btn_a.innerHTML = '예매';
		
		input.appendChild(btn_a);
		poster_btn.appendChild(input);



		// 좋아요 버튼 추가하기(megabox 참고)
		// 배경 이미지 격자무늬 background: repeating-linear-gradient(90deg, #000, #000 3px, #fff 0, #fff 3px);
		
		
	  })
	  
	  
	  .catch(error => console.log(error));

	</script>
</body>
</html>