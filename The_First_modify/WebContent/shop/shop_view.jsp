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
	#viewForm {
		width: 640px;
		border: 1px solid gray;
		margin: auto;
	}
	
	h1 {
		text-align: center;
	}
	
	h2 {
		text-align: center;
	}
	
	img {
		width: 280px;
		height: 280px;
		border: none;
	}
	
	#content_main {
		height: 300px;
	}
	
	#content_left {
		width: 300px;
		float: left;
	}
	
	#content_right {
		width: 340px;
		float: left;
	}
	
	#commandList {
		text-align: center;
	}
	
	#desc {
		height: 150px;
		background: skyblue;
	}
	
</style>


</head>
<body>
		<!-- header page -->
<%-- 		<jsp:include page="../inc/link.jsp"/> --%>
		<jsp:include page="../inc/top.jsp"/>
<%-- 		<jsp:include page="../inc/green.jsp"/> --%>
		<!-- header page -->
	<section id="viewForm">
		<h2>${shop.product_name }의 상세정보</h2>
	
		<section id="content_main">
			<section id="content_left">
				<img src="admin/productUpload/${shop.product_image }"/>		
			</section>
			<section id="content_right">
				<b>상품명 : </b> ${shop.product_name } <br>
				
				<c:set var="price" value="${shop.price }"/>
				<b>가격 : </b> <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/> CP<br>
				
				<p id="desc">
					${shop.product_info } <br>
				</p>		
			</section>
			<div style="clear:both"></div>
			<nav id="commandList">
			
			<form action="ShopPayment.shop" method="post">
			<input type="hidden" name="price" value="${shop.price }">
			<input type="hidden" name="barcode" value="${shop.barcode_image }">
			<input type="hidden" name="stock" value="${shop.stock }">
			<input type="hidden" name="purchase_count" value="${shop.purchase_count }">
			<input type="hidden" name="product_cod" value="${shop.product_cod }">
			<input type="submit" value="교환" onclick="return confirm('${shop.price} 포인트가 차감됩니다. 교환하시겠습니까?');">
			
			<a href="ShopList.shop"><input type="button" value="목록"></a>
			</form> 
			
			</nav>
		</section>
	</section>

</body>
</html>
















