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
<title>상품목록 및 추가</title>
<style type="text/css">
	#listForm {
		width:640px;
		border: 1px solid gray;
		margin: auto;
	}
	
	h1 {
		text-align: center;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 550px
	}
	
	.tr_top {
		background-color: lime;
	}
	
	.tr_top td {
		text-align: center;
	}
	
	.tr_list td {
		text-align: center;
	}
	
	.tr_list a:link,a:visited,a:hover,a:active {
		text-decoration: none;
		color: black;
	}
	
	.tr_command {
		text-align: center;
	}
	
	.div_empty {
		background-color: gray;
		text-align: center;		 
	}
	
	#todayImageList {
		text-align: center;
	}
	
	#productImage {
		width: 150px;
		height: 150px;
		border: none;
	}
	
	#cartImage {
		width: 70px;
		height: 70px;
		border: none;
	}
	
	#select {
		text-align: right;
	}
	
	#commandList {
		text-align: center;
	}
	
	#upImage {
		width: 15px;
	}
	
	#downImage {
		width: 15px;
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
<h1>상품목록 및 추가</h1>
	<section id="listForm">
	<c:if test="${shopList != null }"> 
		<h2>상품목록</h2>
<!-- 		<form method="post" id="listForm"> -->
			<table>
				<tr class="tr_top">
					<td>상품코드</td>
					<td>상품명</td>
					<td>가격</td>
					<td>상품재고량</td>
					<td>상품판매량</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
				
				<c:forEach var="product" items="${shopList}" varStatus="status">

				<tr class="tr_list">
					<td>
						${product.product_cod }
					</td>
					<td>
						${product.product_name }
					</td>
					<td>
						${product.price }
					</td>
					<td>
						${product.stock }
					</td>
					<td>
						${product.purchase_count }
					</td>
					<td><input type="button" value="수정" onclick="location.href='ProductModifyForm.ad';"></td>
					<td><input type="button" value="삭제" onclick="location.href='ProductDeletePro.ad';"></td>
				</tr>
				</c:forEach>
			</table>
			</c:if>	
<!-- 		</form> -->




	<c:if test="${cartList = null }">
		<section class="div_empty">상품 정보가 없습니다. </section>
	</c:if>	
	
	<nav id="commandList">
		<a href="ProductRegistForm.ad">상품등록</a>
	</nav>
	
	</section>

</body>
</html>