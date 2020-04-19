<%@page import="java.util.Date"%>
<%@page import="coding_free.vo.CodingFreeBean"%>
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
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"> </script>
<script type="text/javascript">
function insert_comment(){
	alert("코멘트 넣기");
	location.href="CmmntWritePro.code?post_num=${post_num }";
}

function delete_comment(comment_num){
	if (confirm("댓글 삭제하시겠습니까?") == true){    //확인
		location.href="CmmntDeletePro.cf?post_num=${post_num }&comment_num="+comment_num;
	}else{   //취소
		return false;
	}
}


// function modify_comment(comment_num){
// 	if (confirm("댓글 수정?") == true){    //확인
<%-- 		location.href="CmmntModifyForm.cf?post_num="+<%=post_num%>+"&comment_num="+comment_num; --%>
// 	}else{   //취소
// 		return false;
// 	}
// }


function update_heart(comment_num){
// 	alert(comment_num);
	if (confirm("추천하시겠습니까?") == true){    //확인
		updateHeart(comment_num);
	}else{   //취소
		return false;
	}
}

function cancle_heart(comment_num){
// 	alert(comment_num);
	if (confirm("추천을 취소하시겠습니까?") == true){    //확인
		cancleHeart(comment_num);
	}else{   //취소
		return false;
	}
}

$(document).ready(function() {
	getComment();
});

		function getComment(){
			$.ajax({		
    			url: "CodingFreeCommentList.cf?recommender=${sessionScope.nickname }", // 요청 url
                type: "POST", // post 방식
                data: {
                	post_num : ${post_num } // board_no의 값을 넘겨줌
//                 	reply_page : i
                },
                success : function (json){
                	json = json.replace(/\n/gi,"\\r\\n"); // 개행문자 대체
                	$("#cmmntList").text(""); // 댓글리스트 영역 초기화
                	var obj = JSON.parse(json); // service 클래스로 부터 전달된 문자열 파싱
                	var cmmntList =obj.cmmntList; // replyList는 전달된 json의 키값을 의미
                	var output = ""; // 댓글 목록을 누적하여 보여주기 위한 변수
                	var comment_num ="";
                	var comment_nick ="";

                	output += "<form action='CmmntModifyPro.cf' method='post'>";
        			output += "<input type='hidden' name='comment_num' value='${modify_num }'>";
        			output += "<input type='hidden' name='post_num' value='${post_num }'>";
                	output += "<div><input type='text' class='bd_color'  name='nickname' value=${cmmnt.nickname } readonly>";
        			output += "<span class='w3-right'><input type='submit' class='btn btn-success btn-sm' value='댓글수정'></span></div>";
        			output += "<textarea class='form-control' id='exampleTextarea' rows='3' name='comment'>${cmmnt.comment }</textarea></form>";
        			
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
	 	                    	
	 	                    }else  if(j === 5){
	 	                    	var heart = parseInt(cmmnt.heart);
		                    }else  if(j === 6){
									output += "<span class='w3-right'>";
			                    	var existNum = parseInt(cmmnt.exist);
									if(existNum>0){
										output += "<span><button class='btn btn-danger btn-lg w3-round' onclick='cancle_heart("+comment_num+");'>";
				    					output += "<i class='fa fa-heart' style='font-size:20px;color:white'></i>&nbsp;<span class='rec_count'>"+heart+"</button><br></span>";
									}
									else if(heart==0 && existNum==0){
										output += "<button class='btn btn-outline-danger btn-lg w3-round' id='heart_count' onclick='update_heart("+comment_num+");'>";
			    						output += "<i class='fa fa-heart' style='font-size:20px;color:red'></i>&nbsp;<span class='rec_count'>"+heart+"</button><br></span>";
									}else if(heart>0 && existNum==0){
										output += "<button class='btn btn-danger btn-lg w3-round' id='heart_count' onclick='update_heart("+comment_num+");'>";
		    							output += "<i class='fa fa-heart' style='font-size:20px;color:white'></i>&nbsp;<span class='rec_count'>"+heart+"</button><br></span>";
										}
			                    	 output += "</div>";
								}
	 	                    
	   	                 	}
	   	                 }
	  	              	$("#cmmntList").html(output); // replyList 영역에 output 출력
	   	             }
			});
		}
		
		function updateHeart(comment_num){
			$.ajax({		
				url: "CmmntFreeUpdateHeart.cf?recommender=${sessionScope.nickname }", // 요청 url
		        type: "POST", // post 방식
		        data: {
//		         	recommender: recommender,
		        	cmmnt_num: comment_num
		        },
		        success : function(){
		        	getComment();
			   }
			});
		}

		function cancleHeart(comment_num){
			$.ajax({		
				url: "CmmntDeleteHeart.cf?recommender=${sessionScope.nickname }", // 요청 url
		        type: "POST", // post 방식
		        data: {
//		         	recommender: recommender,
		        	comment_num: comment_num
		        },
		        success : function(){
		        	getComment();
			   }
			});
		}
	
		
</script>  
		



</head>
<body>

		<!-- header page -->
		<jsp:include page="../inc/top.jsp"/>
		<jsp:include page="../inc/link.jsp"/>
		<jsp:include page="../inc/green.jsp"/>
		<!-- header page -->

<section class="gtco-section">

<div class="gtco-container">

	<div class="w3-article">
	 <div class="left-box"> 
			<div class="w3-border w3-padding">
				<i class="fa fa-user"></i> <a href="#">${article.num }</a>
				<i class='fas fa-coins' style="float: right!important;">${article.CP }</i>
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
					<!-- 댓글수 --><i class="fa fa-commenting-o"  onclick="javascript:openCmmnt();"></i>&nbsp;<span class="reply_count"></span>
				</div>
			</div>
			<div class="w3-border w3-padding">
				No.${article.num }&nbsp;&nbsp;&nbsp; <span class="w3-center w3-xlarge w3-text-blue">${article.subject }</span>
			</div>
<%-- 			<article class="w3-border w3-large w3-padding">${article.content }</article> --%>
				<c:if test="${article.file != null}">
							<article class="w3-border w3-large w3-padding article_content">
					<img src="./codingUpload/${article.file }" width=800px >	<br><br><br>
					${article.content } <br><br>
				</article>
					</c:if>
			<div class="w3-border w3-padding">첨부파일: <a href="CodingFileDown.code?file_name=${article.file }" target="blank">${article.file }</a></div><br>
<!-- 			<div class="check" > 체크</div> -->
			</div>
			<div class="w3-padding">
			    <button type="button" class="btn btn-outline-secondary" onclick="modify_article(${article.num})">글수정</button>
			     <button type="button" class="btn btn-outline-secondary" onclick="delete_article(${article.num})">글삭제</button>
			</div>
		
		
		

<div class="w3-article" id="cmmnt_article">
	 <div class="right-box " id="cmmntList"> 
	 <!-- 페이지 목록 버튼 표시 -->
	<!-- 이전 페이지 또는 다음 페이지가 존재할 경우에만 해당 하이퍼링크 활성화 -->
	
	</div>
	
	<div>

	 
<!-- 	 <a href="javascript:getReplyListCount()">답글보기</a> -->
<!-- 	 	<input type=button value="답글보기" onclick="getReply()"> -->
	</div>
		
</div>

<section id="replyPage"> </section>	
</div>
	</div>
	
	</section>
	

	
	
	
	<!-- header page -->
		<jsp:include page="../inc/bottom.jsp"/>
	<!-- header page -->
	
	
</body>
</html>