<%@page import="shop.vo.ShopBean"%>
<%@page import="notice.vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sId = null;
	String nickname = null;
	
	// 로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
	if(session.getAttribute("sId") == null) {
		out.println("<script>");
	    out.println("alert('로그인이 필요한 서비스입니다.')");
	    out.println("location.href='LoginForm.me'");
	    out.println("</script>"); 
	 } 
	
	if(!(session.getAttribute("sId").equals("admin"))){// admin 아닐 경우 메세지
		out.println("<script>");
	    out.println("alert('접근권한이 없습니다.')");
	    out.println("location.href='NoticeList.no'");
	    out.println("</script>");
	}else {
		nickname = (String)session.getAttribute("nickname");//admin일 경우 세션 nickname 가져오기
	}
	
	// ShopBean 객체(product) 가져오기
	ShopBean product = (ShopBean)request.getAttribute("shopBean");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
		background: silver;
	}
	
	.td_right {
		width: 300px;
		background: white;
	}
	
	#commandCell {
		text-align: center;
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
	
	<!-- 게시판 글 수정 -->
	<section id="writeForm">
		<h2>상품 수정</h2>
		<form action="ProductModifyPro.ad" method="post" name="boardForm">
			<input type="hidden" name="product_cod" id="product_cod" value=<%=product.getProduct_cod() %> />
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
						<input type="text" name="stock" id="stock" value="<%=product.getStock() %>" required="required" />
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
				<input type="submit" value="수정" onclick="return confirm('상품을 수정하시겠습니까?');"/>&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()" />
			</section>
		</form>	
	</section>
</body>
</html>















