<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="coding.vo.CmmntBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="coding.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
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
	ArrayList<CmmntBean> cmmntList = (ArrayList<CmmntBean>)request.getAttribute("cmmntList");
	String nowPage = (String)request.getAttribute("page");
	int post_num = (int)request.getAttribute("post_num");
	Date today = (Date)request.getAttribute("today");
	
	// PageInfo 객체로부터 페이징 정보 가져오기
	PageInfo cmmnt_pageInfo = (PageInfo)request.getAttribute("cmmnt_pageInfo");
	int cmmnt_count = cmmnt_pageInfo.getListCount();
	int cmmnt_nowPage = cmmnt_pageInfo.getPage(); // page 디렉티브의 이름과 중복되므로 nowPage 라는 변수명으로 사용
	int cmmnt_startPage = cmmnt_pageInfo.getStartPage();
	int cmmnt_endPage = cmmnt_pageInfo.getEndPage();
	int cmmnt_maxPage = cmmnt_pageInfo.getMaxPage();
	
%>    
</head>
<body>
	<!-- 댓글 보여주기 -->
	<div class="cmmntForm"> <!-- 코멘트 부분 div 시작 -->
	<%if(cmmntList != null) {%> 
		<%for(int i=0; i<cmmntList.size(); i++){ %>
			<table>
				<tr>
					<td style="width: 20%" id="nickname"><%=cmmntList.get(i).getNickname() %></td>
					<td style="width: 20%" id="comment" > <%=cmmntList.get(i).getComment()%></td>
					<%if(cmmntList.get(i).getDate().compareTo(today)==0){ //날짜가 같으면 %> 
						<td style="width: 20%" id="date"><%=cmmntList.get(i).getTime()%> <!-- 시간출력 --></td>
					<%}else{ %>
					<td style="width: 20%" id="date"><%=cmmntList.get(i).getDate()%></td>
					<%} %>
				</tr>
			</table>
			
			
<!-- 수정삭제부분 -->
	<%
	//if(id!=null){
		//if(id.equals(cb.getId())){%>
		 <script type="text/javascript">
		 
		 function del_cmmnt(){
			 if (confirm("정말 삭제하시겠습니까?") == true){    //확인
				 location.href="CmmntDeletePro.code?post_num=<%=cmmntList.get(i).getPost_num()%>&comment_num=<%=cmmntList.get(i).getComment_num()%>";
				}else{   //취소
				    return false;
				}
		}
 </script>
<%-- <input type="button" value="수정" class="btn" onclick="location.href='CmmntUpdateForm.code?post_num=<%=cmmntList.get(i).getComment_num()%>&comment_num=<%=cmmntList.get(i).getComment_num()%>'"> --%>
<input type="button" value="수정" class="btn" onclick="location.href='CmmntUpdateForm.code?post_num=<%=cmmntList.get(i).getPost_num()%>&comment_num=<%=cmmntList.get(i).getComment_num()%>&comment_page=<%=cmmnt_nowPage%>'">
<input type="button" value="삭제" class="btn" onclick=del_cmmnt() >

<%	 }	
		//cmmntList if문%>
		
		<section id="pageList">
		<%if(cmmnt_nowPage <= 1) { %>
				[이전]&nbsp;
		<%} else {%>
				<a href="CmmntList.code?cmmnt_page=<%=cmmnt_nowPage - 1%>&post_num=<%=post_num%>">[이전]</a>&nbsp;
		<%} %>
		
		<!-- 존재하는 페이지 번호만 표시(현재 페이지는 번호만 표시하고, 나머지 페이지는 하이퍼링크 활성화) -->
		<%for(int i = cmmnt_startPage; i <= cmmnt_endPage; i++) {
			    if(i == cmmnt_nowPage) {%> 
					[<%=i %>]
			<%} else {%>
					<a href="CmmntList.code?cmmnt_page=<%=i %>&post_num=<%=post_num%>">[<%=i %>]</a>&nbsp;
			<%} %>
		<%} %>
		
		<%if(cmmnt_nowPage >= cmmnt_maxPage) {%>
				&nbsp;[다음]
		<%} else { %>
				<a href="CmmntList.code?cmmnt_page=<%=nowPage + 1%>&post_num=<%=post_num%>">&nbsp;[다음]</a>
		<%} %>
		</section>
	<%} else {%>
		<section id="emptyArea">등록된 댓글이 없습니다.</section>
	<%} %>

<%
	//}
//}

%>

	<!-- 댓글 쓰기 -->
	<br><br><br><br><br>
		<form action="CmmntWritePro.code?post_num=<%=post_num%>&cmmnt_page=<%=cmmnt_nowPage %>&page=<%=nowPage %>" method="post">
		<table id="notice">
<%-- 		<tr><td><input type="text" size="4" value="<%=id%>"  readonly ></td> --%>
		<tr><td><input type="text" size="4" name="nickname"></td>
		<td><textarea name="comment" cols="50" ></textarea></td>
		<td><input type="submit" value="댓글쓰기"  class="btn" ></td></tr>
		</table>
		</form>
		</div>  <!-- 코멘트 부분 div 끝-->
		<br><br>
</body>
</html>