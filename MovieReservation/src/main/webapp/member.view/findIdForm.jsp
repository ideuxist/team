<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

div {
 padding : 20px;
}
h4 {
 text-align : center;
}
hr {
 margin-bottom : 30px;
}
h5 {
 color : red;
 text-align : center;
}
form {
 margin : 0 auto;
}
input {
 padding : 5px;
}
</style>
</head>
<body>
<div>
<h4>가입할 때 사용한 이메일 주소를 입력하세요</h4>
<hr>
<h5>${error }</h5>
<form action="${pageContext.servletContext.contextPath }/memberFindId.do" method="post">
<input type="email" name="email"> 
<input type="submit" value="확인">
</form>
</div>
</body>
</html>