<%@page import="coding_free.vo.CodingFreeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	CodingFreeBean article = (CodingFreeBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#articleForm {
	width: 500px;
	height: 500px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40px;
	text-align: center;
}

#articleContentArea {
	background: orange;
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

#commandList {
	matgin: auto;
	width: 500;
	text-align: center;
}

</style>
 
</head>
<body>
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제목 : ${article.subject } <br> 
			첨부파일 :	<%if(article.getFile() != null) {%>
			<a href="CodingFreeFileDown.cf?file_name=${article.file }" target="blank">${article.file }</a>
			<%}%>
		</section>
		<section id="articleContentArea">
			${article.content }
		</section>
	</section>
	
	<section id="commandList">
		<a href="CodingFreeModifyForm.cf?num=${article.num }&page=<%=nowPage%>">
		<input type="button" value="수정"></a> 
		<a href="CodingFreeDeletePro.cf?num=${article.num }&page=<%=nowPage%>">
		<input type="button" value="삭제"></a> 
		<a href="CodingFreeList.cf?page=<%=nowPage%>">
		<input type="button" value="목록"></a>
	</section>
	
	<!-- ---------------------------------------------------------------------------------------------------------------------------------------------- -->
	
    <!-- 댓글 부분 -->
    <div id="comment">
        <table border="1">
	
	<!-- 댓글 목록 -->
	<c:if test="${requestScope.commentList != null}">
		<c:forEach var="comment" items="${requestScope.commentList}">
			<tr>
			<!-- 아이디,작성날짜 -->
				<td width="150">
					<div>
						${comment.nickname }<br>
						<font size="2" color="lightgray">${comment.date }</font>
					</div>
				</td>
		<!-- 본문내용 -->
				<td width="550">
					<div>
						${comment.comment }
					</div>
				</td>
		<!-- 버튼 -->
				<td width="100">
					<div>
		<!-- 댓글 작성자만 수정, 삭제 가능하게 -->
					<c:if test="${comment.nickname == sessionScope.nickname}">
						<a href="CodingFreeModifyAction.cfC">[수정]</a><br>
						<!-- a태그로 자바스크립트 호출하는법 ?  -->
						<a href="CodingFreeDeleteAction.cfC">[삭제]</a>
					</c:if>
					</div>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	
	<!-- 로그인 햇을경우만 댓글 작성 가능 -->
			<c:if test="${sessionScope.sId != null}">
			<tr>
			<form action="CodingFreeCommentWritePro.cfC" id="writeCommentForm" method="post">
				<input type="hidden" name="comment_board" value="${article.num }">
				<input type="hidden" name="comment_nickname" value="${sessionScope.nickname }">
				<input type="hidden" name="nowPage" value="${nowPage }">
				<!--  닉네임 -->
				<td width="150">
					<div>
						${sessionScope.nickname }
					</div>
				</td>
				<!--  본문 작성-->
				<td width="550">
					<div>
						<textarea name="comment_content" rows="4" cols="70" required="required"></textarea>
					</div>
				</td>
				<!--  댓글 등록 -->
				<td width="100">
					<div id="btn">
						<input type="submit" value="댓글작성">
					</div>
				</td>
			</form>
			</tr>
			</c:if>
		
		</table>
	</div>

</body>
</html>