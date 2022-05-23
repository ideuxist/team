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
  width : 500px;
  height : 250px;
  margin-top : 60px;
  background : rgba(0,0,0,0.9);
}
#findPwOutput {
 display: block;
 width : 500px;
 height : 250px;
 margin : 0 auto;
 text-align : center;
}
#findPwOutputH4{
 text-align : center;
 color : rgba(255,255,255,0.9);
 position : relative;
 top : 30px;
 }
#findPwOutputBtn{
 border : none;
 border-radius : 10px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.6);
 position : relative;
 top : 30px;
}
 
</style>
</head>
<body>
<%-- <c:if test="${!empty error }">
<h4>${error }</h4>
<a href="member.view/findPwForm.jsp">다시 입력하기</a>
</c:if> --%>
<div id="findPwOutput">
<c:if test="${!empty result }">
<h4 id="findPwOutputH4">${result }</h4>
<input id="findPwOutputBtn" type="button" value="닫기" onclick=window.close()>
</c:if>
</div>
</body>
</html>