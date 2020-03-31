<%@page import="java.io.PrintWriter"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  --%>
<%
   String nickname = null;
   
   if (session.getAttribute("nickname") != null) {
      nickname = (String)session.getAttribute("nickname");
   }
%>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>
<header>
<%if(nickname == null) {  %>
   <a href="LoginForm.me">로그인</a> | <a href="JoinForm.me">회원가입</a>
<%} else { %>
   ${nickname }님  | <a href="Mypage.me">마이페이지</a> | <a href="Logout.me">로그아웃</a>
<%} %>
</header>

<nav class="gtco-nav" role="navigation">
         <div class="gtco-container">
            
            <div class="row">
               <div class="col-sm-2 col-xs-12">
                  <div id="gtco-logo"><a href="index.jsp"><img src="images/logo.png" alt="Free HTML5 Website Template by FreeHTML5.co"></a></div>
               </div>
               <div class="col-xs-10 text-right menu-1">
                  <ul>
                     <li class="active"><a href="index.jsp">Home</a></li>
                     <li><a href="NoticeList.no">공지사항</a></li>
                     <li class="has-dropdown">
                        <a href="CommunityList.any">커뮤니티</a>
                        <ul class="dropdown">
                           <li><a href="CommunityList.any">자유게시판</a></li>
                           <li><a href="JobBoardList.job">취업게시판</a></li>
                           <li><a href="AcademyList.ac">학원추천</a></li>
                        </ul>
                     </li>
                     <li class="has-dropdown">
                        <a href="CodingFreeList.code">Coding Q&A</a>
                        <ul class="dropdown">
                           <li><a href="CodingFreeList.code">무료게시판</a></li>
                           <li><a href="CodingList.code">유료게시판</a></li>
                        </ul>
                     </li>
                     <li><a href="portfolio.html">Shop</a></li>
                     <li><a href="portfolio.html">Portfolio</a></li>
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
                              <h1>코딩 공부를 시작해요</h1>
                              <p>코딩 공부를 하면서 궁금했던 것들을 자유롭게 물어보고 답변해 보세요</p>
                              <p><a href="CodingFreeList.code" class="btn btn-white">질문하기</a></p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <!-- END #gtco-header -->

      <footer id="gtco-footer" class="gtco-section" role="contentinfo">
         <div class="gtco-container">
            <div class="row row-pb-md">
               <div class="col-md-8 col-md-offset-2 gtco-cta text-center">
                  <h3>커뮤니티 이용관련 문의하기</h3>
                  <p><a href="#" class="btn btn-white btn-outline">Contact Us</a></p>
               </div>
            </div>
            <div class="row row-pb-md">
               <div class="col-md-4 gtco-widget gtco-footer-paragraph">
                  <h3>Cube</h3>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod.</p>
               </div>
               <div class="col-md-4 gtco-footer-link">
                  <div class="row">
                     <div class="col-md-6">
                        <ul class="gtco-list-link">
                           <li><a href="index.jsp">Home</a></li>
                           <li><a href="CommunityList.any">커뮤니티</a></li>
                           <li><a href="CodingFreeList.code">coding Q&A</a></li>
                           <li><a href="ShopList.shop">Shop</a></li>
                        </ul>
                     </div>
                     <div class="col-md-6">
                        <p>
                           <a href="tel://1234567890">+1 234 4565 2342</a> <br>
                           <a href="#">info@domain.com</a>
                        </p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 gtco-footer-subscribe">
                  <form class="form-inline">
                    <div class="form-group">
                      <label class="sr-only" for="exampleInputEmail3">Email address</label>
                      <input type="email" class="form-control" id="" placeholder="Email">
                    </div>
                    <button type="submit" class="btn btn-primary">Send</button>
                  </form>
               </div>
            </div>
         </div>
         <div class="gtco-copyright">
            <div class="gtco-container">
               <div class="row">
                  <div class="col-md-6 text-left">
                     <p><small>&copy; 2016 Free HTML5. All Rights Reserved. </small></p>
                  </div>
                  <div class="col-md-6 text-right">
                     <p><small>Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://pixeden.com/" target="_blank">Pixeden</a> &amp; <a href="http://unsplash.com" target="_blank">Unsplash</a></small> </p>
                  </div>
               </div>
            </div>
         </div>
      </footer>

   </div>

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