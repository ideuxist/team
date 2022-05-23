<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #deleteH4 {
  text-align : center;
  color : rgba(255,255,255,0.6);
 }
</style>
</head>
<body>
<h4 id="deleteH4">${id }님 그동안 이용해주셔서 감사합니다. 다음에 다시 만나요!</h4>
<%
 session.invalidate();
%>
</body>
</html>