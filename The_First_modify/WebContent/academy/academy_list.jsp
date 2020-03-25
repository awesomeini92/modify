<%@page import="academy_community.vo.PageInfo"%>
<%@page import="academy_community.vo.AcademyBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
    	ArrayList<AcademyBean> articleList = (ArrayList<AcademyBean>)request.getAttribute("articleList");
    	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    	
    	// PageInfo 객체로부터 페이징 정보 가져오기
    	int listCount = pageInfo.getListCount();
    	int nowPage = pageInfo.getPage();
    	int startPage = pageInfo.getStartPage();
    	int endPage = pageInfo.getEndPage();
    	int maxPage = pageInfo.getMaxPage();
    	
    	// 현재 세션 객체에 "sId" 세션이 존재할 경우 String 타입 변수에 세션 ID 저장
    		String sId = null;

    		if(session.getAttribute("sId") != null) {
    	sId = (String)session.getAttribute("sId"); // Object -> String 변환 필요
    		}
    	Date today = (Date)request.getAttribute("today");
    %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#registForm {
		width: 500px;
		height: 610px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 800px;
		border: 1px solid darkgray;
	}
	
	a {
		text-decoration: none;
	}

	#tr_top {
		background: orange;
		width: 800px; 
		text-align: center;
	}
	
	#writeButton {
		margin: auto;
		width: 800px;
		text-align: right;
	}
	
	#pageList {
		margin: auto;
		width: 800px;
		text-align: center;
	}
	
	#emptyArea {
		margin: auto;
		width: 800px;
		text-align: center;
	}
	header {
		text-align: right;
	}
</style>
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
	<!-- 게시판 리스트 -->
	<section id="listForm">
		<h2>Academy Community List</h2>
		<table>
		<%if(articleList != null & listCount > 0) {%>
				<tr id="tr_top">
					<td width="100">Num</td>
					<td width="400">Subject</td>
					<td width="150">Nickname</td>
					<td width="150">Date</td>
					<td width="100">Readcount</td>
				</tr>
			<%for(int i = 0; i < articleList.size(); i++) {%>
					<tr>
						<td align="center"><%=articleList.get(i).getNum() %></td>
						<td>
							<a href="BoardDetail.ac?num=<%=articleList.get(i).getNum()%>&page=<%=nowPage%>">
								<%=articleList.get(i).getSubject() %>
							</a>
						</td>
						<td align="center"><%=articleList.get(i).getNickname() %></td>
						<%if(articleList.get(i).getDate().compareTo(today)==0){ //날짜 같으면 %>						
						<td align="center" id="date"><%=articleList.get(i).getTime()%></td> <!--시간출력-->
						<%}else{ %>
						<td align="center" id="date"><%=articleList.get(i).getDate()%></td>
						<%}%>
						<td align="center"><%=articleList.get(i).getReadcount() %></td>
					</tr>
			<%} %>
		</table>		
	</section>
	
	<section id="writeButton">
		<a href="BoardWriteForm.ac"><input type="button" value="Post"></a>
	</section>
	
	<!-- 페이지 목록 버튼 표시 -->
	<!-- 이전 페이지 또는 다음 페이지가 존재할 경우에만 해당 하이퍼링크 활성화 -->
	<!-- 존재하는 페이지 번호만 표시(현재 페이지는 번호만 표시하고, 나머지 페이지는 하이퍼링크 활성화) -->
	<section id="pageList">
	<%if(nowPage <= 1) { %>
			[Prev]&nbsp;
	<%} else {%>
			<a href="BoardList.ac?page=<%=nowPage - 1%>">[Prev]</a>&nbsp;
	<%} %>
	
	<%for(int i = startPage; i <= endPage; i++) {
		    if(i == nowPage) {%>
				[<%=i %>]
		<%} else {%>
				<a href="BoardList.ac?page=<%=i %>">[<%=i %>]</a>&nbsp;
		<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) {%>
			&nbsp;[Next]
	<%} else { %>
			<a href="BoardList.ac?page=<%=nowPage + 1%>">&nbsp;[Next]</a>
	<%} %>
	</section>
<%} else {%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<section id="writeButton">
		<a href="BoardWriteForm.ac"><input type="button" value="Post"></a>
	</section>
<%} %>
</body>
</html>