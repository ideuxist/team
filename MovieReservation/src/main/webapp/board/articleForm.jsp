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
<title>글쓰기창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/board/addArticlesubmit.boa";
    obj.submit();
  }

</script>
 <title>새글 쓰기 창</title>
 <style>
 	#articleForm_h1{
 		margin-top:40px;

 	}
 	#articleForm{
 		margin: 80px 0 0 610px; 
 	}
 	#articleForm_textarea{
 		width : 502px;
 	}
 	#preview{
 	
 	}
 	#articleForm_fileUploadBtn{
 		margin-left:44px;
 	}
	.articleForm_finalbtn{
		margin: 15px 0 0 170px;
	}
 </style>
</head>
<body>
<h1 style="text-align:center" id = "articleForm_h1">새 글 작성</h1>
  <form name="articleForm" method="post"  action="${contextPath}/board/addArticlesubmit.boa"   enctype="multipart/form-data" id = "articleForm">
    <table id = "articlefrom_table" >
     <tr>
	   <td align="right">글제목: </td>
	   <td colspan="2"><input type="text" size="67"  maxlength="500" name="title" /></td>
	 </tr>
	 <tr>
		<td align="right" valign="top"><br>글내용: </td>
		<td colspan=2><textarea name="content" rows="10" cols="65" maxlength="4000" id = "articleForm_textarea"></textarea> </td>
     </tr>
     <tr>
        <td align="right">이미지파일 첨부:  </td>
	     <td> <input type="file" name="imageFileName"  onchange="readURL(this);" id = "articleForm_fileUploadBtn"></td>
         <td><img  id="preview" src="#"   width=200 height=200/></td>
	 </tr>
	 <tr>
	    <td align="right"> </td>
	    <td colspan="2">
	       <input type="submit" value="글쓰기" class = "articleForm_finalbtn" />
	       <input type=button value="목록보기" onClick="backToList(this.form)" />
	    </td>
     </tr>
    </table>
  </form>
</body>
</html>
