<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>     
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#poster_background{
	background-size: cover;
	position: relative;
}

#poster_body{
   background: rgba(0,0,0,0.7);
  position: relative;	
}


.poster_img{
	width: 300px;
	height: 450px;
	margin: 80px 20px 20px 0;
	z-index: 2;
	position: relative;
}
#poster_div{
	opacity: 2;
	text-align: center;	
}
.poster_ul{
	z-index: 1;
	list-style: none;
	display: inline-block;
}
#poster_btn{
	margin : 0 20px 40px 0;
}

.poster_div_btn{
	margin-left: 20px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border : none;
	background-color : #037b94;
	color : white;
	width: 300px;
	height : 40px;
	position: relative;
	font-size: 15px;
}
.poster_div_btn_first{
	margin-left: 20px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border : none;
	background-color : #037b94;
	color : white;
	width: 300px;
	height : 40px;
	position: relative;
	font-size: 15px;
}

.poster_like_btn_first{
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	width: 80px;
	height: 40px;
	border: 1px solid #fff;
  color: #fff;
	background-color: black;
	font-size: 15px;
}



.poster_like_btn{
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	width: 80px;
	height: 40px;
	margin-left: 20px;
	border: 1px solid #fff;
  color: #fff;
	background-color: black;
	font-size: 15px;
}



</style>
</head>

<body>
	<div id = "poster_background">
		<div id = "poster_body">
			<div id = "poster_div">
			</div>
		<form action = "${pageContext.servletContext.contextPath}/reservation/reservation.tiles"method="post" id = "poster_form">
			<div id = "poster_btn">
			
			</div>
		</form>
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
	
	// 뒷 배경 넣기
	document.getElementById('poster_background').style.backgroundImage = "url('"+ posterBase_url + res.results[0].poster_path + "')";

	// 메인 화면 포스터 생성
	for(let i = 0; i < 4;  i++){
	  // poster 주소값
	  let poster = posterBase_url + res.results[i].poster_path;
	  let movie_id = res.results[i].id;
	  let movie_title = res.results[i].original_title;

	  console.log(movie_id);

	  let imgTag = document.createElement('img');
	  let url = "./movieInfo/movieInfo.tiles?movieId="+ movie_id;
	  let a = document.createElement('a');
	  a.href = url;
	  let ul = document.createElement('ul');
	  let li = document.createElement('li');
	  let div = document.getElementById('poster_div');

	  //속성값 넣기
	  imgTag.setAttribute('src', poster);
	  imgTag.setAttribute('class', 'poster_img');
	  a.setAttribute('class', 'poster_a')
	  li.setAttribute('class', 'poster_li');
	  ul.setAttribute('class', 'poster_ul');

	  // img -> a -> li -> ul -> div
	  a.appendChild(imgTag);
	  li.appendChild(a);
	  ul.appendChild(li);
	  div.appendChild(ul);
	}
	
		
	for(let i = 0; i <4; i++){
		//poster_btn 만들기
		let input = document.createElement('input');
		let input_like=document.createElement('input');
		let poster_btn = document.getElementById('poster_btn');
		let poster_form = document.getElementById('poster_form');
		//속성 부여
		// input -> poster_btn -> poster_
		if(i == 0){
		// input_like.setAttribute('type','button');
		// input_like.setAttribute('class','poster_like_btn_first');
		// input_like.setAttribute('title','좋아요 버튼');
		// input_like.setAttribute('value','Like');
		input.setAttribute('type', 'submit');
		input.setAttribute('class', 'poster_div_btn_first');
		input.setAttribute('title', '영화 예매');
		input.setAttribute('value', '예매');
		// poster_btn.appendChild(input_like);
		poster_btn.appendChild(input);
		poster_form.appendChild(poster_btn);
		} else {
		// input_like.setAttribute('type','button');
		// input_like.setAttribute('class','poster_like_btn');
		// input_like.setAttribute('title','좋아요 버튼');
		// input_like.setAttribute('value','Like');
		input.setAttribute('type', 'submit');
		input.setAttribute('class', 'poster_div_btn');
		input.setAttribute('title', '영화 예매');
		input.setAttribute('value', '예매');
		// poster_btn.appendChild(input_like);
		poster_btn.appendChild(input);
		poster_form.appendChild(poster_btn);
		}

		}

		

		


	// 좋아요 버튼 추가하기(megabox 참고)
	// 배경 이미지 격자무늬 background: repeating-linear-gradient(90deg, #000, #000 3px, #fff 0, #fff 3px);
	
	
  })
  
  
  .catch(error => console.log(error));

</script>
</body>
</html>