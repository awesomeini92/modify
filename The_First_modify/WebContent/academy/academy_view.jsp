
<%@page import="java.util.Date"%>
<%@page import="academy_community.vo.AcademyCommentBean"%>
<%@page import="academy_community.vo.AcademyBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${sessionScope.nickname==null }">
    <script type="text/javascript">
		alert("로그인 해주세요");
		location.href="LoginForm.me"
	</script>
</c:if>
<%
	String nickname = (String)session.getAttribute("nickname");
	// 전달받은 request 객체에서 데이터 가져오기
	AcademyBean article = (AcademyBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
	AcademyCommentBean comment = (AcademyCommentBean)request.getAttribute("comment");
	Date today = (Date)request.getAttribute("today");
// 	String address = article.getAddress();
// 	String aname = article.getAcademy_name();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.4.1.js"> </script>
<script type="text/javascript">
function insert_comment(){
	alert("코멘트 넣기");
	location.href="CmmntWritePro.code?post_num=${post_num }";
}

function delete_article(){
	if (confirm("게시글을 삭제하시겠습니까?") == true){    //확인
		location.href="AcademyDeletePro.ac?num=${article.num }";
	}else{   //취소
		return false;
	}
}
function delete_comment(comment_num){
	if (confirm("댓글 삭제하시겠습니까?") == true){    //확인
		location.href="CmmntDeletePro.cf?post_num=${post_num }&nickname=${sessionScope.nickname }&comment_num="+comment_num;
	}else{   //취소
		return false;
	}
}


function modify_comment(comment_num){
	if (confirm("댓글 수정하시겠습니까?") == true){    //확인
		location.href="CmmntModifyForm.cf?post_num=${post_num }&comment_num="+comment_num;
	}else{   //취소
		return false;
	}
}
$(document).ready(function() {
	getComment(1);
});

		function getComment(nowPage){
			$.ajax({		
    			url: "AcademyCommentList.ac?session_nick=${sessionScope.nickname }", // 요청 url
                type: "POST", // post 방식
                data: {
                	post_num : ${article.num }, // board_no의 값을 넘겨줌
                	nowPage : nowPage
                },
                success : function (json){
                	json = json.replace(/\n/gi,"\\r\\n"); // 개행문자 대체
                	$("#cmmntList").text(""); // 댓글리스트 영역 초기화
                	var obj = JSON.parse(json); // service 클래스로 부터 전달된 문자열 파싱
                	var cmmntList =obj.cmmntList; // replyList는 전달된 json의 키값을 의미
                	var output = ""; // 댓글 목록을 누적하여 보여주기 위한 변수
                	var comment_num ="";
                	var comment_nick ="";

//         			paging(nowPage);
        			
                	output += "<form action='AcademyCommentWritePro.ac?num=${article.num }' method='post'>";
        			output += "<div><input type='text' class='bd_color'  name='nickname' value=${sessionScope.nickname } readonly>";
        			output += "<span class='w3-right'><input type='submit' class='btn btn-success btn-sm' value='댓글등록'></span></div>";
        			output += "<textarea class='form-control' id='exampleTextarea' rows='3' name='comment'></textarea></form>";
        			
					for (var i = 0; i < cmmntList.length; i++) { // 반복문을 통해 output에 누적 
						for (var j = 0; j < cmmntList[i].length; j++) {                	 
	 	                    var cmmnt = cmmntList[i][j];
	 	                    if(j === 0){
	 	                    	comment_num = cmmnt.cmmnt_num;
	 	                    	output += " No."+cmmnt.cmmnt_num+"&nbsp;&nbsp;&nbsp";
// 	 	                    output += "<div class='w3-right'><span>채택하기</span> </div><br>";
	 	                    }else  if(j === 1){
	 	     					output += "<span class='w3-right'> <i class=' fa fa-calendar'></i>" + cmmnt.cmmnt_date +"</span>";
	 	                    }else  if(j === 2){
	 	                    		comment_nick = cmmnt.nickname;
	 	                    		output += "<i class='fa fa-user'></i> <a href='#'> " + cmmnt.nickname +"</a>&nbsp;&nbsp;&nbsp";    
// 	 	     					output += "<div class='w3-right'><span><i class='fa fa-eye'></i>"+reply.readcount+"</span>&nbsp;";
// 	 	     					output += "<i class='fa fa-heart' style='color:red'></i>&nbsp;<span class='rec_count'></span>";
	 	                    }else  if(j === 3){
	 	                    	var session_nick = cmmnt.session_nick;
		                    	 if(session_nick===comment_nick){
		      						output += "<class='w3-right'><input type='button' class='btn btn-secondary btn-sm' value='댓글수정' onclick='modify_comment("+comment_num+");'></button>"; 
		      						output += "<input type='button' class='btn btn-secondary btn-sm' value='댓글삭제' onclick='delete_comment("+comment_num+");'>";
		      					}
	 	                    }else  if(j === 4){
	 	                    	output += "<div class='w3-border right-box_padding'>"+cmmnt.comment; //+"<br><br></article>"
			                    output += "</div>";
							}
	 	                    
	   	                 	}
	   	                 }
						output += "<div class='dataTables_paginate paging_simple_numbers pageList' id='dataTable_paginate'''>"
	  	              	$("#acList").html(output);

	   	             }
			});
		}

		
</script> 

</head>
<body>
<header>
		<!-- header page -->
		<jsp:include page="../inc/link.jsp"/>
		<jsp:include page="../inc/top.jsp"/>
<%-- 		<jsp:include page="../inc/green.jsp"/> --%>
		<!-- header page -->
</header>
	
	
	<!-- 게시판 글 조회 -->
	<section class="gtco-section">
	
<div class="gtco-container">
<div class="w3-article">
	 <div class="left-box"> 
			<div class="w3-border w3-padding">
				<i class="fa fa-user"></i> <a href="#">${article.nickname }</a>
				<br>
				<i class="fa fa-calendar">
					<c:if test="${article.date==today}">
							<td>${article.time}</td>
					</c:if>
					<c:if test="${article.date<today}">
							<td id="date">${article.date}</td>
					</c:if>
				</i>
				<div class="w3-right">
					<!-- 조회수 --><span><i class="fa fa-eye"></i>${article.readcount }</span>&nbsp;
				</div>
			</div>
			<div class="w3-border w3-padding">
				No.${article.num }&nbsp;&nbsp;&nbsp; <span class="w3-center w3-xlarge w3-text-blue">${article.subject }</span>
			</div>
<%-- 			<article class="w3-border w3-large w3-padding">${article.content }</article> --%>
							<article class="w3-border w3-large w3-padding academy_content">${article.content } <br><br>
				</article>
			<div class="w3-border w3-padding">	<h3 style="text-align:center">Academy Information</h3>
<!-- 			<div class="form-group"> -->
				    <label class="control-label" for="readOnlyInput">Address</label>
				    <input class="form-control" id="address" type="text" value="${article.address }" readonly="">
				     <label class="control-label" for="readOnlyInput">Academy Name</label>
				    <input class="form-control" id="address" type="text" value="${article.academy_name }" readonly=""><br><br>
					<div id="map" style="margin:0 auto; width:450px;height:350px;"></div><br>
			</div>

<!-- 	 <a href="javascript:getReplyListCount()">답글보기</a> -->
<!-- 	 	<input type=button value="답글보기" onclick="getReply()"> -->
	</div>
		
</div>

<section id="replyPage"> </section>	
</div>
	
	</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99e4787a897671e1cd06a99afee54577&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(document.getElementById("address").value , function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+document.getElementById("academy_name").value+'</div>'			       	
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	</section>
	<section id="commandList">
<%-- 		<a href="BoardReplyForm.ac?num=<%=article.getNum()%>&page=<%=nowPage %>"><input type="button" value="답변" ></a> --%>
		<%
		if(nickname!=null){
			if(nickname.equals(article.getNickname())){
				%>
		<a href="AcademyModifyForm.ac?num=<%=article.getNum()%>&page=<%=nowPage %>"><input type="button" value="Modify" ></a>
		<input type="button" value="Delete"  onclick="delete_article()">						
				<%
			}			
		}
		%>
		<a href="AcademyList.ac?page=<%=nowPage %>"><input type="button" value="List" ></a>
	</section>
	<br><br>
		<div class="w3-article" >
			 <div class="right-box " id="acList"> 
				 <script type="text/javascript">
				 </script>
			 <!-- 페이지 목록 버튼 표시 -->
			<!-- 이전 페이지 또는 다음 페이지가 존재할 경우에만 해당 하이퍼링크 활성화 -->
			
			</div>
		<div>
</body>
</html>