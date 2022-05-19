<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>login, logout</title>
	<style>
		#login{
			text-align: right;
		}
	</style>
</head>
<body>
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
	<div id = "login">
	
	<%
		String id = (String)session.getAttribute("id");
	%>
	
	
	<%if(id ==null){%>
	<form action ="${pageContext.servletContext.contextPath}/memberSearch.do" method = "post">
		아이디 : <input type = "text" name = "id">
		비밀번호 : <input type = "text" name = "passwd">
	<input type ="submit" value ="로그인" >
	<input type ="hidden" value = "search" name = "job">
	<a href='javascript:void(0);' onclick="openFindId();">아이디 찾기</a>
  <a href='javascript:void(0);' onclick="openFindPw();">비밀번호 찾기</a>
	</form>
	
	<form action = "${pageContext.servletContext.contextPath}/member.view/join.jsp" method = "post">
		<input type = "submit" value = "회원가입">
	</form>
	
	<%}else{%>
		<form action = "${pageContext.servletContext.contextPath}/member.view/logout.jsp" method = "post">
	<p>${id}님, 반갑습니다!</p>
	<input type = "submit" name = "logout" value = "로그아웃">
	<input type = "hidden" name = "account" value = "logout"> 
	</form>
	<%} %>
	</div>


	
	
</body>
</html>