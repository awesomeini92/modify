<%@page import="java.io.PrintWriter"%>
<%@page import="member.dao.MemberDAO"%>
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

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<body>
<header>
	<%if(nickname == null) {  %>
		<a href="LoginForm.me">로그인</a> | <a href="JoinForm.me">회원가입</a>
	<%} else { %>
		<%=nickname %>님  | <a href="Mypage.me">마이페이지</a> | <a href="Logout.me">로그아웃</a>
	<%} %>
</header>
<h1>관리자 페이지</h1>
<h2><a href="ProductList.ad">상품목록 및 추가 </a></h2>
<h2><a href="BuyList.ad">주문목록</a></h2>
</body>
</html>