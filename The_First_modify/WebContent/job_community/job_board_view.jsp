<%@page import="job_community.vo.JobBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<header>
		<!-- 세션ID(sId) 가 없을 경우 로그인(LoginForm.me), 회원가입(JoinForm.me) 링크 표시 -->
		<!-- 세션ID(sId) 가 있을 경우 회원ID, 로그아웃(Logout.me)링크 표시 -->
		<%if(sId == null) {%>
			<a href="LoginForm.me">로그인</a> | <a href="JoinForm.me">회원가입</a>
		<%} else { %>
			<%=sId %>님 | <a href="Logout.me">로그아웃</a>
		<%} %>
	</header>
	
	<!-- 게시판 글 조회 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제목 : <%=article.getBoard_subject() %><br>
			작성자 : <%=article.getBoard_nickname() %><br>
			조회수 : <%=article.getBoard_readcount() %><br>
		</section>
		<section id="articleContentArea">
			내용 : <%=article.getBoard_content() %>	
		</section>
	</section>
	<section id="commandList">
		<a href="JobBoardModifyForm.job?board_num=<%=article.getBoard_num()%>&page=<%=nowPage %>"><input type="button" value="수정" ></a>
		<a href="JobBoardDeleteForm.job?board_num=<%=article.getBoard_num()%>&page=<%=nowPage %>"><input type="button" value="삭제" ></a>
		<a href="JobBoardList.job?page=<%=nowPage %>"><input type="button" value="목록" ></a>
	</section>

</body>
</html>