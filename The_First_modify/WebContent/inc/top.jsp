<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
	
	<!-- table style -->
	 <link href="css/styles_table.css" rel="stylesheet" />

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	
</head>

<body>
<header class="text-right">
<%

String id=(String)session.getAttribute("sId");
String nickname = (String)session.getAttribute("nickname");
if(id != null){
	%> <%=nickname %>님 | <a href="Logout.me">로그아웃</a> <%
}else{
		%><a href=" LoginForm.me">로그인</a> | 	<a href=" JoinForm.me">회원가입</a><%	
}
%>
	<!-- 	<a href=" Logout.me">로그아웃</a> -->
	</header>
	<div class="gtco-loader"></div>
	
	<div id="page">

		<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">
				
				<div class="row">
					<div class="col-sm-2 col-xs-12">
						<div id="gtco-logo"><a href="index.jsp"><img src="images/logo.png" alt="Free HTML5 Website Template by FreeHTML5.co"></a></div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li class="active"><a href="index.jsp">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li class="has-dropdown">
								<a href="CommunityList.any">Boards</a>
								<ul class="dropdown">
									<li><a href=" JobBoardList.job">취업</a></li>
									<li><a href=" AcademyList.ac">학원추천</a></li>
									<li><a href=" CommunityList.any">자유</a></li>
								</ul>
						</li>
							<li class="has-dropdown">
								<a href="CodingFreeList.cf">CodingQ&A</a>
								<ul class="dropdown">
									<li><a href="CodingFreeList.cf">Free</a></li>
									<li><a href="CodingList.code">Charged</a></li>
								</ul>
							</li>
							<li><a href="NoticeList.no">Notice</a></li>
							<li><a href="ShopList.shop">SHOP</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>
				</div>
				
			</div>
		</nav>

		<header id="gtco-header" class="gtco-cover" role="banner">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						<div class="display-t">
							<div class="display-tc">
								<div class="row">
									<div class="col-md-5 text-center header-img animate-box">
										<img src="images/cube.png" alt="Free HTML5 Website Template by FreeHTML5.co">
									</div>
									<div class="col-md-7 copy animate-box">
										<h1>Make your life simpler, try this for free.</h1>
										<p>A free template hand-crafted by FreeHTML5.co. Visit our site for more awesome templates.</p>
										<p><a href="http://freehtml5.co" target="_blank" class="btn btn-white">Visit FreeHTML5.co</a></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</header>
		</div>
		</body>
		</html>
		<!-- END #gtco-header -->
