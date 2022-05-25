<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <script type="text/javascript">
      function backToList(obj){
	    obj.action="${contextPath}/boardController.boa";
	    obj.submit();
	  }
   </script>
   <style>
   		#viewArticle_table{
  			margin : 100px 0 0 665px; 			
   			border : 0;
   		}
   		.viewArticle_textBox{
   			width : 439px;
   			font-size : 14px;	
   			color : white;
   			padding : 2px;
   		}
   		#i_content{
   			color: white;
   			background-color : #aaa;
   			font-size : 12px;
   			width : 439px;
   		}
   		#i_imageFileName{
   			color : white;
   		}
   		#viewArticle_formatDate{
   			color : white;
   		}
   		.viewArticle_btn{
   		 position : relative;
		 top : 20px;
		 border : none;
		 border-radius : 5px;
		 padding : 2px;
		 background-color : rgba(255,255,255,0.2);
		 color : rgba(255,255,255,0.4);
   		}
   		.viewArticle_btn_last{
   			position : relative;
			 top : 20px;
			 border : none;
			 border-radius : 5px;
			 padding : 2px;
			 background-color : rgba(255,255,255,0.2);
			 color : rgba(255,255,255,0.4);
			 margin : 0 130px 0 0 ;
   		}

   </style>
</head>
<body>

  <form name="frmArticle" method="post"  enctype="multipart/form-data">
  <table id = "viewArticle_table">
  <tr>
   <td width="150" align="center" bgcolor="#888">
      글번호
   </td>
   <td >
    <input type="text"  value="${article.articleNO }" disabled  class = "viewArticle_textBox"/>
    <input type="hidden" name="articleNO" value="${article.articleNO}"  />
   </td>
  </tr>
  <tr>
   <td width="150" align="center" bgcolor="#888">
      작성자 아이디
   </td>
   <td >
    <input type="text" value="${article.id }" name="id" disabled class = "viewArticle_textBox"/>
   </td>
  </tr>
  <tr>
   <td width="150" align="center" bgcolor="#888">
      제목 
   </td>
   <td>
    <input type="text" value="${article.title }"  name="title"  id="i_title" disabled class = "viewArticle_textBox">
   </td>   
  </tr>
  <tr>
   <td width="150" align="center" bgcolor="#888">
      내용
   </td>
   <td>
    <textarea rows="20" cols="60"  name="content"  id="i_content"  disabled>${article.content }</textarea>
   </td>  
  </tr>
 
<c:if test="${not empty article.imageFileName && article.imageFileName!='null' }">  
<tr>
   <td width="20%" align="center" bgcolor="#888"  rowspan="2">
      이미지
   </td>
   <td>
     <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
    <img src="${contextPath}/download.do?imageFileName=${article.imageFileName}&articleNO=${article.articleNO }"   id="preview"  /><br>
       
   </td>   
  </tr>  
  <tr>
    <td>
       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled  onchange="readURL(this);"   />
    </td>
  </tr>
 </c:if>
  <tr>
	   <td width="20%" align="center" bgcolor="#888">
	      등록일자
	   </td>
	   <td>
	    <input type=text value="<fmt:formatDate value="${article.writeDate}"/>" disabled  id = "viewArticle_formatDate"/>
	   </td>   
  </tr>
  <tr   id="tr_btn_modify"  >
	   <td colspan="2"   align="center" >
	       <input type=button value="수정하기"   onClick="fn_modify_article(frmArticle)"  >
           <input type=button value="취소"  onClick="backToList(frmArticle)">
	   </td>   
  </tr>
    
  <tr  id="tr_btn"    >
   <td colspan=2 align="center">
     <%-- <c:if test="${member.id == article.id }">
	    <input type=button value="수정하기" onClick="fn_enable(this.form)">
	    <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
	  </c:if> --%>
	  <input type=button value="수정"  class = "viewArticle_btn" onClick="fn_enable(this.form)" >
	  <input type=button value="삭제" class = "viewArticle_btn" onClick="fn_remove_article('${contextPath}/board/removeArticle.boa', ${article.articleNO})">
	  <input type=button value="리스트로 돌아가기" class = "viewArticle_btn" onClick="backToList(this.form)">
	  <input type=button value="답글" class = "viewArticle_btn_last" onClick="fn_reply_form('${contextPath}/board/replyForm.boa', ${article.articleNO})">
   </td>
  </tr>
 </table>
 </form>
</body>
</html>