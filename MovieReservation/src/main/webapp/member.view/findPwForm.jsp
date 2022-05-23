<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  margin-top : 50px;
  background : rgba(0,0,0,0.9);
}
#container {
  display : block;
  width : 500px;
  height : 250px;
  text-align : center;
  margin : 0 auto;
}

#findPwFrmH4 {
 text-align : center;
 color : rgba(255,255,255,0.6);
}
#findPwFrmH5 {
 text-align : center;
 color : rgba(255,255,255,0.9);
}
form {
 margin : 0 auto;
}
.findPwInput {
 padding : 10px;
 border-top-width: 0;
  border-left-width: 0;
  border-right-width: 0;
  border-bottom-width: 1;
  background: transparent;
  color : white;
}

#subBtn {
   position : relative;
  top : 50px;
  right : 0px;
  border : none;
 border-radius : 5px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.4);
 padding : 2px;
}

</style>
</head>
<body>
<div id="container">
<h4 id="findPwFrmH4">입력 후 잠시만 기다려주세요. 비밀번호는 메일로 전송됩니다.</h4>
<h5 id="findPwFrmH5">${error }</h5>
<form action="${pageContext.servletContext.contextPath }/memberFindPw.do" method="post">
<input class="findPwInput" type="text" name="id" placeholder="아이디" autocomplete="off" required><br>
<input class="findPwInput" type="email" name="email" placeholder="이메일" autocomplete="off" required><br>
<input id ="subBtn" type="submit" value="메일전송">
</form>
</div>
</body>
</html>