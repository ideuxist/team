<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function delConfirm() {
	alert("정말 탈퇴하시겠습니까?")
}
</script>
</head>
<body>
  <h3>정보수정</h3>
  <form action="${pageContext.servletContext.contextPath }/memberUpdate.do" method="post" >
  <input type="password" name="passwd" value=${member.passwd }><br>
  <input type="email" name="email" value=${member.email }><br>
  <input type="hidden" name="id" value=${member.id }><br>
  <input type="submit" value="변경"><br>
 </form>
<hr>
  <form action="${pageContext.servletContext.contextPath }/memberDelete.do" method="post" onsubmit="return delConfirm()">	
  <input type="hidden" name="id" value=${member.id }><br>
  <input type="submit" value="회원탈퇴"><br>  
  </form> 
 </body>
</html>