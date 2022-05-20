<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
 display: inline-block;
 text-align : center;
 padding : 80px 50px 80px 100px;
}
</style>
</head>
<body>
<%-- <c:if test="${!empty error }">
<h4>${error }</h4>
<a href="member.view/findPwForm.jsp">다시 입력하기</a>
</c:if> --%>
<div>
<c:if test="${!empty result }">
<h4>${result }</h4>
<input type="button" value="닫기" onclick=window.close()>
</c:if>
</div>
</body>
</html>