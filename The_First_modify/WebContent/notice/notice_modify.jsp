<%@page import="notice.vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = null;
String nickname = null;

// 로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
if(session.getAttribute("sId") == null) {
	out.println("<script>");
    out.println("alert('로그인이 필요한 서비스입니다.')");
    out.println("location.href='LoginForm.me'");
    out.println("</script>"); 
 } 

if(!(session.getAttribute("sId").equals("admin"))){// admin 아닐 경우 메세지
	out.println("<script>");
    out.println("alert('접근권한이 없습니다.')");
    out.println("location.href='NoticeList.no'");
    out.println("</script>");
}else {
	nickname = (String)session.getAttribute("nickname");//admin일 경우 세션 nickname 가져오기
}
	
	// NoticeBean 객체(article) 가져오기
	NoticeBean article = (NoticeBean)request.getAttribute("article");
	//page 파라미터 값 가져오기(page 식별자 지정 불가) => page 디렉티브 때문에 JSP의 예약어로 취급됨
	String nowPage = request.getParameter("page");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style type="text/css">
	#registForm {
		width: 500px;
		height: 610px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 450px;
		border: 1px solid darkgray;
	}
	
	textarea {
		resize: none;
	}
	
	.td_left {
		width: 150px;
		background: silver;
	}
	
	.td_right {
		width: 300px;
		background: white;
	}
	
	#commandCell {
		text-align: center;
	}

</style>
</head>
<body>
	<header>
		<%if(nickname == null) {  %>
			<a href="LoginForm.me">로그인</a> | <a href="JoinForm.me">회원가입</a>
		<%} else { %>
			${nickname }님  | <a href="Mypage.me">마이페이지</a> | <a href="Logout.me">로그아웃</a>
		<%} %>
	</header>
	
	<!-- 게시판 글 수정 -->
	<section id="writeForm">
		<h2>게시판 글 수정</h2>
		<form action="NoticeModifyPro.no" method="post" name="boardForm">
			<input type="hidden" name="num" value="<%=article.getNum() %>" />
			<input type="hidden" name="page" value="<%=nowPage%>" />
			<table>
				<tr>
					<!-- label 태그를 사용하여 해당 레이블 클릭 시 for 속성에 지정된 이름과 같은 id 속성을 갖는 텍스트필드로 커서 요청 -->
					<td class="td_left"><label for="nickname">닉네임</label></td>
					<td class="td_right">
						<!-- 글쓴이는 편집 불가능하도록 설정 -->
						<input type="text" name="nickname" id="nickname" value="<%=article.getNickname() %>" required="required" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="subject">제목</label></td>
					<td class="td_right">
						<input type="text" name="subject" id="subject" value="<%=article.getSubject() %>" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="content">내용</label></td>
					<td class="td_right"><textarea name="content" id="content" cols="40" rows="15" required="required" ><%=article.getContent() %></textarea></td>
				</tr>
				
				
			</table>
			<section id="commandCell">
				<input type="submit" value="수정" />&nbsp;&nbsp;
				<input type="button" value="목록" onclick="history.back()" />
			</section>
		</form>	
	</section>
</body>
</html>















