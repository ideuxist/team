<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container {
  display : block;
  width : 500px;
  height : 250px;
  text-align : center;
  margin : 0 auto;
}
h4 {
 text-align : center;
}
hr {
 margin-bottom : 30px;
}
h5 {
 color : red;
 text-align : center;
}
form {
 margin : 0 auto;
}
input {
 padding : 5px;
}

#subBtn {
 margin-top : 20px;
}

</style>
</head>
<body>
<div id="container">
<h4>가입 시 사용한 정보를 입력하세요</h4>
<h4>비밀번호는 메일로 전송되며, 잠시만 기다려주세요</h4>
<hr>
<h5>${error }</h5>
<form action="${pageContext.servletContext.contextPath }/memberFindPw.do" method="post">
<input type="text" name="id" placeholder="아이디"><br>
<input type="email" name="email" placeholder="이메일"><br>
<input id ="subBtn" type="submit" value="메일전송">
</form>
</div>
</body>
</html>