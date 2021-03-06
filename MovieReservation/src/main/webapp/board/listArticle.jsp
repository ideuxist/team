<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
.cls1 {
	text-decoration: none;
	color: white;
}

.cls2 {
	text-align: right;
	font-size: 20px;
	color: #999;
	margin: 10px 200px 0 0;

}

#QnAList {
	margin: 200px 0 0 190px;
	color: white;
	
}

#span_answer{
	color : #55a;
	font-weight : 900;
}


</style>
</head>
<body>
	<table border="1" width="80%" id="QnAList">
		<tr height="10" align="center" bgcolor="#888888">
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>

		<c:choose>
			<c:when test="${empty articlesList }">
				<tr height="10">
					<td colspan="4">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 글이 없습니다</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty articlesList }">
				<!-- articleList로 포워딩 된 글 목록을 foreach태그를 이용해 표시 -->
				<c:forEach var="article" items="${articlesList }"
					varStatus="articleNum">
					<tr align="center">
						<!-- foreach 태그의 varstatus의 count속성을 이용해 글번호를 1부터 자동으로 표시 -->
						<td width="5%">${articleNum.count}</td>
						<td width="10%">${article.id }</td>
						<!-- 왼쪽으로 여백준 다음 제목 표시 -->
						<td align="left" width="35%"><span
							style="padding-right: 30px"></span> <c:choose>
								<c:when test='${article.level > 1}'>
									<!-- 부모 글 기준으로 왼쪽여백 level*20만큼 답글 들여쓰기 -->
									<c:forEach begin="1" end="${article.level}" step="1">
										<span style="padding-left: 20px"></span>
									</c:forEach>
									<span style="font-size: 12px;" id = "span_answer">[답변]</span>
									<a class='cls1'
										href="${contextPath}/viewArticle.boa?articleNO=${article.articleNO}">${article.title}</a>
								</c:when>
								<c:otherwise>
									<a class='cls1'
										href="${contextPath}/board/viewArticle.boa?articleNO=${article.articleNO}">${article.title }</a>
								</c:otherwise>
							</c:choose></td>
						<td width="10%"><fmt:formatDate value="${article.writeDate}" /></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<a class="cls1" href="${contextPath}/board/addArticle.boa"><p class="cls2">글쓰기</p></a>



</body>
</html>