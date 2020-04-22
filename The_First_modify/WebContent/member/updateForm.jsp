<%@page import="member.vo.MemberBean"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	MemberBean mb = (MemberBean)request.getAttribute("mb");
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>My Page</title>

    <!-- Icons font CSS-->
    <link href="regform/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="regform/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="regform/https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="regform/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="regform/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="regform/css/main.css" rel="stylesheet" media="all">
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	
	// 비밀번호 정규표현식 확인 
	 // 8~16자리 영문,숫자 조합
	 	function checkPassword(password) {
		 	const lengthRegex = /^[A-Za-z0-9]{8,16}$/;
		 	const englishCaseRegex = /[A-Za-z]/;
		 	const digitRegex = /[0-9]/;
		 	
		 	var element = document.querySelector('#checkPasswordResult');
		 	if (lengthRegex.exec(password.value) && englishCaseRegex.exec(password.value) 
		 			&& digitRegex.exec(password.value)) {
				element.innerHTML = "적합한 Password";
			} else {
				element.innerHTML = "부적합한 Password";
			}
	 	}
    </script>
    
</head>

<body>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790" style="margin-top:200px">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Edit Information</h2>
                </div>
                <div class="card-body">
                    <form method="POST" action="UpdatePro.me" id="form">
                        <div class="form-row m-b-55">
                            <div class="name">ID</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="id" value="${mb.id }" readonly="readonly">
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">Nickname</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="nickname" value="${mb.nickname }" required="required">
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">Password</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="password" name="password" required="required" placeholder="8~16 영문,숫자 조합" onkeyup="checkPassword(this)">
                                        	<span id="checkPasswordResult"></span>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">Email</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <input class="input--style-5" type="email" name="email" value="${mb.email}" required="required">
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row m-b-55">
                            <div class="name">CP</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="cp" value="${mb.cp }" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">LP</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="lp" value="${mb.lp }" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">Level</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="level" value="${mb.level }" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row m-b-55">
                            <div class="name">Date</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="date" value="${mb.date }" readonly="readonly">
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                       
                        <div style="text-align:center;">
                            <button class="btn btn--radius-2 btn--red" type="submit"> 수   정 </button>
                            <button class="btn btn--radius-2 btn--red" onClick="location.href='<c:url value="MemberDelete.me"/>'"> 탈   퇴 </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="regform/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="regform/vendor/select2/select2.min.js"></script>
    <script src="regform/vendor/datepicker/moment.min.js"></script>
    <script src="regform/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->