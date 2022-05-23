<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
#findIdOutput {
 display: block;
 width : 500px;
 height : 250px;
 margin : 0 auto;
 text-align : center;
}
#findIdOutputH4{
 text-align : center;
 color : rgba(255,255,255,0.9);
 }
#findIdOutputBtn{
 border : none;
 border-radius : 10px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.6);

}

</style>
</head>
<body>
<%-- <c:if test="${empty vo }">
 <h4>이메일 주소를 다시 확인해주세요</h4>
 </c:if> --%>
<div id="findIdOutput"> 
<c:if test="${!empty vo }">
 <h4 id="findIdOutputH4">아이디는 ${vo.id } 입니다</h4>
<input id="findIdOutputBtn" type="button" value="닫기" onclick="window.close()">
</c:if>
</div> 
</body>
</html>