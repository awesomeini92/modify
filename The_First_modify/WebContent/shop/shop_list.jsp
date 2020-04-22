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

	<!-- header page -->
		<jsp:include page="../inc/top.jsp"/>
		<jsp:include page="../inc/green.jsp"/>
		<jsp:include page="../inc/link.jsp"/>	
	<!-- header page -->

		<div class="gtco-section">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
					
					<div>
					
					<h2>기프티콘 SHOP</h2>
					</div>
						
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p> -->
					</div>
				</div>
				 <div class="">
				 
				 
				 	<section id="listForm">
	<c:if test="${shopList != null }"> 
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
				<ul>
				</ul>
			</c:if>
			</c:forEach>
		</tr>
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 		<tr> -->
<%-- 			<c:forEach var="shop" items="${shopList}" varStatus="status"> --%>
<!-- 				<td> -->
<%-- 					<a href="ShopView.shop?product_cod=${shop.product_cod}"> --%>
<%-- 					<img src="admin/productUpload/${shop.product_image }" id="productImage" /> --%>
<!-- 					</a><br> -->
<%-- 					${shop.product_name }<br> --%>
<%-- 					<c:set var="price" value="${shop.price }"/> --%>
<%-- 					<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />CP --%>
<!-- 				</td> -->
<%-- 			<c:if test="${((status.index + 1) mod 4) == 0 }"> --%>
<!-- 				<tr> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>
<%-- 			</c:forEach> --%>
<!-- 		</tr> -->
	</table>
	</c:if>	
	<c:if test="${shopList == null }">
		<div class="div_empty">상품 목록이 없습니다.</div>
	</c:if>

	</section>
				 
				 
		
                           
                            </div>
                        </div>
                    </div>



		<!-- footer page -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- footer page -->
		
	</body>


</html>










