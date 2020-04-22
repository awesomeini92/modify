<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<h2>SHOP 메인</h2>
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p> -->
					</div>
				</div>
				 <div class="">
				 
				
				 
                            <h2><a href="PShopList.shop">포인트 구매</a></h2>
							<h2><a href="ShopList.shop">기프티콘 교환</a></h2>
		
                            
                           
                            </div>
                        </div>
                    </div>



		<!-- footer page -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- footer page -->
		
	</body>

</html>