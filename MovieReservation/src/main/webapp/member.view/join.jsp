<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

fieldset {
 display : block;
 width : 600px;
 height : 400px;
 margin : 0 auto;
 position : relative;
 top: -150px;
 border : none;
}

#joinFrm {
 width : 500px;
 height : 300px;
 position : absolute;
 bottom : 30px;
 right : -100px;
}
.joinInput {
  display : block;
  padding : 15px;
  border-top-width: 0;
  border-left-width: 0;
  border-right-width: 0;
  border-bottom-width: 1;
  background: transparent;
  font-weight : bold;
  color : white;
}
#dupliChk {
 position : absolute;
 bottom : 222px;
 left : 120px;
 border : none;
 border-radius : 10px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.4);
}

.joinFrmBtn {
 position : relative;
 bottom : -40px;
 left : -150px;
 border : none;
 border-radius : 10px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.4);
}



</style>
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
              "chkForm", "width=500, height=300, resizable = yes, scrollbars = no");    
  }
  
  function inputIdChk(){
      document.userInfo.idDuplication.value ="idUncheck";
  }

</script>
</head>
<body>
  <fieldset>
  <div id="frm">
  <form id="joinFrm" action="${pageContext.servletContext.contextPath }/memberInsert.do" name="userInfo" method="post" onsubmit="return checkValue()">
      <input class="joinInput" type="text" name="name" required placeholder="이름">
      <input class="joinInput" type="text" name="id" placeholder="아이디" onkeydown="inputIdChk()">
      <input id="dupliChk" type="button" value="중복확인" onclick="openIdChk()">
      <input type="hidden" name="idDuplication" value="idUncheck">
   	  <input class="joinInput" type="password" name="passwd" placeholder="비밀번호">
   	  <input class="joinInput" type="password" name="passwdcheck" placeholder="비밀번호확인">
   	  <input class="joinInput" type="email" name="email" required placeholder="이메일">
   	  <input class="joinFrmBtn" type="submit" value="회원가입">
   	  <input class="joinFrmBtn" type="button" value="취소" onclick="location.href='login.tiles'">
   </form>
   </div>
  </fieldset>
</body>
</html>