<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <h3>개인정보수정 페이지</h3>
  <form action="${pageContext.servletContext.contextPath }/memberUpdate.do" method="post">
  <input type="password" name="passwd" value=${member.passwd }><br>
  <input type="email" name="email" value=${member.email }><br>
  <input type="hidden" name="id" value=${member.id }><br>
  <input type="submit" value="변경"><br>
  </form>
</body>
</html>