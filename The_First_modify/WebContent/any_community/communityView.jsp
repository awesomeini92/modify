<%@page import="any_community.vo.CommunityBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>${page } | ${article.subject }</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		// 추천 클릭
		$("#rec_update").click(function(){
			$.ajax({
				url: "/The_First/RecUpdate.any",
                type: "POST",
                data: {
                    no: '${article.num}',
                    nickname: '${sessionScope.nickname}'
                },
                success: function () {
			        recCount();
                },
			})
		});
		
		// 게시글 추천수
	    function recCount() {
			$.ajax({
				url: "/The_First/RecCount.any",
                type: "POST",
                data: {
                    no: '${article.num}'
                },
                success: function (count) {
                	$(".rec_count").html(count);
                },
			})
	    };
	    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
		
		// 게시글 삭제 확인
		$("#boardDelete").click(function(){
			var result = confirm("게시글을 삭제하시겠습니까?");
			if(result){
				location.href = '/The_First/CommunityDeletePro.any?num=${article.num}&page=${page}';
			}
		});
		
// 		로그인 클릭 (미완성)
	    $(".newLogin").click(function(){
			var ww=400;    //띄울 창의 넓이
			var wh=250;    //띄울 창의 높이
			
			// 중앙 좌표
			var top=(screen.availHeight-wh)/2;
			var left=(screen.availWidth-ww)/2;
			// 새창 띄움
			window.open("/The_First/NewLoginForm.any", "window", "width="+ww+", height="+wh+", top="+top+", left="+left+", toolbar=no, menubar=no, scrollbars=no, resizable=no");
	    });
	    
		// 댓글 작성
		$("#reply_btn").click(function() {
			if ($("#comment_content").val().trim() === "") {
				alert("댓글을 입력하세요");
				$("#comment_content").val("").focus();
			} else {
				$.ajax({
					url: "/The_First/CommentWritePro.anyC",
					type: "POST",
					data: {
						comment_board : $("#comment_board").val(),
						comment_nickname : $("#comment_nickname").val(),
						comment_content : $("#comment_content").val(),
						nowPage : $("#nowPage").val()
					},
					success: function() {
						alert("댓글 등록 완료");
						$("#comment_content").val("");
						getReply(); // 등록 후 댓글 리스트를 보여주기 위한 함수. 
					}
				})
			}
		})
		
		// 댓글 수정
		$("#reply_modify").click(function () {
			
		})
		
		// 댓글 삭제
		$("#reply_delete").click(function () {

		});
		function delete_reply(comment_num2) {
			$.ajax({
				url: "/The_First/CommentDelete.anyC",
				type: "POST",
				data: {
					comment_num : comment_num2
				},
				success: function() {
					alert("댓글 삭제 완료");
					$("#comment_content").val("");
					getReply(); // 등록 후 댓글 리스트를 보여주기 위한 함수. 
				}
			})
		}
		
		// 댓글리스트
		 function getReply(){
	    	$.ajax({
    			url: "/The_First_modify/CommentList.anyC", // 요청 url
                type: "POST", // post 방식
                data: {
                	post_num : ${article.num} // board_no의 값을 넘겨줌
                },
                success : function (json) { // 성공하였을 경우
                	json = json.replace(/\n/gi,"\\r\\n"); // 개행문자 대체
                	$("#replyList").text(""); // 댓글리스트 영역 초기화
                	var obj = JSON.parse(json); // service 클래스로 부터 전달된 문자열 파싱
                	var replyList = obj.replyList; // replyList는 전달된 json의 키값을 의미
                	var output = ""; // 댓글 목록을 누적하여 보여주기 위한 변수
                	
                	for (var i = 0; i < replyList.length; i++) { // 반복문을 통해 output에 누적
   	                    output += "<div class='w3-border w3-padding'>";
    	                for (var j = 0; j < replyList[i].length; j++) {
    	                    var reply = replyList[i][j];
    	                    if(j === 0){
    	     					output += "<i class='fa fa-user'></i>&nbsp;&nbsp;" + reply.nickname;
    	                    } else if(j === 1){
    	     					output += "&nbsp;&nbsp;<i class='fa fa-calendar'></i>&nbsp;&nbsp;" + reply.reply_date;
    	                    } else if(j === 2){
    	     					output += "<pre>" + reply.comment + "</pre></div>";
    	                    }else if(j === 3){
    	                    	output += "<input type='button' class='w3-button w3-border' value='삭제' onclick='delete_reply(" + reply.comment_num + ")'>";
    	                    	output += "<input type='button' class='w3-button w3-border' value='수정' onclick='modify_reply(" + reply.comment_num + ")' ></div>";
    	                    }
    	                };
    	        	};
    	        	
   	              	$("#replyList").html(output); // replyList 영역에 output 출력
   	              	$(".reply_count").html(i);
                } 
	    	})
	    }
		getReply(); // 해당 페이지 실행 시 해당 함수 호출
 	});
	
	
	
</script>
</head>
<body>
	<div class="w3-main w3-margin-bottom" style="margin-left: 340px; margin-right: 40px; width: 60%;">
		
		<!-- 상단 목록,수정,삭제 시작 -->
		<div class="w3-bar">
			<!-- 비로그인시 -->
			<c:if test="${sessionScope.nickname != article.nickname }">
			<button type="button" class="w3-bar-item w3-button w3-border" onClick="location.href='/The_First/CommunityList.any?page=${page}'">
					<i class="fa fa-bars"></i> 글 목록
			</button>
			</c:if>
			<!-- 로그인시 -->
			<c:if test="${sessionScope.nickname == article.nickname }">
				<button type="button" class="w3-bar-item w3-button w3-border" onClick="location.href='/The_First/CommunityList.any?page=${page}'">
					<i class="fa fa-bars"></i> 글 목록
				</button>
				<button type="button" class="w3-bar-item w3-button w3-border" onClick="location.href='/The_First/CommunityModifyForm.any?num=${article.num }&page=${page}'">
					<i class="fa fa-exchange"></i> 글 수정
				</button>
				<button type="button" class="w3-bar-item w3-button w3-border" id="boardDelete">
					<i class="fa fa-remove"></i> 글 삭제
				</button>
			</c:if>
		</div>
		<!-- 상단 목록,수정,삭제 끝 -->
		
		<!-- 게시글 내용 시작 -->
		<div class="w3-article">
			<div class="w3-border w3-padding">
				<i class="fa fa-user"></i> <a href="#"> ${article.nickname }</a><br>
				<i class="fa fa-calendar"></i> <fmt:formatDate value="${ article.date }" pattern="yy-MM-dd" />
				<div class="w3-right">
					<!-- 조회수 --><span><i class="fa fa-eye"></i>${article.readcount }</span>&nbsp;
					<!-- 추천수 --><i class="fa fa-heart" style="color:red"></i>&nbsp;<span class="rec_count"></span>
					<!-- 댓글수 --><i class="fa fa-commenting-o"></i>&nbsp;<span class="reply_count"></span>
				</div>
			</div>
			<div class="w3-border w3-padding">
				#${article.num } <span class="w3-center w3-xlarge w3-text-blue">${article.subject }</span>
			</div>
			<article class="w3-border w3-large w3-padding">${article.content }</article>
		</div>	
		<!-- 게시글 내용 끝 -->
		
		<!-- 추천 시작-->
			<div>
				<div class="w3-border w3-center w3-padding">
					<c:if test="${sessionScope.nickname == null }">
						추천 기능은 <button type="button" id="newLogin" class="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
						<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						&nbsp;<span class="rec_count"></span>					
					</c:if>
					<c:if test="${sessionScope.nickname != null }">
						<button class="w3-button w3-black w3-round" id="rec_update">
							<i class="fa fa-heart" style="font-size:16px;color:red"></i>
							&nbsp;<span class="rec_count"></span>
						</button> 
					</c:if>
				</div>
			</div>
		<!-- 추천 끝 -->
	
		<!-- 댓글 시작 -->
			<div>
				<div class="w3-border w3-padding">댓글</div>
				<div class="w3-border w3-padding">
					<c:if test="${sessionScope.nickname == null}">
						<textarea rows="5" cols="50" class="w3-input w3-border newLogin" readonly>로그인 후 댓글 달기</textarea>
					</c:if>
					<c:if test="${sessionScope.nickname != null}">
						<i class="fa fa-user w3-padding-16"></i> ${article.nickname}
						<form>
							<input type="hidden" name="comment_board" id="comment_board" value="${article.num}"> 
							<input type="hidden" name="comment_nickname" id="comment_nickname" value="${article.nickname}">
							<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }">
							<textarea rows="5" cols="50" class="w3-input w3-border" placeholder="댓글 작성" name="comment_content" id="comment_content"></textarea>
							<input type="button" class="w3-button w3-border" id="reply_btn" value="댓글 등록">
							
						</form>
					</c:if>
				</div>
				<div>
					<div class="w3-border w3-padding">댓글목록(<i class="fa fa-commenting-o"></i> <span class="reply_count"></span>)</div>
					<div id="replyList">
 					</div>
				</div>
			</div>
		<!-- 댓글 끝 -->
	</div>
</body>
</html>