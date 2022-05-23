<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>영화상세정보</title>
</head>

<link rel="stylesheet" href="movieInfo.css">

<body>

<%
String id = (String) session.getAttribute("id");
%>

<script>
	let sessionId = `${id}`;
</script>

	<div class="container">
		<div class="poster"></div>
		<div class="overview">
			<div>
				<div id="title"></div>
				<div id="relDate"></div>
			</div>
			<div id="ratingDivParent">
				NEGABOX 평점
				<div id="ratingDiv"></div>
			</div>
			<div id="overview"></div>
			<div id="btnSet">
				<div id="likesDiv">
					좋아요
					<div id="likeCount"></div>
				</div>

				<div id="reserveBtn">예매하기</div>
			</div>
		</div>
		<div class="info"></div>
		<div class="comment">
			<div id="cmtTableCont">
				<table id="cmtTable"></table>
			</div>
			<div id="pageNav">
				<button id="btn_prev">이전</button>
				<div id="pagination"></div>
				<button id="btn_next">다음</button>
			</div>
			<br>
			<div id="cmtSubmit">
				<div class="star-rating">
					<input type="radio" id="5-stars" name="rating" value="5"> <label
						for="5-stars" class="star">&#9733;</label> <input type="radio"
						id="4-stars" name="rating" value="4"> <label for="4-stars"
						class="star">&#9733;</label> <input type="radio" id="3-stars"
						name="rating" value="3"> <label for="3-stars" class="star">&#9733;</label>
					<input type="radio" id="2-stars" name="rating" value="2"> <label
						for="2-stars" class="star">&#9733;</label> <input type="radio"
						id="1-star" name="rating" value="1"> <label for="1-star"
						class="star">&#9733;</label>
				</div>
				<input type="text" name="" id="area" placeholder="이 영화 어떠셨나요?">
			</div>
			<input id="addBtn" type="button" value="입력">
		</div>
		<div class="trailer"></div>
	</div>
	<script type="text/javascript" src="movieInfo.js"></script>
</body>

</html>