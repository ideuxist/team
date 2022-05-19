<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<c:if test="${empty vo }">
 <h4>이메일 주소를 다시 확인해주세요</h4>
 </c:if>
<c:if test="${!empty vo }">
 <h4>아이디는 ${vo.id } 입니다</h4>
<input type="button" value="닫기" onclick="window.close()">
</c:if> 
</body>
</html>