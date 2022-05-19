<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
가입 시 입력한 아이디와 이메일 주소를 입력하세요<br>
비밀번호는 메일로 전송되며, 최대 10초의 시간이 소요되니 잠시만 기다려주세요.<br>
<hr>

<form action="${pageContext.servletContext.contextPath }/memberFindPw.do" method="post">
아이디 <input type="text" name="id"><br>
이메일 <input type="email" name="email"><br>
<input type="submit" value="메일전송">
</form>
</body>
</html>