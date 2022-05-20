<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h4>가입 시 입력한 아이디와 이메일 주소를 입력하세요</h4>
<h4>비밀번호는 메일로 전송되며, 잠시만 기다려주세요</h4>
<hr>
<h5>${error }</h5>
<form action="${pageContext.servletContext.contextPath }/memberFindPw.do" method="post">
아이디 <input type="text" name="id"><br>
이메일 <input type="email" name="email"><br>
<input type="submit" value="메일전송">
</form>
</body>
</html>