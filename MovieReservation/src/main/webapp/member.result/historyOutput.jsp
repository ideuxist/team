<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie history</title>
<style>
#hisContainer {
 position : relative;
 width : 800px;
 height : 600px;
 margin : 0 auto;
 top : 100px;
}

#tbSection {
 width : 600px;
 height : 800px;
 margin : 0 auto;
}
#historyTb {
 margin : 0 auto;
 border-collapse: collapse;
 height : 100px;
 text-align : center;
}
#hisTh1 {
 background-color : rgba(255,255,255,0.3);
}
</style>
</head>
<body>
<div id="hisContainer">
<div id="errorSection">
<% 
session = request.getSession();
String id = (String) session.getAttribute("id");
String pw = (String) session.getAttribute("pass");

if(id == null) {
	out.print("로그인이 필요합니다");
} else {
%>
</div>
<div id="tbSection">
<c:choose>
  <c:when test="${empty all }"><h3>예매 내역이 없습니다.</h3></c:when>
  <c:otherwise>
    <table id="historyTb">
      <tbody>
          <tr id="hisTh1">
           <th>제목</th>
           <th>상영관</th>
           <th>상영일시</th>
          </tr>
        <c:forEach items="${all }" var="movie">
          <tr >
            <td>${movie.movieTitle }</td>
            <td>${movie.movieRoom }</td>
            <td>${movie.movieDate }</td>
          </tr>
         </c:forEach> 
       </tbody>   
    </table>
  </c:otherwise>
</c:choose>

<% } %>
</div>
</div>
</body>
</html>