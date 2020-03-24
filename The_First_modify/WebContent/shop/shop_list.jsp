<%@page import="shop.vo.ShopBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
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
	<section id="listForm">
	<c:if test="${shopList != null }"> 
	<h1>상품 목록</h1>
	<table>
		<tr>
		<c:forEach var="shop" items="${shopList}" varStatus="status">
			<td>
				<a href="ShopView.shop?product_cod=${shop.product_cod}">
					<img src="images/${shop.product_image }" id="productImage" />
				</a><br>
				상품명 : ${shop.product_name }<br>
				가격 : ${shop.price }<br>
			</td>
			<c:if test="${((status.index + 1) mod 4) == 0 }">
		</tr>
		<tr>
			</c:if>
		</c:forEach>
		</tr>
	</table>
	</c:if>	
	<c:if test="${shopList == null }">
		<div class="div_empty">상품 목록이 없습니다.</div>
	</c:if>
	<c:if test="${todayImageList != null }">
		<div id="todayImageList">
			<h2>오늘 본 상품 목록</h2>
			<table>
				<tr>
				<c:forEach var="todayImage" items="${todayImageList }" varStatus="status">
					<td>
						<img src="images/${todayImage }" id="todayImage"/>
					</td>
					<c:if test="{((status.index + 1) mod 4) == 0}">
					</tr>
					<tr>
					</c:if>					
				</c:forEach>
				</tr>
			</table>
		</div>
	</c:if>
	 <a href="ShopRegistForm.shop">등록</a>
	</section>
</body>
</html>
















