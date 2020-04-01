<%@page import="java.io.PrintWriter"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String nickname = null;
	
	if (session.getAttribute("nickname") != null) {
		nickname = (String)session.getAttribute("nickname");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<style type="text/css">
	header {
	text-align: right;
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
<h1>관리자 페이지</h1>
<h1><a href="ProductList.ad">상품목록 및 추가 </a></h1>
<h1><a href="BuyList.ad">주문목록</a></h1>
</body>
</html>