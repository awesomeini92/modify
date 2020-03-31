<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="coding.vo.CmmntBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="coding.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
//
	String id = null;
	// 로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
	/*
	if(session.getAttribute("id") == null) {
		out.println("<script>");
	    out.println("alert('로그인이 필요한 서비스입니다!')");
	    out.println("location.href='LoginForm.me'");
	    out.println("</script>");
	} else { // 로그인 된 상태일 경우 세션 ID 가져오기
		id = (String)session.getAttribute("id");
	}
	*/
	// 전달받은 request 객체에서 데이터 가져오기
	
// 	ArrayList<CmmntBean> cmmntList = (ArrayList<CmmntBean>)request.getAttribute("cmmntList");
	String nowPage = (String)request.getAttribute("page");
	int post_num = (int)request.getAttribute("post_num");
	Date today = (Date)request.getAttribute("today");
	String nickname = "nick";
	
	// PageInfo 객체로부터 페이징 정보 가져오기
	PageInfo cmmnt_pageInfo = (PageInfo)request.getAttribute("cmmnt_pageInfo");
	int cmmnt_count = cmmnt_pageInfo.getListCount();
	int cmmnt_nowPage = cmmnt_pageInfo.getPage(); // page 디렉티브의 이름과 중복되므로 nowPage 라는 변수명으로 사용
	int cmmnt_startPage = cmmnt_pageInfo.getStartPage();
	int cmmnt_endPage = cmmnt_pageInfo.getEndPage();
	int cmmnt_maxPage = cmmnt_pageInfo.getMaxPage();
	
%> 
<script src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	// 댓글 작성
	alert("댓글");
		$("#reply_btn").click(function() {
			if ($("#comment").val().trim() === "") {
				alert("댓글을 입력하세요");
				$("#comment").val("").focus();
			} else {
				$.ajax({
					url: "/The_First_modify/CmmntWritePro.code",
					type: "POST",
					data: {
						post_num : $("#post_num").val(),
						nickname : $("#nickname").val(),
						comment : $("#comment").val(),
						page : $("#nowPage").val()
					},
					success: function() {
						alert("댓글 등록 완료");
						$("#comment").val("");
						getReply(); // 등록 후 댓글 리스트를 보여주기 위한 함수. 
					}
				});
			}
		});
		 function getReply(){
		    	$.ajax({
	    			url: "/The_First_modify/CmmntList.code", // 요청 url
	                type: "POST", // post 방식
	                data: {
// 	                	post_num : ${post_num} // board_no의 값을 넘겨줌
							post_num: <%=request.getAttribute("post_num")%>
	                },
	                success : function (json) { // 성공하였을 경우
	                	json = json.replace(/\n/gi,"\\r\\n"); // 개행문자 대체
	                	$("#cmmntList").text(""); // 댓글리스트 영역 초기화
	                	var obj = JSON.parse(json); // service 클래스로 부터 전달된 문자열 파싱
	                	var cmmntList = obj.cmmntList; // cmmntList는 전달된 json의 키값을 의미
	                	var output = ""; // 댓글 목록을 누적하여 보여주기 위한 변수
	                	
	                	for (var i = 0; i < cmmntList.length; i++) { // 반복문을 통해 output에 누적
	   	                    output += "<div class='w3-border w3-padding'>";
	    	                for (var j = 0; j < cmmntList[i].length; j++) {
	    	                    var reply = cmmntList[i][j];
	    	                    if(j === 0){
	    	     					output += "<i class='fa fa-user'></i>&nbsp;&nbsp;" + reply.nickname;
	    	                    } else if(j === 1){
	    	     					output += "&nbsp;&nbsp;<i class='fa fa-calendar'></i>&nbsp;&nbsp;" + reply.reply_date;
	    	                    } else if(j === 2){
	    	     					output += "<pre>" + reply.comment + "</pre></div>";
	    	                    }
	    	                };
	    	        	};
	   	              	$("#cmmntList").html(output); // cmmntList 영역에 output 출력
	   	              	$(".reply_count").html(i);
	                } 
		    	})
		    }
			getReply(); // 해당 페이지 실행 시 해당 함수 호출
	 	});
// 	});
</script>
</head>
<body>
	<!-- 댓글 보여주기 -->
					<!-- 댓글 리스트 출력 시작 -->
					<div class="w3-border w3-padding">댓글목록(<i class="fa fa-commenting-o"></i> <span class="reply_count"></span>)</div>
					<div id="cmmntList">
						<c:forEach var="cl" items="${cmmntList }">
							<div class='w3-border w3-padding'>
								<i class='fa fa-user'></i>&nbsp;&nbsp; <c:out value="${cl.nickname}" />
								<i class='fa fa-calendar'></i> &nbsp;&nbsp; <c:out value="${cl.date}" />
								<pre> <c:out value="${cl.comment}" /> </pre>
								<c:if test="${sessionScope.nickname eq cl.nickname }">
									<input type="button" class="w3-button w3-border" id="delete_reply_btn" value="댓글 삭제" 
									onClick="location.href='CommentDeletePro.anyC?comment_num=${cl.comment_num}'">
									<input type="button" class="w3-button w3-border" id="modify_reply_btn" value="댓글 수정" 
									onClick="location.href='CommentModifyPro.anyC?comment_num=${cl.comment_num}'">
								</c:if>
							</div>
						</c:forEach>
 					</div>
 					<!-- 댓글 리스트 출력 끝 -->
 					<!-- 댓글 시작 -->
			<div>
				<div class="w3-border w3-padding">댓글</div>
				<div class="w3-border w3-padding">
					
						<i class="fa fa-user w3-padding-16"></i> <%=nickname %>
						<form>
							<input type="hidden" name="post_num" id="post_num" value="<%=request.getParameter("post_num")%>"> 
							<input type="hidden" name="nickname" id="nickname" value="<%=nickname %>">
							<input type="hidden" name="page" id="page" value="${nowPage }">
							<textarea rows="5" cols="50" class="w3-input w3-border" placeholder="댓글 작성" name="comment" id="comment"></textarea>
							<input type="button" class="w3-button w3-border" id="reply_btn" value="댓글 등록">
							
						</form>
		
				</div>
				<div>
					<div class="w3-border w3-padding">댓글목록(<i class="fa fa-commenting-o"></i> <span class="reply_count"></span>)</div>
					<div id="cmmntList">
 					</div>
				</div>
			</div>
		<!-- 댓글 끝 -->

		<br><br>
</body>
</html>