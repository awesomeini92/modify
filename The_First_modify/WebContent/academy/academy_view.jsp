
<%@page import="java.util.Date"%>
<%@page import="academy_community.vo.AcademyCommentBean"%>
<%@page import="academy_community.vo.AcademyBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sId = null;
	// 로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
	if(session.getAttribute("sId") == null) {
		out.println("<script>");
	    out.println("alert('로그인이 필요한 서비스입니다!')");
	    out.println("location.href='LoginForm.me'");
	    out.println("</script>");
	} else { // 로그인 된 상태일 경우 세션 ID 가져오기
		sId = (String)session.getAttribute("sId");
	}
	
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
</head>
<body>
<header>
		<!-- 세션ID(sId) 가 없을 경우 로그인(LoginForm.me), 회원가입(JoinForm.me) 링크 표시 -->
		<!-- 세션ID(sId) 가 있을 경우 회원ID, 로그아웃(Logout.me)링크 표시 -->
		<%if(sId == null) {%>
			<a href="LoginForm.me">Login</a> | <a href="JoinForm.me">Join</a>
		<%} else { %>
			<%=sId %>님 | <a href="Logout.me">Logout</a>
		<%} %>
	</header>
<!-- header page -->
		<jsp:include page="/inc/top.jsp"/>
		<jsp:include page="/inc/link.jsp"/>
<%-- 		<jsp:include page="/inc/green.jsp"/> --%>
		<!-- header page -->
	
	
	<!-- 게시판 글 조회 -->
	<section class="gtco-section">

<div class="gtco-container">
<%if(article != null) {%> 
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
				<article class="w3-border w3-large w3-padding article_content">
					<%=article.getContent() %> <br><br>
				</article>
			<div class="w3-border w3-padding">	<h3 style="text-align:center">Academy Information</h3>
<!-- 			<div class="form-group"> -->
				    <label class="control-label" for="readOnlyInput">Address</label>
				    <input class="form-control" id="address" type="text" value="<%=article.getAddress() %>" readonly="">
				     <label class="control-label" for="readOnlyInput">Address</label>
				    <input class="form-control" id="address" type="text" value="<%=article.getAcademy_name()%>" readonly=""><br><br>
					<div id="map" style="margin:0 auto; width:450px;height:350px;"></div><br>
			</div>

	<%
	}else {%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
<%} %>
	 
<!-- 	 <a href="javascript:getReplyListCount()">답글보기</a> -->
<!-- 	 	<input type=button value="답글보기" onclick="getReply()"> -->
	</div>
		
</div>

<section id="replyPage"> </section>	
</div>
	</div>
	
	</section>
	<section id="articleForm">
		<h2>Academy Community Detail</h2>
		<section id="basicInfoArea">
			Subject : <%=article.getSubject() %><br>
		</section>
		<section id="articleContentArea">
			<%=article.getContent() %>	
		</section>
		<section id="mapArea">
		<h3 style="text-align:center">Academy Information</h3>		
		Address : <input type="text" id="address" style="border: 0px; width:300px" value="<%=article.getAddress() %>"><br>
		Academy Name : <input type="text" id="academy_name" style="border: 0px; width:100px" value="<%=article.getAcademy_name()%>"><br><br>
		<div id="map" style="margin:0 auto; width:450px;height:350px;"></div><br>
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
		<a href="AcademyDeleteForm.ac?num=<%=article.getNum()%>&page=<%=nowPage %>"><input type="button" value="Delete" ></a>							
				<%
			}			
		}
		%>
		<a href="AcademyList.ac?page=<%=nowPage %>"><input type="button" value="List" ></a>
	</section>
	<br><br>
	<form action="AcademyCommentWritePro.ac?num=<%=article.getNum()%>" method="post" name="commform">
		<table id="notice">
			<tr>
				<td><input type="text" size="4" name="nickname" value="<%=nickname%>" readonly ></td>
				<td><textarea name=comment cols="50" ></textarea></td>
				<td><input type="submit" value="Register"></td>
			</tr>
		</table>
	</form>
</body>
</html>