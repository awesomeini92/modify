<%@page import="shop.vo.ShopBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.nickname==null }">
    <script type="text/javascript">
		alert("로그인 해주세요");
		location.href="LoginForm.me"
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOP</title>

<style type="text/css">
	#viewForm {
		border: 1px solid gray;
		margin: auto;
	}
</style>

</head>
<body>

		<!-- header page -->
		<jsp:include page="../inc/link.jsp"/>
		<jsp:include page="../inc/top.jsp"/>
		<jsp:include page="../inc/green.jsp"/>
		<!-- header page -->

<form action="PShopPayment.shop" method="post">

<input type="hidden" name="name" value="point">
<input type="hidden" name="nickname" value="${sessionScope.nickname }">

<h3>충전 포인트</h3>

<section id="viewForm">   
<ul>
   <li>
     <input type="radio" name="price" value="100">100 point
   </li>
   <li>
     <input type="radio" name="price" value="3000">3,000 point
   </li>
   <li>
     <input type="radio" name="price" value="5000">5,000 point
   </li>
   <li>
     <input type="radio" name="price" value="10000">10,000 point
   </li>
</ul>
</section>

<input type="submit" value="결제" onclick="return confirm('결제하시겠습니까?');">
</form>
</body>
</html>
















