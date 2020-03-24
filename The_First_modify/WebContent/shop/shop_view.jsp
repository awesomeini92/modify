<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
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
	<section id="viewForm">
		<h2>${shop.product_name }의 상세정보</h2>
	
		<section id="content_main">
			<section id="content_left">
				<img src="images/${shop.product_image }"/>		
			</section>
			<section id="content_right">
				<b>상품명 : </b> ${shop.product_name } <br>
				<b>가격 : </b> ${shop.price } <br>
				<p id="desc">
					<b>내용 : </b> ${shop.product_info } <br>
				</p>		
			</section>
			<div style="clear:both"></div>
			<nav id="commandList">
				<a href="ShopList.shop">쇼핑계속하기</a>
				<a href="ShopCartAdd.shop?id=${shop.product_image }">장바구니담기</a>
			</nav>
		</section>
	</section>

</body>
</html>
















