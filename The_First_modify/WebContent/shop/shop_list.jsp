<%@page import="shop.vo.ShopBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	#listForm {
		width:700px;
		height: 500px;
		border: 1px solid gray;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 550px
	}
	
	.div_empty {
		background-color: gray;
		width: 100%;
		height: 100%;
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
	
	#todayImage {
		width: 100px;
		height: 100px;
		border: none;
	}
</style>
</head>
<body>
<header>
		
		<!-- header page -->
		<jsp:include page="../inc/link.jsp"/>
		<jsp:include page="../inc/top.jsp"/>
		<jsp:include page="../inc/green.jsp"/>
		<!-- header page -->
	</header>
	<section id="listForm">
	<c:if test="${shopList != null }"> 
	<h1>기프티콘 상품 목록</h1>
	<table>
		<tr>
			<c:forEach var="shop" items="${shopList}" varStatus="status">
				<td>
					<a href="ShopView.shop?product_cod=${shop.product_cod}">
					<img src="admin/productUpload/${shop.product_image }" id="productImage" />
					</a><br>
					${shop.product_name }<br>
					<c:set var="price" value="${shop.price }"/>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />CP
				</td>
			<c:if test="${((status.index + 1) mod 4) == 0 }">
				<tr>
				</tr>
			</c:if>
			</c:forEach>
		</tr>
	</table>
	</c:if>	
	<c:if test="${shopList == null }">
		<div class="div_empty">상품 목록이 없습니다.</div>
	</c:if>

	</section>
	
</body>
</html>










