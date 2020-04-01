
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
// 	String address = article.getAddress();
// 	String aname = article.getAcademy_name();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#articleForm {
		width: 700px;
		height: 980px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	#basicInfoArea {
		height: 40px;
		text-align: center;
	}
	
	#articleContentArea {
		background: orange;
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto; /* 지정 영역 크기 이상일 경우 자동으로 스크롤바 생성*/
	}
		
	#commandList {
		margin: auto;
		width: 500px;
		text-align: center;
	}
	header {
		text-align: right;
	}
	#notice{
		display: table;
		text-align: center;
		margin: auto;
	}
	#mapArea{
		text-align: center;
	}

</style>
<script src="../script/jquery-3.4.1.js"></script>
<script type="text/javascript">

</script>
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
	<!-- 게시판 글 조회 -->
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