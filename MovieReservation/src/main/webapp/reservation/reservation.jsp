<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<<<<<<< HEAD
=======
<style>

.seat {
	width: 30px;
	height: 30px;
}

.clicked {
	background-color: red;
	color: white;
}
.reservBtn {
 border : none;
 border-radius : 5px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.7);
 padding : 5px;
}
input, progress {
  accent-color: rgba(255,255,255,0.9);
}
#reservTb {
 width : 300px;
 height : 106px;
 margin : 0 auto;
 font-size : 12px;
}
.reservH4 {
 color : rgba(255,255,255,0.4);
}
th, td {
    border: 1px dotted; 
    border-color : rgba(255,255,255,0.4);
  }
.reservInput {
  padding : 10px;
  border-top-width: 0;
  border-left-width: 0;
  border-right-width: 0;
  border-bottom-width: 1;
  background: transparent;
  color : white;
}  
   
</style>
>>>>>>> branch 'master' of https://github.com/ideuxist/team
</head>

<body> 

	<%String id = (String)session.getAttribute("id");
	%>
	<br>
	<br>
	<br>

	<h3 class="reservH3">STEP1. 예매</h3>
	<%if(id!=null) {%>
		<!-- 상영가능일 불러오기 -->
		<br>
		<form
			action="${pageContext.servletContext.contextPath}/screeningChoice" method="post" id="reservDate">
			<input class="reservBtn" type = "submit" value="상영일선택"><br>
			            <input type = "hidden" name="choice" value="choiceDate"> <br>
		</form>
				
		<!-- 해당 상영일 선택가능 영화 불러오기 -->
		<form action="${pageContext.servletContext.contextPath}/screeningChoice" method="post">
					<c:forEach items="${seeDate}" var="date">
					  <input type="radio" name="selectedDate" value="${date.screeningStart}"> ${date.screeningStart}<br>
					</c:forEach>
			<br><input class="reservBtn" type="submit" value="상영작보기">
					  <input type="hidden" name="choice" value="currentMovie">
		</form>
		<br>
		<!-- 해당 상영일 선택영화 가능회차 불러오기 -->	
		<form action="${pageContext.servletContext.contextPath}/screeningChoice" method="post">
			<c:forEach items="${movieList}" var="movie">
			<script>console.log(movie.audi)</script>
				<input type="radio" name="selectedMovie" value="${movie.movieTitle}"> ${movie.movieTitle}  (${selectedDate})<br>
				<input type="hidden" name="selectedDate" value="${selectedDate}">
				
			</c:forEach>
			<br> <input class="reservBtn"  type="submit" value="상영 회차 조회">
			<input type="hidden" name="choice" value="round">
		</form>
		
		<!-- 영화 날짜 회차 선택후 남은 잔여좌석 불러오기 -->
		<form action="${pageContext.servletContext.contextPath}/screeningChoice" method="post">
			<c:forEach items="${round}" var="round">
				<br><input type="radio" name="screeningID" value="${round.screeningID}">
				${selectedMovie} ${round.auditoriumID }관 (${selectedDate}) 상영시간${round.screeningStart}
				<input type="hidden" name="movie" value="${selectedMovie}">
				<input type="hidden" name="date" value="${selectedDate}">
			</c:forEach>
			<br><br><input class="reservBtn" type="submit" value="좌석조회">
			<input type="hidden" name="choice" value="searchSeat">
			<br>
		</form>
		<br>
		
<<<<<<< HEAD
		<!-- 좌석 선택 후 해당 좌석 예약 -->
		<form action="${pageContext.servletContext.contextPath}/screeningChoice" method="post">
			상영일:<input type="text" name="date" value="${selectedDate}" readonly><br><br> 
			상영영화:<input type="text" name="movie" value="${selectedMovie}" readonly><br><br> 
			상영관:<input type ="text" name="auditoriumID" value="${selectedAuditoriumId.auditoriumID}" readonly>관<br><br>
			상영시작시간:<input type="text" name="round" value="${selectedAuditoriumId.screeningStart}"readonly><br><br> 
			<input type ="hidden" name = "selectedScreeningId" value="${selectedScreeningId}">
			<h3 align="center">입구=========스크린=========출구</h3>
			<table border=1>
=======
		<!-- 	<h3 align="center">입구=========스크린=========출구</h3> -->
			<table id="reservTb" align="center">
>>>>>>> branch 'master' of https://github.com/ideuxist/team
			<tr>
			<c:forEach items="${seat}" var="seat">
					  <c:choose>
					  <c:when test="${seat.reserSeat==0}">
					  <td><input type="checkbox" name="selectedSeat" value="${seat.seatId}">${seat.seatId}번</td>
					  <c:if test="${seat.seatId==20}">
					  </tr>
					  </c:if>
					  <c:if test="${seat.seatId%5==0}">
					  </tr><tr>
					  </c:if>
					  </c:when>
					  <c:otherwise>
<<<<<<< HEAD
					  <td>${seat.seatId}번 (선택불가)</td>
=======
					  <td><input type="checkbox" name="s
					  electedSeat" value="${seat.seatId}" checked onClick="return false;">${seat.seatId}번(x)</td>
>>>>>>> branch 'master' of https://github.com/ideuxist/team
					  <c:if test="${seat.seatId==20}">
					  </tr>
					  </c:if>
					  <c:if test="${seat.seatId%5==0}">
					  </tr>
					  </c:if>
					  </c:otherwise>
					  </c:choose>
			</c:forEach>
			</table>
<<<<<<< HEAD
			<input type="submit" value="예매하기"><br><br>
=======
				<div></div>
				<br>
				<br>
		
	
				<h3 class="reservH3">STEP2. 예매 정보 확인</h3>
				<br>
				<!-- 좌석 선택 후 해당 좌석 예약 -->
		<form action="${pageContext.servletContext.contextPath}/screeningChoice" method="post">
			<input class="reservInput" type="text" name="date" value="${selectedDate}" readonly><br><br> 
			<input class="reservInput" type="text" name="movie" value="${selectedMovie}" readonly><br><br> 
			<input class="reservInput" type ="text" name="auditoriumID" value="${selectedAuditoriumId.auditoriumID}" readonly>관<br><br>
			<input class="reservInput" type="text" name="round" value="${selectedAuditoriumId.screeningStart}"readonly><br><br> 
			<input type ="hidden" name = "selectedScreeningId" value="${selectedScreeningId}">
	    <div class="seat-wrapper"></div> 
			<input class="reservBtn" type="submit" value="예매하기"><br><br>
>>>>>>> branch 'master' of https://github.com/ideuxist/team
		  <input type="hidden" name="choice" value="doReservation">
		</form>
		<c:choose>
		<c:when test="${empty seldate}">
		</c:when>
		<c:otherwise>
	  <h1>${seldate} / ${selmovie} / ${selround} /${selseat }번 좌석이 예매 되었습니다 </h1>
	  <script>
	  alert(`${seldate} / ${selmovie} / ${selround} /${selseat }번예매되었습니다`)
	  </script>
	  </c:otherwise>
	  </c:choose>	
<%} else{%>
	  <script>
		alert('로그인 후 이용가능합니다')
	  </script>	
		<jsp:forward page="/member.view/login.tiles"></jsp:forward>
<% } %> 
	
</body>
	
	


<!-- <script>


	//start viewseat
	 let test = [];
	 let selectedSeats = new Array();
	 let selectedSeatsMap = [];
	 const seatWrapper = document.querySelector(".seat-wrapper");
	 let clicked = "";
	 let div = "";

	 for (let i = 0; i < 7; i++) {
	 div = document.createElement("div");
	 seatWrapper.append(div);
	 for (let j = 0; j < 7; j++) {
	 const input = document.createElement('input');
	 input.type = "button";
	 input.name = "seats"
	 input.classList = "seat";
	 //3중포문을 사용하지 않기위해 
	 mapping(input, i, j);
	 div.append(input);
	 input.addEventListener('click', function(e) {
	 console.log(e.target.value);
	 //중복방지 함수
	 selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

	 //click class가 존재할때(제거해주는 toggle)
	 if (input.classList.contains("clicked")) {
	 input.classList.remove("clicked");
	 clicked = document.querySelectorAll(".clicked");
	 selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
	 clicked.forEach((data) => {
	 selectedSeats.push(data.value);
	 });
	 //click class가 존재하지 않을때 (추가해주는 toggle)
	 } else {
	 input.classList.add("clicked");
	 clicked = document.querySelectorAll(".clicked");
	 clicked.forEach((data) => {
	 selectedSeats.push(data.value);
	 })
	 }
	 console.log(selectedSeats);
	 })
	 }
	 }

	 function mapping(input, i, j) {
	 if (i === 0) {
	 input.value = "A" + j;
	 } else if (i === 1) {
	 input.value = "B" + j;
	 } else if (i === 2) {
	 input.value = "C" + j;
	 } else if (i === 3) {
	 input.value = "D" + j;
	 } else if (i === 4) {
	 input.value = "E" + j;
	 } else if (i === 5) {
	 input.value = "F" + j;
	 } else if (i === 6) {
	 input.value = "G" + j;
	 }
	 } //end of viewseat */ */ */
</script> -->