<%@page import="coding.vo.CodingBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

// 	String nickname = (String)session.getAttribute("nickname");


	// 로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
	/*
	if(session.getAttribute("id") == null) {
		out.println("<script>");
	    out.println("alert('로그인이 필요한 서비스입니다!')");
	    out.println("location.href='LoginForm.me'");
	    out.println("</script>");
	} else { // 로그인 된 상태일 경우 세션 ID 가져오기
		id = (String)session.getAttribute("id");
	}
	*/
	// 전달받은 request 객체에서 데이터 가져오기
	CodingBean article = (CodingBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
// 	int post_num = (int)request.getAttribute("post_num");
	Date today = (Date)request.getAttribute("today");
	
	// PageInfo 객체로부터 페이징 정보 가져오기
// 	PageInfo cmmnt_pageInfo = (PageInfo)request.getAttribute("cmmnt_pageInfo");
// 	int cmmnt_count = cmmnt_pageInfo.getListCount();
// 	int cmmnt_nowPage = cmmnt_pageInfo.getPage(); // page 디렉티브의 이름과 중복되므로 nowPage 라는 변수명으로 사용
// 	int cmmnt_startPage = cmmnt_pageInfo.getStartPage();
// 	int cmmnt_endPage = cmmnt_pageInfo.getEndPage();
// 	int cmmnt_maxPage = cmmnt_pageInfo.getMaxPage();
	
%>    
<!DOCTYPE HTML>
<!--
	Cube by FreeHTML5.co
	Twitter: http://twitter.com/gettemplateco
	URL: http://freehtml5.co
-->
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Do you have any questions?</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,700" rel="stylesheet">

	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>

<body>

		<!-- header page -->
		<jsp:include page="../inc/top.jsp"/>
		<!-- header page -->


		<!-- 게시글 내용 시작 -->
<section class="gtco-section">
		<div class="gtco-container">
			<div class="w3-article">
			 <div class="left-box"> 
					<div class="w3-border w3-padding">
						<i class="fa fa-user"></i> <a href="#"> <%=article.getNickname() %></a><br>
						<i class="fa fa-calendar">
							<%if(article.getDate().compareTo(today)==0){ //날짜가 같으면 %> 
								<td style="width: 20%" id="date"><%=article.getTime()%> <!-- 시간출력 --></td>
							<%}else{ %>
								<td style="width: 20%" id="date"><%=article.getDate()%></td>
							<%} %>
						</i>
						<div class="w3-right">
							<!-- 조회수 --><span><i class="fa fa-eye"></i><%=article.getReadcount() %></span>&nbsp;
							<!-- 추천수 --><i class="fa fa-heart" style="color:red"></i>&nbsp;<span class="rec_count"></span>
							<!-- 댓글수 --><i class="fa fa-commenting-o"  onclick="javascript:openCmmnt();"></i>&nbsp;<span class="reply_count"></span>
						</div>
					</div>
					<div class="w3-border w3-padding">
						No.<%=article.getNum() %> &nbsp;&nbsp;&nbsp; <span class="w3-center w3-xlarge w3-text-blue"><%=article.getSubject() %></span>
					</div>
		<%-- 			<article class="w3-border w3-large w3-padding">${article.content }</article> --%>
					<%if(article.getFile() != null) { %>
						<article class="w3-border w3-large w3-padding article_content">
							<img src="/codingUpload/<%=article.getFile()%>" width=200px >	<br><br><br>
							<%=article.getContent() %> <br><br>
						</article>
					<%}%>
					<div class="w3-border w3-padding">첨부파일: <a href="CodingFileDown.code?file_name=<%=article.getFile()%>" target="blank"><%=article.getFile() %></a></div><br>
				</div>
			</div>
		</div>
</section>

		<!-- 게시글 내용 끝 -->
		
		<!-- header page -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- header page -->
	
</body>
</html>