<%@page import="coding.vo.PageInfo"%>
<%@page import="coding.vo.CodingBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<CodingBean> articleList = (ArrayList<CodingBean>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	Date today = (Date)request.getAttribute("today");
	// PageInfo 객체로부터 페이징 정보 가져오기
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage(); // page 디렉티브의 이름과 중복되므로 nowPage 라는 변수명으로 사용
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
	
%>  
<head>



</head>
	<body>
	<!-- header page -->
		<jsp:include page="../inc/top.jsp"/>
		<!-- header page -->
	
		
		<div class="gtco-section">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h2>Check Our Works</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p>
					</div>
				</div>
				 <div class="">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>Charged Coding Q&A</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th >글번호</th>
                                                <th>글제목</th>
                                                <th>작성자</th>
                                                <th>작성일</th>
                                                <th>조회수</th>
                                            </tr>
                                        </thead>

                                        <tbody>
<!-- 게시물 목록 가져오기 -->
      <%if(articleList != null) { //& listCount > 0) %> 
			<%for(int i = 0; i < articleList.size(); i++) {%>
				<tr>
					<td align="center"><%=articleList.get(i).getNum() %></td>
					<td>
						<!-- 게시물 제목 클릭 시 BoardDetail.bo 요청(게시물번호, 페이지번호 파라미터로 전달) -->
						<a href="CodingDetail.code?num=<%=articleList.get(i).getNum()%>&page=<%=nowPage%>">
							<%=articleList.get(i).getSubject() %>
						</a>
					</td>
					<td ><%=articleList.get(i).getNickname() %></td>
					<%if(articleList.get(i).getDate().compareTo(today)==0){ //날짜가 같으면 %> 
						<td ><%=articleList.get(i).getTime()%> <!-- 시간출력 --></td>
					<%}else{ %>
					<td id="date"><%=articleList.get(i).getDate()%></td>
					<%} %>
					<td ><%=articleList.get(i).getReadcount() %></td>
				</tr>
			<%} 
			}%>
                             	 	</tbody>
                             	 </table>
                                </div>
                            </div>
                            <div class="text-right">
                            <button type="button" class="bs_btn btn-info" onclick="location.href='CodingWriteForm.code'">글쓰기</button>
                            </div>
                            </div>
                        </div>
                    </div>


		
		<!-- END .gtco-services -->

		<!-- footer page -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- footer page -->

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
		
	</div>
		
		
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="js/chart-area-demo.js"></script>
    <script src="js/chart-bar-demo.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="js/datatables-demo.js"></script>
		
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
	
	</body>
</html>

