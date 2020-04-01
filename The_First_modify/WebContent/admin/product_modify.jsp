<%@page import="shop.vo.ShopBean"%>
<%@page import="notice.vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nickname = null;

	if (session.getAttribute("nickname") != null) {
	nickname = (String)session.getAttribute("nickname");
	}
	
	// 로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
	if(session.getAttribute("nickname") == null) {
		out.println("<script>");
	    out.println("alert('로그인이 필요한 서비스입니다!')");
	    out.println("location.href='LoginForm.me'");
	    out.println("</script>");
	} else { // 로그인 된 상태일 경우 세션 ID 가져오기
		nickname = (String)session.getAttribute("nickname");
	}

	// ShopBean 객체(product) 가져오기
	ShopBean product = (ShopBean)request.getAttribute("product");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
<style type="text/css">
	#registForm {
		width: 500px;
		height: 610px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 450px;
		border: 1px solid darkgray;
	}
	
	textarea {
		resize: none;
	}
	
	.td_left {
		width: 150px;
		background: orange;
	}
	
	.td_right {
		width: 300px;
		background: skyblue;
	}
	
	#commandCell {
		text-align: center;
	}
	header {
		text-align: right;
	}
</style>
</head>
<body>
	<header>
		<%if(nickname == null) {%>
			<a href="LoginForm.me">로그인</a> | <a href="JoinForm.me">회원가입</a>
		<%} else { %>
			<%=nickname %>님 | <a href="Logout.me">로그아웃</a>
		<%} %>
	</header>
	
	<!-- 게시판 글 수정 -->
	<section id="writeForm">
		<h2>상품 수정</h2>
		<form action="ProductModifyPro.ad" method="post" name="boardForm">
			<input type="hidden" name="num" value="<%=product.getProduct_cod() %>" />
			<table>
				<tr>
					<!-- label 태그를 사용하여 해당 레이블 클릭 시 for 속성에 지정된 이름과 같은 id 속성을 갖는 텍스트필드로 커서 요청 -->
					<td class="td_left"><label for="product_name">상품명</label></td>
					<td class="td_right">
						<input type="text" name="product_name" id="product_name" value="<%=product.getProduct_name() %>" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="price">가격</label></td>
					<td class="td_right">
						<input type="text" name="price" id="price" value="<%=product.getPrice() %>" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="stock">상품재고량</label></td>
					<td class="td_right">
						<input type="text" name="stock" id="stock" value="<%=product.getPrice() %>" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="purchase_count">상품구매량</label></td>
					<td class="td_right">
						<input type="text" name="purchase_count" id="purchase_count" value="<%=product.getPurchase_count() %>" required="required" />
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="수정" />&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()" />
			</section>
		</form>	
	</section>
</body>
</html>















