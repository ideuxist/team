<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function openFindId() {
	window.name = "parentFrom";
	window.open("findIdForm.jsp",
	"findIdForm", "width=500, height=300, resizable = no, scrollbars = no");
	
}

function openFindPw() {
	window.name = "parentFrom";
	window.open("findPwForm.jsp",
	"findPwForm", "width=500, height=300, resizable = no, scrollbars = no");
	
}
</script>
</head>
<body>
  <h3>로그인 페이지입니다</h3>
  <h3>${error }</h3>
  <h3>${result }</h3>
  
  <form action="${pageContext.servletContext.contextPath }/memberSearch.do" method="post">
  <input type="text" name="id" placeholder="아이디"><br>
  <input type="password" name="passwd" placeholder="비밀번호"><br>
  <input type="hidden" name="job" value="search">
  <input type="submit" value="로그인"><br>
  <a href='javascript:void(0);' onclick="openFindId();">아이디 찾기</a>
  <a href='javascript:void(0);' onclick="openFindPw();">비밀번호 찾기</a>
  </form>
</body>
</html>