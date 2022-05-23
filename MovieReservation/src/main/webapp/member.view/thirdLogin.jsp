<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#relogin {
 position : relative;
 top : 100px;
 width : 600px;
 height : 400px;
 margin : 0 auto;
}
.reloginInput {
  padding : 15px;
  border-top-width: 0;
  border-left-width: 0;
  border-right-width: 0;
  border-bottom-width: 1;
  background: transparent;
  color : white;
}
#reloginBtn {
 position : relative;
 bottom : -20px;
 border : none;
 border-radius : 5px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.4);
 padding : 2px;
}
 
</style>
</head>
<body>
<div id="relogin">
<h3>${error }</h3>
  <h3>${result }</h3>
  <form action="${pageContext.servletContext.contextPath }/memberSearch.do" method="post">
  <input class="reloginInput" type="text" name="id" placeholder="아이디" autocomplete="off"><br>
  <input class="reloginInput" type="password" name="passwd" placeholder="비밀번호" autocomplete="off"><br>
  <input type="hidden" name="job" value="update">
  <input id ="reloginBtn" type="submit" value="로그인"><br>
  </form>
</div>
</body>
</html>