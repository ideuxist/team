<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${id }님 그동안 이용해주셔서 감사합니다. 다음에 다시 만나요!
<%
 session.invalidate();
%>
</body>
</html>