<%@page import="notice.vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:if test="${sessionScope.nickname==null }">
    <script type="text/javascript">
		alert("로그인 해주세요");
		location.href="LoginForm.me"
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">
function modify_article(post_num){
	if (confirm("게시글 수정하시겠습니까?") == true){    //확인
// 		location.href="CmmntModifyForm.cf?post_num=${post_num }&comment_num="+comment_num;
	}else{   //취소
		return false;
	}
}

function modify_article(post_num){
	if (confirm("댓글 삭제하시겠습니까?") == true){    //확인
// 		location.href="CmmntDeletePro.cf?post_num=${post_num }&nickname=${sessionScope.nickname }&comment_num="+comment_num;
	}else{   //취소
		return false;
	}
}

</script>
</head>
<body>

		<!-- header page -->
		<jsp:include page="../inc/link.jsp"/>
		<jsp:include page="../inc/top.jsp"/>
		<jsp:include page="../inc/green.jsp"/>
		<!-- header page -->

<section class="gtco-section">

<div class="gtco-container">

<div class="w3-article">
	 <div class="notice-box"> 
			<div class="w3-border w3-padding">
				<i class="fa fa-user"></i> <a href="#">${article.nickname }</a>
				<br>
				<i class="fa fa-calendar">
					<c:if test="${article.date==today}">
							<td>${article.time}</td>
					</c:if>
					<c:if test="${article.date<today}">
							<td id="date">${article.date}</td>
					</c:if>
				</i>
				<div class="w3-right">
					<!-- 조회수 --><span><i class="fa fa-eye"></i>${article.readcount }</span>&nbsp;
				</div>
			</div>
			<div class="w3-border w3-padding">
				No.${article.num }&nbsp;&nbsp;&nbsp; <span class="w3-center w3-xlarge w3-text-blue">${article.subject }</span>
			</div>
<%-- 			<article class="w3-border w3-large w3-padding">${article.content }</article> --%>
				<c:if test="${article.file != null}">
							<article class="w3-border w3-large w3-padding notice_content">
					<img src="/notice/noticeUpload/${article.file }" width=800px >	<br><br><br>
					${article.content } <br><br>
				</article>
					</c:if>
			<div class="w3-border w3-padding">첨부파일: <a href="NoticeFileDown.no?file_name=${article.file }" target="blank">${article.file }</a></div><br>
<!-- 			<div class="check" > 체크</div> -->
			</div>
			<c:if test="${article.nickname == sessionScope.nickname }">
			<div>
<%-- 			    <button type="button" class="btn btn-outline-secondary" onclick="modify_article(${article.num})">글수정</button> --%>
<%-- 			     <button type="button" class="btn btn-outline-secondary" onclick="delete_article(${article.num})">글삭제</button> --%>
		<a href="NoticeModifyForm.no?num=${article.num }"><input type="button" value="수정" ></a>&nbsp;&nbsp;
		<a href="NoticeDeletePro.no?num=${artice.num }"><input type="button" value="삭제" onclick="return confirm('정말로 삭제하시겠습니까?');"></a>&nbsp;&nbsp;
			</div>
			</c:if>
		<br><a href="NoticeList.no"><input type="button" class="btn btn-outline-secondary" value="목록" ></a>
		
	</div>
	</div>
	
	</section>
	

	
	
	
	<!-- header page -->
		<jsp:include page="../inc/bottom.jsp"/>
	<!-- header page -->
	
	
</body>
</html>
















