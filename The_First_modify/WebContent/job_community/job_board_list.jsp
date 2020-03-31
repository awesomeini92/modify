<%@page import="job_community.vo.PageInfo"%>
<%@page import="job_community.vo.JobBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<JobBoardBean> articleList = (ArrayList<JobBoardBean>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage(); // page 디렉티브의 이름과 중복되므로 nowPage 라는 변수명으로 사용
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
	
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 게시판 리스트 -->
	<section id="listForm">
		<h2>글 목록</h2>
		<table>
			<tr id="tr_top">
				<td width="100">번호</td>
				<td width="400">제목</td>
				<td width="150">작성자</td>
				<td width="150">날짜</td>
				<td width="100">조회수</td>
			</tr>
		<%if(articleList != null & listCount > 0) {%>
			<!-- 게시물 목록이 하나라도 존재할 때만 목록을 표시 -->
			<%for(int i = 0; i < articleList.size(); i++) {%>
				<tr>
					<td align="center"><%=articleList.get(i).getBoard_num() %></td>
					<td>
					
						<!-- 게시물 제목 클릭 시 BoardDetail.bo 요청(게시물번호, 페이지번호 파라미터로 전달) -->
						<a href="JobBoardDetail.job?board_num=<%=articleList.get(i).getBoard_num()%>&page=<%=nowPage%>">
							<%=articleList.get(i).getBoard_subject() %>
						</a>
					</td>
					<td align="center"><%=articleList.get(i).getBoard_nickname() %></td>
					<td align="center"><%=articleList.get(i).getBoard_date() %></td>
					<td align="center"><%=articleList.get(i).getBoard_readcount() %></td>
				</tr>
			<%} %>
		</table>		
	</section>
	
	<section id="writeButton">
		<a href="JobBoardWriteForm.job"><input type="button" value="글쓰기"></a>
	</section>
	
	<!-- 페이지 목록 버튼 표시 -->
	<!-- 이전 페이지 또는 다음 페이지가 존재할 경우에만 해당 하이퍼링크 활성화 -->
	<section id="pageList">
	<%if(nowPage <= 1) { %>
			[이전]&nbsp;
	<%} else {%>
			<a href="BoardList.bo?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
	<%} %>
	
	<!-- 존재하는 페이지 번호만 표시(현재 페이지는 번호만 표시하고, 나머지 페이지는 하이퍼링크 활성화) -->
	<%for(int i = startPage; i <= endPage; i++) {
		    if(i == nowPage) {%>
				[<%=i %>]
		<%} else {%>
				<a href="BoardList.bo?page=<%=i %>">[<%=i %>]</a>&nbsp;
		<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) {%>
			&nbsp;[다음]
	<%} else { %>
			<a href="BoardList.bo?page=<%=nowPage + 1%>">&nbsp;[다음]</a>
	<%} %>
	</section>
<%} else {%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
<%} %>
	<section id="writeButton">
		<a href="JobBoardWriteForm.job"><input type="button" value="글쓰기"></a>
	</section>
</body>
</html>