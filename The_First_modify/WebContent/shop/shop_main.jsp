<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String nickname = (String)session.getAttribute("nickname");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOP</title>
</head>
<body>
<header>
<%if(nickname == null) {  %>
	<a href="LoginForm.me">로그인</a> | <a href="JoinForm.me">회원가입</a>
<%} else { %>
	${nickname }님  | <a href="Mypage.me">마이페이지</a> | <a href="Logout.me">로그아웃</a>
<%} %>
</header>
<h1>SHOP 메인</h1>
<h2><a href="PShopList.shop">포인트 구매</a></h2>
<h2><a href="ShopList.shop">기프티콘 교환</a></h2>

</body>
</html>