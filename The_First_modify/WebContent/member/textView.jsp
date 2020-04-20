<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>textView</title>
</head>
<body>
	<section>
		<h2>쪽지 내용 상세보기</h2>
		<table border="1">
			<tr>
				<td>제목</td>
				<td>보낸사람</td>
				<td>내용</td>
				<td>보낸날짜</td>
			</tr>
			<tr>
				<td>${text.subject}</td>
				<td>${text.sender}</td>
				<td>${text.contents}</td>
				<td>${text.send_date}</td>
			</tr>
		</table>
	</section>

	<section id="commandList">
		<a
			href="TextDelete.te?idx=${text.idx }&page=${page}&receiver=${sessionScope.nickname }">
			<input type="button" value="삭제">
		</a> <a href="TextList.te?receiver=${sessionScope.nickname }"> <input
			type="button" value="목록"></a>
	</section>
</body>
</html>