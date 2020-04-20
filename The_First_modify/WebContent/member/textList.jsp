<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>textList</title>
</head>
<body>
	<div class="">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 쪽지함
		</div>

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>sender</th>
							<th>subject</th>
							<th>send_date</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${textList ne null }">
							<c:forEach var="tl" items="${textList }">
								<c:if test="${tl.isChecked eq false}">
									<tr>
										<td>${tl.sender }</td>
										<td><a
											href="TextView.te?idx=${tl.idx }&page=${pageInfo.page}">
												${tl.subject } </a></td>
										<td>${tl.subject  }</td>
										<td>${tl.send_date }</td>
									</tr>
								</c:if>
								<c:if test="${tl.isChecked eq true}">
									<tr bgcolor=#a18962>
										<td>${tl.sender }</td>
										<td><a
											href="TextView.te?idx=${tl.idx }&page=${pageInfo.page}">
												${tl.subject } </a></td>
										<td>${tl.subject  }</td>
										<td>${tl.send_date }</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${textList eq null }">
							<section id="emptyArea">등록된 글이 없습니다.</section>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>

		<section id="pageList">
			<c:if test="${textList ne null }">
				<c:choose>
					<c:when test="${pageInfo.page le 1}">
					[이전] &nbsp; 
				</c:when>
					<c:otherwise>
						<a href="TextList.te?page=${pageInfo.page - 1}&receiver=${sessionScope.nickname}">[이전]</a> &nbsp; 
				</c:otherwise>
				</c:choose>

				<c:forEach var="pi" begin="${pageInfo.startPage }"
					end="${pageInfo.endPage }" step="1">
					<c:choose>
						<c:when test="${pi eq pageInfo.page }">
						[${pi}]
					</c:when>
						<c:otherwise>
							<a href="TextList.te?page=${pi}&receiver=${sessionScope.nickname}">[${pi }] </a>&nbsp;
					</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${pageInfo.page ge pageInfo.maxPage}">
						&nbsp;[다음]
				</c:when>
					<c:otherwise>
						<a href="TextList.te?page=${pageInfo.page + 1}&receiver=${sessionScope.nickname}">
							&nbsp;[다음] </a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</section>


		<div class="text-right">
			<a href=TextWriteForm.te><input type="button" value="쪽지보내기"></a>
		</div>
	</div>
</body>
</html>