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
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style type="text/css">
	#registForm {
		width: 500px;
		height: 500px;
		border: 1px solid black;
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
	<section id="registForm">
		<header>
			<h2>상품 등록</h2>
		</header>
		<form action="ProductRegistPro.ad" method="post" enctype="multipart/form-data" name="registForm">
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
					<td class="td_left"><label for="product_info">설명</label></td>
					<td class="td_right" >
						<textarea rows="13" cols="40" name="product_info" id="product_info" required="required"></textarea>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="product_image">이미지</label></td>
					<td class="td_right"><input type="file" name="product_image" id="product_image" required="required"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="product_image">바코드이미지</label></td>
					<td class="td_right"><input type="file" name="product_image" id="product_image" required="required"/></td>
				</tr>
				<tr>
					<td colspan="2" id="commandCell">
						<input type="submit" value="등록" onclick="return confirm('상품을 등록하시겠습니까?');"/>
						<input type="reset" value="다시작성"/>
						<input type="button" value="목록" onclick="location.href='ProductList.ad'"/>
					</td>
			</table>
		</form>
	</section>
</body>
</html>















