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
<style type="text/css">

	div.shopMain {
		 width: 100%;
	   	 height: 300px;
	   	 text-align: center;
	   	 margin: 0 auto;
	   	 
	}
	
	div.shopMain_Inner {
		float: left;
	    margin: 100px;
	    
	    
	}
	
	#Contents {
    width: 1020px;
    height: 100%;
    margin: 0 auto;
    

</style>
<title>SHOP</title>
</head>
<body>

	<!-- header page -->
		<jsp:include page="../inc/link.jsp"/>	
		<jsp:include page="../inc/top.jsp"/>
		<jsp:include page="../inc/green.jsp"/>
	<!-- header page -->

                    	<div class="gtco-section">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h2>SHOP</h2>
					</div>
				</div>
				
			<div id="Contents">
				 <div class="shopMain">
				 
				 	<div class="shopMain_Inner">
					<a href="PShopList.shop"><img src="./images/point.png" alt="MemberList"><h2>CASH POINT 충전</h2></a>
					</div>
					
					<div class="shopMain_Inner">
					<a href="ShopList.shop"><img src="./images/gifticon.png" alt="ProductList"><h2>기프티콘 교환</h2></a>
					</div>
					
				</div>
			</div>
                            
                           
                  </div>
                </div>



		<!-- footer page -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- footer page -->
		
	</body>

</html>