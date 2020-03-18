<%@page import="coding.vo.PageInfo"%>
<%@page import="coding.vo.CmmntBean"%>
<%@page import="coding.vo.Coding_refBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="coding.vo.CodingBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	CodingBean article = (CodingBean)request.getAttribute("article");
	ArrayList<Coding_refBean> article_refList = (ArrayList<Coding_refBean>)request.getAttribute("article_refList");
// 	ArrayList<CmmntBean> cmmntList = (ArrayList<CmmntBean>)request.getAttribute("cmmntList");
	String nowPage = (String)request.getAttribute("page");
	
// 	// PageInfo 객체로부터 페이징 정보 가져오기
// 	PageInfo cmmnt_pageInfo = (PageInfo)request.getAttribute("cmmnt_pageInfo");
// 	int cmmnt_count = cmmnt_pageInfo.getListCount();
// 	int cmmnt_nowPage = cmmnt_pageInfo.getPage(); // page 디렉티브의 이름과 중복되므로 nowPage 라는 변수명으로 사용
// 	int cmmnt_startPage = cmmnt_pageInfo.getStartPage();
// 	int cmmnt_endPage = cmmnt_pageInfo.getEndPage();
// 	int cmmnt_maxPage = cmmnt_pageInfo.getMaxPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#articleForm {
		width: 500px;
		height: 500px;
		border: 1px solid red;
		margin: auto;
	}
	
	#article_refForm {
		width: 500px;
		height: 500px;
		border: 1px solid blue;
		margin: auto;
	}
	
	#cmmntForm {
		width: 500px;
		height: 500px;
		border: 1px solid yellow;
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
	
	#article_refContentArea {
		background: skyblue;
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto; /* 지정 영역 크기 이상일 경우 자동으로 스크롤바 생성*/
	}
	
	#commandList {
		matgin: auto;
		width: 500;
		text-align: center;
	}
	header {
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
</style>

<script type="text/javascript">
function openCmmnt(){  
    window.open("CmmntList.code?post_num="+<%=article.getNum()%>, "댓글", width=800, height=700);
    
}
</script>  
</head>
<body>
	<header>
		<!-- 세션ID(sId) 가 없을 경우 로그인(LoginForm.me), 회원가입(JoinForm.me) 링크 표시 -->
		<!-- 세션ID(sId) 가 있을 경우 회원ID, 로그아웃(Logout.me)링크 표시 -->
		<%if(id == null) {%>
			<a href="LoginForm.me">로그인</a> | <a href="JoinForm.me">회원가입</a>
		<%} else { %>
			<%=id %>님 | <a href="Logout.me">로그아웃</a>
		<%} %>
	</header>
	
	<!-- 게시판 글 조회 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제목 : <%=article.getSubject() %><br>
			첨부파일 : 
			<%if(article.getFile() != null) { %>
				<!-- 파일이름 클릭 시 새창에서 다운로드 작업 수행 -->	
				<a href="CodingFileDown.code?file_name=<%=article.getFile()%>" target="blank"><%=article.getFile() %></a>
			<%}%>
		</section>
		<section id="articleContentArea">
			<%=article.getContent() %> <br>
			<img src="/codingUpload/<%=article.getFile()%>" width=200px >	
		</section>
	</section>
	
 <!-- 댓글시작-->
 	<section id="commandList">
	<input type=button value="댓글" onclick="javascript:openCmmnt();">  
	</section>
	
 <!-- 댓글끝 -->	
	
	<section id="commandList">
		<a href="CodingReply.code?post_num=<%=article.getNum()%>"><input type="button" value="답변" ></a>
		<a href="CodingModifyForm.code?num=<%=article.getNum()%>&page=<%=nowPage %>"><input type="button" value="수정" ></a>
		<a href="CodingDelete.code?num=<%=article.getNum()%>&page=<%=nowPage %>"><input type="button" value="삭제" ></a>
		<a href="CodingList.code?page=<%=nowPage %>"><input type="button" value="목록" ></a>
	</section>
	
	<%if(article_refList != null) {%> 
	<%for(int i=0; i<article_refList.size(); i++){ %>
		<section id="article_refForm">
		<h2>답글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제목 : <%=article_refList.get(i).getSubject()%><br>
			첨부파일 : 
			<%if(article_refList.get(i).getFile() != null) { %>
				<!-- 파일이름 클릭 시 새창에서 다운로드 작업 수행 -->	
				<a href="CodingFileDown.code?file_name=<%=article_refList.get(i).getFile()%>" target="blank"><%=article_refList.get(i).getFile() %></a>
			<%}%>
		</section>
		<section id="article_refContentArea">
		<img src="/codingUpload/<%=article_refList.get(i).getFile()%>" width=200px >	<br>
			<%=article_refList.get(i).getContent() %>	
		</section>
	</section>
	<%
		} 
	}%>
	
</body>
</html>

