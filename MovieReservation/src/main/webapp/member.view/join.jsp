<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function checkValue()
  {
	  var form = document.userInfo;
	  
	  if(form.idDuplication.value != "idCheck") {
		  alert("아이디 중복체크를 해주세요.")
		  return false;
	  }
	  if(form.passwd.value != form.passwdcheck.value) {
		  alert("비밀번호를 동일하게 입력하세요");
		  return false;
	  }
  }
  
  function openIdChk(){
      
      window.name = "parentForm";
      window.open("idCheckForm.jsp",
              "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
  }
  
  function inputIdChk(){
      document.userInfo.idDuplication.value ="idUncheck";
  }
  
  function goIndex() {
	  
  }
   

</script>
</head>
<body>
  <h3>회원가입 페이지입니다</h3>
  <form action="${pageContext.servletContext.contextPath }/memberInsert.do" name="userInfo" method="post" onsubmit="return checkValue()">
    이름 <input type="text" name="name"><br>
    아이디 <input type="text" name="id" onkeydown="inputIdChk()">
    <input type="button" value="중복확인" onclick="openIdChk()"><br>
    <input type="hidden" name="idDuplication" value="idUncheck">
   	비밀번호 <input type="password" name="passwd"><br>
   	비밀번호 확인 <input type="password" name="passwdcheck"><br>
   	<input type="submit" value="회원가입"><br>
   	<input type="button" value="취소" onclick="location.href='login.jsp'">
  </form>
  
</body>
</html>