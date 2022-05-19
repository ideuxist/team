<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action = "${pageContext.servletContext.contextPath}/member.view/logout.jsp" method = "post">
	<p>${id}님, 반갑습니다!</p>
	<input type = "submit" name = "logout" value = "로그아웃">
	<input type = "hidden" name = "account" value = "logout"> 
	</form>
</body>
</html>