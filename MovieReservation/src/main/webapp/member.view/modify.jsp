<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>비밀번호 수정페이지입니다</h3>
  <form action="${pageContext.servletContext.contextPath }/memberUpdate.do" method="post">
  <input type="password" name="passwd" placeholder="변경할 비밀번호"><br>
  <input type="hidden" name="id" value=${id }>
  <input type="submit" value="수정"><br>
  </form>
</body>
</html>