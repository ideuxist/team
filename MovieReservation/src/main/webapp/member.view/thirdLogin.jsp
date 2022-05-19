<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3>정보 확인을 위해 한 번 더 로그인해 주세요</h3>
<h3>${error }</h3>
  <h3>${result }</h3>
  <form action="${pageContext.servletContext.contextPath }/memberSearch.do" method="post">
  <input type="text" name="id" placeholder="아이디"><br>
  <input type="password" name="passwd" placeholder="비밀번호"><br>
  <input type="hidden" name="job" value="update">
  <input type="submit" value="로그인"><br>
  </form>

</body>
</html>