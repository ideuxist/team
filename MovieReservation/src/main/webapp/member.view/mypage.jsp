<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mypageDiv {
 position : relative;
 top : -100px;
}

</style>
</head>
<body>
<div id="mypageDiv">
  <a href="${pageContext.servletContext.contextPath}/member.view/thirdLogin.tiles" class="mpa">내정보</a><br>
  <br>
  <br>
  <a href="${pageContext.servletContext.contextPath}/movieHistory.do" class="mpa">나의예매내역</a><br>
</div>
</body>
</html>