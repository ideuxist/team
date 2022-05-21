<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>마이페이지입니다</h3>
  <a href="${pageContext.servletContext.contextPath}/member.view/thirdLogin.tiles">내정보</a><br>
  <a href="${pageContext.servletContext.contextPath}/movieHistory.do">나의예매내역</a><br>
</body>
</html>