<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  margin-top : 60px;
  background : rgba(0,0,0,0.9);
}

#container {
  display : block;
  width : 500px;
  height : 250px;
  text-align : center;
  margin : 0 auto;
}
#findIdFrmH4 {
 text-align : center;
 color : rgba(255,255,255,0.6);
}
#findIdFrmH5 {
 text-align : center;
 color : rgba(255,255,255,0.9);
}

h5 {
 color : red;
 
}
form {
 margin : 0 auto;
}
#findIdInput {
  padding : 15px;
  border-top-width: 0;
  border-left-width: 0;
  border-right-width: 0;
  border-bottom-width: 1;
  background: transparent;
  color : white;
  position : relative;
  left : 20px;
}
#findIdInputBtn {
  position : relative;
  top : 80px;
  right : 110px;
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
<h4 id="findIdFrmH4">가입할 때 사용한 이메일 주소를 입력하세요</h4>
<h5 id="findIdFrmH5">${error }</h5>
<form action="${pageContext.servletContext.contextPath }/memberFindId.do" method="post">
<input id="findIdInput" type="email" name="email" required autocomplete="off"> 
<input id="findIdInputBtn" type="submit" value="확인">
</form>
</div>
</body>
</html>