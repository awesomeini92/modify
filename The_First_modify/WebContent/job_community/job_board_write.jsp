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
	<section id="writeForm">
		<h2>게시판 글 등록</h2>
		<form action="JobBoardWritePro.job" method="post" enctype="multipart/form-data" name="boardform">
			<table>
				
				<tr>
					<!-- label 태그를 사용하여 해당 레이블 클릭 시 for 속성에 지정된 이름과 같은 id 속성을 갖는 텍스트필드로 커서 요청 -->
					<td class="td_left"><label for="job_board_nickname">글쓴이</label></td>
					<td class="td_right"><input type="text" name="board_name" id="board_name" required="required" /></td>
				</tr>
				
				<tr>
					<td class="td_left"><label for="job_board_subject">제목</label></td>
					<td class="td_right"><input type="text" name="board_subject" id="board_subject" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="job_board_content">내용</label></td>
					<td class="td_right"><textarea name="board_content" id="board_content" cols="40" rows="15" required="required" ></textarea></td>
				</tr>
				
			</table>
			<section id="commandCell">
				<input type="submit" value="등록" />&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" />
				<input type="button" value="글쓰기 취소" onclick="location.href='jobList.job'">
			</section>
		</form>	
	</section>
	
	

</body>
</html>