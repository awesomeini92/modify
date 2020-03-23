<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sId = null;
	// 로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
	if(session.getAttribute("sId") == null) {
		out.println("<script>");
	    out.println("alert('로그인이 필요한 서비스입니다!')");
	    out.println("location.href='LoginForm.me'");
	    out.println("</script>");
	} else { // 로그인 된 상태일 경우 세션 ID 가져오기
		sId = (String)session.getAttribute("sId");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style type="text/css">
	#registForm {
		width: 500px;
		height: 500px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 450px;
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
	
</style>
</head>
<body>
	<section id="registForm">
		<header>
			<h2>상품 정보 등록</h2>
		</header>
		<form action="ShopRegist.shop" method="post" enctype="multipart/form-data" name="registForm">
			<table>
				<tr>
					<td class="td_left"><label for="product_cod">상품코드</label></td>
					<td class="td_right"><input type="text" name="product_cod" id="product_cod" required="required"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="product_name">상품명</label></td>
					<td class="td_right"><input type="text" name="product_name" id="product_name" required="required"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="price">가격</label></td>
					<td class="td_right"><input type="text" name="price" id="price" required="required"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="stock">재고</label></td>
					<td class="td_right"><input type="text" name="stock" id="stock" required="required"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="content">설명</label></td>
					<td class="td_right">
						<textarea rows="13" cols="40" name="content" id="content"></textarea>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="product_image">이미지</label></td>
					<td class="td_right"><input type="file" name="product_image" id="product_image"/></td>
				</tr>
				<tr>
					<td colspan="2" id="commandCell">
						<input type="submit" value="등록"/>
						<input type="reset" value="다시작성"/>
						<input type="button" value="목록보기" onclick="location.href='ShopList.dog'"/>
					</td>
			</table>
		</form>
	</section>
</body>
</html>















