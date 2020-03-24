<%@page import="coding.vo.PageInfo"%>
<%@page import="coding.vo.CodingBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<CodingBean> articleList = (ArrayList<CodingBean>)request.getAttribute("articleList");
	Date today = (Date)request.getAttribute("today");
	
	
	
%>  
<!DOCTYPE HTML>
<!--
	Cube by FreeHTML5.co
	Twitter: http://twitter.com/gettemplateco
	URL: http://freehtml5.co
-->
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Do you have any questions?</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />

	<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,700" rel="stylesheet">
	
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

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	
		<!-- header page -->
		<jsp:include page="inc/top.jsp"/>
		<!-- header page -->

		<div class="gtco-services gtco-section">
			<div class="gtco-container">
				<div class="row row-pb-sm">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h2>Make your life simpler.</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p>
						<p><a href="https://vimeo.com/channels/staffpicks/93951774" class="btn btn-special popup-vimeo">Watch The Video</a></p>
					</div>
				</div>
				<div class="row row-pb-md">
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-pie-chart"></i> Marketing</h3>
							
						</div>
					</div>
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service animate-change">
							<h3><i class="ti-ruler-pencil"></i> Design</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima quidem quae, assumenda dolores ad pariatur! Deleniti debitis, voluptatem! Omnis enim magnam perspiciatis, natus. Ipsum distinctio, voluptatibus vero laboriosam sequi! Officia fuga quam eveniet quo similique!</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-settings"></i> Development</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta aperiam, maiores officia alias accusantium fugiat, doloremque voluptas, voluptatem dolore vel animi praesentium saepe unde consequuntur, eum asperiores odit aliquam error nulla impedit repellendus. Nesciunt, delectus.</p>
						</div>
					</div>

					<div class="clearfix visible-md-block visible-sm-block"></div>

				</div>
			</div>
		</div>
		<!-- END .gtco-services -->

		<div class="gtco-section gtco-products">
			<div class="gtco-container">
				<div class="row row-pb-sm">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h2>Popular Products</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p>
					</div>
				</div>
				<div class="row row-pb-md">
					<div class="col-md-4 col-sm-4">
						<a href="#" class="gtco-item two-row bg-img animate-box" style="background-image: url(images/img_1.jpg)">
							<div class="overlay">
								<i class="ti-arrow-top-right"></i>
								<div class="copy">
									<h3>Paper Hot Cup</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
								</div>
							</div>
							<img src="images/img_1.jpg" class="hidden" alt="Free HTML5 Website Template by FreeHTML5.co">
						</a>
						<a href="#" class="gtco-item two-row bg-img animate-box" style="background-image: url(images/img_2.jpg)">
							<div class="overlay">
								<i class="ti-arrow-top-right"></i>
								<div class="copy">
									<h3>Notepad Mockup</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
								</div>
							</div>
							<img src="images/img_2.jpg" class="hidden" alt="Free HTML5 Website Template by FreeHTML5.co">
						</a>
					</div>
					<div class="col-md-4 col-sm-4">
						<a href="#" class="gtco-item one-row bg-img animate-box" style="background-image: url(images/img_md_1.jpg)">
							<div class="overlay">
								<i class="ti-arrow-top-right"></i>
								<div class="copy">
									<h3>Paper Pouch</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
								</div>
							</div>
							<img src="images/img_md_1.jpg" class="hidden" alt="Free HTML5 Website Template by FreeHTML5.co">
						</a>
					</div>
					<div class="col-md-4 col-sm-4">
						<a href="#" class="gtco-item two-row bg-img animate-box" style="background-image: url(images/img_3.jpg)">
							<div class="overlay">
								<i class="ti-arrow-top-right"></i>
								<div class="copy">
									<h3>Fancy 3D</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
								</div>
							</div>
							<img src="images/img_3.jpg" class="hidden" alt="Free HTML5 Website Template by FreeHTML5.co">
						</a>
						<a href="#" class="gtco-item two-row bg-img animate-box" style="background-image: url(images/img_4.jpg)">
							<div class="overlay">
								<i class="ti-arrow-top-right"></i>
								<div class="copy">
									<h3>Hard Cover Book</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
								</div>
							</div>
							<img src="images/img_4.jpg" class="hidden" alt="Free HTML5 Website Template by FreeHTML5.co">
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
					<p><a href="http://freehtml5.co" target="_blank" class="btn btn-special">Visit Gettemplates.co</a></p>
					</div>
				</div>
			</div>
		</div>
		<!-- END .gtco-products -->

		<div class="gtco-section gtco-testimonial gtco-gray">
			<div class="gtco-container">

				<div class="row row-pb-sm">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h2>People Love Us</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div><img src="images/person_1.jpg" alt="Free Website template by FreeHTML5.co"></div>
							<blockquote>
								<p>&ldquo;Design must be functional and functionality must be translated into visual aesthetics, without any reliance on gimmicks that have to be explained.&rdquo; <cite class="author">&mdash; Ferdinand A. Porsche</cite></p>
							</blockquote>	
						</div>
					</div>

					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div><img src="images/person_2.jpg" alt="Free Website template by FreeHTML5.co"></div>
							<blockquote>
								<p>&ldquo;Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn’t really do it, they just saw something. It seemed obvious to them after a while.&rdquo; <cite class="author">&mdash; Steve Jobs</cite></p>
							</blockquote>	
						</div>
					</div>

					
				</div>
				<div class="row">
					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div><img src="images/person_3.jpg" alt="Free Website template by FreeHTML5.co"></div>
							<blockquote>
								<p>&ldquo;I think design would be better if designers were much more skeptical about its applications. If you believe in the potency of your craft, where you choose to dole it out is not something to take lightly.&rdquo; <cite class="author">&mdash; Frank Chimero</cite></p>
							</blockquote>	
						</div>
					</div>

					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div><img src="images/person_1.jpg" alt="Free Website template by FreeHTML5.co"></div>
							<blockquote>
								<p>&ldquo;Design must be functional and functionality must be translated into visual aesthetics, without any reliance on gimmicks that have to be explained.&rdquo; <cite class="author">&mdash; Ferdinand A. Porsche</cite></p>
							</blockquote>	
						</div>
					</div>
				</div>
			</div>
		</div>
		

		<!-- footer page -->
		<jsp:include page="inc/bottom.jsp"/>
		<!-- footer page -->


	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

