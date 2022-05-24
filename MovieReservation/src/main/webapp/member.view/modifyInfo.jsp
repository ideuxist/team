<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#modifyFrm {
 position : relative;
 width : 800px;
 height : 600px;
 margin : 0 auto;
 top : 100px;
}
#modifyH3 {
 text-align : center;
 color : rgba(255,255,255,0.6);
}
.modifyInput {
  border-top-width: 0;
  border-left-width: 0;
  border-right-width: 0;
  border-bottom-width: 1;
  background: transparent;
  padding : 15px;
  color : white;
}
#modSubBtn {
 position : relative;
 bottom : -20px;
 border : none;
 border-radius : 5px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.4);
 padding : 2px;
}
#modDelBtn {
 position : relative;
 bottom : -20px;
 border : none;
 border-radius : 5px;
 background-color : rgba(255,255,255,0.2);
 color : rgba(255,255,255,0.4);
 padding : 2px;
}

</style>
<script type="text/javascript">
function delConfirm() {
	alert("정말 탈퇴하시겠습니까?")
}
</script>
</head>
<body>
  <div id="modifyFrm">
  <h3 id="modifyH3">수정할 정보를 재입력하세요</h3>
  <form action="${pageContext.servletContext.contextPath }/memberUpdate.do" method="post" >
  <input class="modifyInput" type="password" name="passwd"value=${member.passwd }><br>
  <input class="modifyInput" type="email" name="email" value=${member.email }><br>
  <input type="hidden" name="id" value=${member.id }><br>
  <input id="modSubBtn" type="submit" value="변경"><br>
 </form>
  <form action="${pageContext.servletContext.contextPath }/memberDelete.do" method="post" onsubmit="return delConfirm()">	
  <input type="hidden" name="id" value=${member.id }><br>
  <input id="modDelBtn" type="submit" value="회원탈퇴"><br>  
  </form> 
 </div>
 </body>
</html>