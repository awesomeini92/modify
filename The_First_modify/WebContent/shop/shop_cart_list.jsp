<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
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
<script type="text/javascript">
	function checkAll(theForm) {
		if(theForm.remove.length == undefined) {
			theForm.remove.checked = theForm.remove.allCheck.checked;	
		} else {
			for(var i = 0; i < theForm.remove.length; i++) {
				theForm.remove[i].checked = theForm.allCheck.checked;
			}
		}
	}
	
	
	function qtyUp(product_cod) {
		var element = document.getElementByProduct_cod("qty"+product_cod);
		if(element.value<99){
		element.value = Number(element.value) + 1;
		}
	}
	
	function qtyDown(product_cod) {
		var element = document.getElementByProduct_cod("qty"+product_cod);
		if(element.value > 1) {
			element.value = Number(element.value) - 1;
		}
	}
	
	function checkQty(qty) {
// 		var element = document.getElementByProduct_cod("totalMoney");
// 		alert(qty);
		if(!(qty >= 1 && qty <= 99)){
			alert("수량을 1~99 사이의 값으로 입력하세요");
		}
	}
	
	function qtyChange(cartProduct_cod){
		var element = document.getElementByProduct_cod("qty"+cartProduct_cod);
		//카트 product_cod 와 수량을 ShopCartQtyChange.shop 서블릿 요청에 포함시켜 이동
		location.href='ShopCartQtyChange.shop?product_cod='+cartProduct_cod+"&qty=" + element.value;
		
		
		
	}
	
	
</script>
</head>
<body>

<c:if test="${startMoney != null }">
	<c:set var="startMoney" value="${startMoney }"></c:set>
</c:if>
<c:if test="${endMoney != null }">
	<c:set var="endMoney" value="${endMoney }"></c:set>
</c:if>
	<section id="listForm">
	<c:if test="${cartList != null && cartList.size() > 0 }">
	
		<h2>장바구니 목록</h2>
		<form method="post" id="cartListForm">
			<table>
				<tr class="tr_top">
					<td>
						<input type="checkbox" id="allCheck" name="allCheck" onclick="checkAll(this.form)" />
					</td>
					<td>번호</td>
					<td>상품 이미지</td>
					<td>상품명</td>
					<td>가격</td>
					<td>수량</td>
				</tr>
			<c:forEach var="cart" items="${cartList}" varStatus="status">
				<tr class="tr_list">
					<td>
						<input type="checkbox" id="remove" name="remove" value="${cart.kind }" />
					</td>
					<td>
						${status.index + 1 } <!-- 번호 계산 -->
					</td>
					<td>
						<img src="images/${cart.product_image }" id="cartImage" />
					</td>
					<td>
						${cart.product_name }
					</td>
					<td>
						${cart.price }
					</td>
					<td>
						<a href="javascript:qtyUp(${cart.product_cod })">▲</a>
						<input type="text" name="qty" id="qty${cart.product_cod }" size="1" value="${cart.qty }" onchange="javacript:checkQty(this)">
						<a href="javascript:qtyDown(${cart.product_cod })">▼</a>
						<input type="button" value="변경" onclick="qtyChange(${cart.product_cod})"/>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" style="text-align: center;" id="totalMoney">총 금액 : ${totalMoney }원</td>
			</tr>
			<tr>
				<td colspan="6" style="text-align: center;">
					<input type="submit" value="선택삭제" formaction="ShopCartRemove.shop" />
				</td>
			</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${cartList = null }">
		<section class="div_empty">상품 정보가 없습니다. </section>
	</c:if>	
	<nav id="commandList">
		<a href="ShopList.shop">쇼핑계속하기</a>
	</nav>
	</section>
</body>
</html>



















