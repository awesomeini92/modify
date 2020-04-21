<%@page import="job_community.vo.JobBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String sId = null;
	// 로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
	if(session.getAttribute("sId") == null) {
		out.println("<script>");
	    out.println("alert('로그인이 필요한 서비스입니다!')");
	    out.println("location.href='LoginForm.me'");
	    out.println("</script>");
	} else { // 로그인 된 상태일 경우 세션 ID 가져오기
		sId = (String)session.getAttribute("sId");
	}
	
	// 전달받은 request 객체에서 데이터 가져오기
	JobBoardBean article = (JobBoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function modify_article(num){  
	if (confirm("수정하시겠습니까?") == true){    //확인
		location.href="CodingModifyForm.code?num="+num;
	}else{
			return false;
		}
}


function delete_article(post_num){  
	if (confirm("삭제하시겠습니까?") == true){    //확인
		location.href="JobBoardDeletePro.job?nickname=${sessionScope.nickname }&num="+num;
	}else{
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
	 <div class="left-box"> 
			<div class="w3-border w3-padding">
				<i class="fa fa-user"></i> <a href="#">${article.nickname }</a>
				<br>
				<i class="fa fa-calendar">
<%-- 					<c:if test="${article.date==today}"> --%>
<%-- 							<td>${article.time}</td> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${article.date<today}"> --%>
							<td id="date">${article.date}</td>
<%-- 					</c:if> --%>
				</i>
				<div class="w3-right">
					<!-- 조회수 --><span><i class="fa fa-eye"></i>${article.readcount }</span>&nbsp;
				</div>
			</div>
			<div class="w3-border w3-padding">
				No.${article.num }&nbsp;&nbsp;&nbsp; <span class="w3-center w3-xlarge w3-text-blue">${article.subject }</span>
			</div>
<%-- 			<article class="w3-border w3-large w3-padding">${article.content }</article> --%>
				
							<article class="w3-border w3-large w3-padding article_content">
							<c:if test="${article.file != null}">
					<img src="job_community/images/${article.file }" width=800px >	<br><br><br>
					</c:if>	
					${article.content } <br><br>
				</article>
															<!-- 수정@@@@ -->
			<div class="w3-border w3-padding">첨부파일: <a href="JobFileDown.job?file_name=${article.file }" target="blank">${article.file }</a></div><br>
<!-- 			<div class="check" > 체크</div> -->
			
			<c:if test="${article.nickname == sessionScope.nickname }">
			<div>
			    <button type="button" class="btn btn-outline-secondary" onclick="modify_article(${article.num})">글수정</button>&nbsp;&nbsp;
			     <button type="button" class="btn btn-outline-secondary" onclick="delete_article(${article.num})">글삭제</button>
			</div>
			</c:if>
		</div>
			
			</div>
			</div>
			</section>
			
	<!-- header page -->
		<jsp:include page="../inc/bottom.jsp"/>
	<!-- header page -->
	
	
</body>
</html>