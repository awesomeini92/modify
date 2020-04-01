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

	// 전달받은 request 객체로부터 게시물 번호(board_num)와 페이지번호(page) 가져오기
    int board_num = Integer.parseInt(request.getParameter("board_num"));
    String nowPage = request.getParameter("page");
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
	
	<section id="passForm">
		<form name="deleteForm" action="JobBoardDeletePro.job?board_num=<%=board_num %>&page=<%=nowPage %>" method="post">
<%-- 			<input type="hidden" name="board_num" value="<%=board_num %>" /> --%>
<%-- 			<input type="hidden" name="page" value="<%=nowPage %>" /> --%>
			
			<table>
				<tr>
					<td>
						<label>게시글을 삭제하시겠습니까?</label><br>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="삭제" />
						&nbsp;&nbsp;<input type="reset" value="돌아가기" onclick="history.back()"/>
					</td>
				</tr>
			</table>
		</form>
	</section>
	
</body>
</html>