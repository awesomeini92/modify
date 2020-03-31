<%@page import="coding.vo.PageInfo"%>
<%@page import="java.util.Date"%>
<%@page import="coding.vo.Coding_refBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="coding.vo.CodingBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%

	String nickname = null;
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
	CodingBean article = (CodingBean)request.getAttribute("article");
	ArrayList<Coding_refBean> article_refList = (ArrayList<Coding_refBean>)request.getAttribute("article_refList");
// 	ArrayList<CmmntBean> cmmntList = (ArrayList<CmmntBean>)request.getAttribute("cmmntList");
	String nowPage = (String)request.getAttribute("page");
	Date today = (Date)request.getAttribute("today");
	
	// PageInfo 객체로부터 페이징 정보 가져오기
	PageInfo reply_pageInfo = (PageInfo)request.getAttribute("replyPageInfo");
	
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
function openCmmnt(){  
    window.open("CmmntList.code?post_num="+<%=article.getNum()%>, "", width=800, height=700);
    
}


// 		$('.dup').click(function(){
		function getReply(){
			$.ajax({		
    			url: "CodingReplyDetail.code", // 요청 url
                type: "POST", // post 방식
                data: {
                	post_num : <%=article.getNum()%> // board_no의 값을 넘겨줌
                },
                success : function (json){
                	json = json.replace(/\n/gi,"\\r\\n"); // 개행문자 대체
                	$("#replyList").text(""); // 댓글리스트 영역 초기화
                	var obj = JSON.parse(json); // service 클래스로 부터 전달된 문자열 파싱
                	var replyList =obj.replyList; // replyList는 전달된 json의 키값을 의미
                	var output = ""; // 댓글 목록을 누적하여 보여주기 위한 변수
                	
//                 	alert(json);
//                 	var reply = replyList[0][0];
//                 	alert(reply.nickname);
//                 	output += "<i class='fa fa-user'></i>&nbsp;&nbsp;" + reply.nickname;
                	
                	for (var i = 0; i < replyList.length; i++) { // 반복문을 통해 output에 누적
                		alert(replyList.length);               	
   	                    output += "<div class='w3-border w3-padding'>";
	   	                 for (var j = 0; j < replyList[i].length; j++) {
	 	                    var reply = replyList[i][j];
	 	                    if(j === 0){
	 	                    	output += "<i class='fa fa-user'></i> <a href='#'> " + reply.nickname +"</a><br>";
	 	                    }else  if(j === 1){
	 	     					output += "<i class='fa fa-calendar'></i>" + reply.reply_date;
	 	                    }else  if(j === 2){
	 	     					output += "<div class='w3-right'><span><i class='fa fa-eye'></i>"+reply.readcount+"</span>&nbsp;";
	 	     					output += "<i class='fa fa-heart' style='color:red'></i>&nbsp;<span class='rec_count'></span>";
	 	                    	output += "<i class='fa fa-commenting-o'></i>&nbsp;<span class='reply_count'></span></div></div>";
	 	                    }else  if(j === 3){
	 	                    	output += "<div class='w3-border w3-padding'> No."+reply.ref_num+"&nbsp;&nbsp;&nbsp"; 
	 	                    }else  if(j === 4){
	 	                    	output += "<span class='w3-center w3-xlarge w3-text-blue'>"+reply.subject+"</span></div>";
	 	                    }else  if(j === 5){
	 	                    	if(reply.file!=""){
	 	                    		output += "<article class='w3-border w3-large w3-padding reply_content'><img src='/codingUpload/'"+reply.file+" width=200px ><br><br><br>";
	 	                    	}
	 	                    }else  if(j === 6){
	 	                   		output += reply.content+"<br><br></article>";
	 	                    }else  if(j === 7){
	 	                    	output += "<div class='w3-border w3-padding'>첨부파일: <a href='CodingFileDown.code?file_name='"+reply.file+" target='blank'>"+reply.file+"</a></div><br>";
	 	                    }
	 	                    
	   	                 }
	  	              	$("#replyList").html(output); // replyList 영역에 output 출력
	   	              	$(".reply_count").html(i);
	   	             }
                	$("#replyPage").html(i);
				}
			});
		}




</script>  


</head>
<body>

		<!-- header page -->
		<jsp:include page="../inc/top.jsp"/>
		<!-- header page -->

<section class="gtco-section">
<div class="gtco-container">

	<div class="w3-article">
	 <div class="left-box"> 
			<div class="w3-border w3-padding">
				<i class="fa fa-user"></i> <a href="#"> <%=article.getNickname() %></a><br>
				<i class="fa fa-calendar">
					<%if(article.getDate().compareTo(today)==0){ //날짜가 같으면 %> 
						<td style="width: 20%" id="date"><%=article.getTime()%> <!-- 시간출력 --></td>
					<%}else{ %>
						<td style="width: 20%" id="date"><%=article.getDate()%></td>
					<%} %>
				</i>
				<div class="w3-right">
					<!-- 조회수 --><span><i class="fa fa-eye"></i><%=article.getReadcount() %></span>&nbsp;
					<!-- 추천수 --><i class="fa fa-heart" style="color:red"></i>&nbsp;<span class="rec_count"></span>
					<!-- 댓글수 --><i class="fa fa-commenting-o"  onclick="javascript:openCmmnt();"></i>&nbsp;<span class="reply_count"></span>
				</div>
			</div>
			<div class="w3-border w3-padding">
				No.<%=article.getNum() %> &nbsp;&nbsp;&nbsp; <span class="w3-center w3-xlarge w3-text-blue"><%=article.getSubject() %></span>
			</div>
<%-- 			<article class="w3-border w3-large w3-padding">${article.content }</article> --%>
			<%if(article.getFile() != null) { %>
				<article class="w3-border w3-large w3-padding article_content">
					<img src="/codingUpload/<%=article.getFile()%>" width=200px >	<br><br><br>
					<%=article.getContent() %> <br><br>
				</article>
			<%}%>
			<div class="w3-border w3-padding">첨부파일: <a href="CodingFileDown.code?file_name=<%=article.getFile()%>" target="blank"><%=article.getFile() %></a></div><br>
			
		</div>	

<div class="w3-article" id="reply_article">
	 <div class="right-box " id="replyList"> 
	 	<input type=button value="답글보기" onclick="getReply()">
	 	
	 	<section id="replyPage"> </section>	
	</div>
		
</div>

	
</div>
	</div>
	</section>
	

	
	
	
	<!-- header page -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- header page -->
	
	
</body>
</html>