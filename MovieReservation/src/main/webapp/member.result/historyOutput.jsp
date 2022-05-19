<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie history</title>

</head>
<body>
<% 
session = request.getSession();
String id = (String) session.getAttribute("id");
String pw = (String) session.getAttribute("pass");

if(id == null) {
	out.print("로그인이 필요합니다");
} else {
%>

<c:choose>
  <c:when test="${empty all }"><h3>예매 내역이 없습니다.</h3></c:when>
  <c:otherwise>
    <table border="1">
      <tbody>
        <c:forEach items="${all }" var="movie">
          <tr>
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
</body>
</html>