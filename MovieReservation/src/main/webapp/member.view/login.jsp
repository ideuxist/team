<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#loginFrm {
 position : relative;
 width : 600px;
 height : 500px;
 margin : 0 auto;
 top : 100px;
}
.loginH3 {
 text-align : center;
 color : rgba(255,255,255,0.6);
}
.loginInput {
  padding : 15px;
  border-top-width: 0;
  border-left-width: 0;
  border-right-width: 0;
  border-bottom-width: 1;
  background: transparent;
  color : white;
}
#loginBtn {
 position : relative;
 top : 20px;
 border : none;
 border-radius : 5px;
 padding : 2px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.4);
}
.loginA {
 text-align : center;
 color : rgba(255,255,255,0.6);
 border : solid 1.5px;
 border-radius : 5px;
 padding : 1.5px;
 font-size : 12px;
}
#loginA2 {
 color : rgba(255,255,255,0.6);
 font-weight : bolder;
}
</style>
<script type="text/javascript">
function openFindId() {
	window.name = "parentFrom";
	window.open("findIdForm.jsp",
	"findIdForm", "width=500, height=300, resizable = yes, scrollbars = no");
	
}

function openFindPw() {
	window.name = "parentFrom";
	window.open("findPwForm.jsp",
	"findPwForm", "width=500, height=300, resizable = yes, scrollbars = no");
	
}
</script>
</head>
<body>
 <div id="loginFrm">
  <h3 class="loginH3">${error }</h3>
  <h3 class="loginH3">${result }</h3>
  
  <form action="${pageContext.servletContext.contextPath }/memberSearch.do" method="post">
  <input class="loginInput" type="text" name="id" placeholder="아이디" autocomplete="off"><br>
  <input class="loginInput" type="password" name="passwd" placeholder="비밀번호" autocomplete="off"><br>
  <input type="hidden" name="job" value="search">
  <input id="loginBtn" type="submit" value="로그인"><br>
  <br>
  <br>
  <a class="loginA" href='javascript:void(0);' onclick="openFindId();">아이디 찾기</a>
  <a class="loginA" href='javascript:void(0);' onclick="openFindPw();">비밀번호 찾기</a>
  </form>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  NEGABOX가 처음이신가요? <a id="loginA2" href="${pageContext.servletContext.contextPath }/member.view/join.tiles">회원가입</a>
 </div>
</body>
</html>