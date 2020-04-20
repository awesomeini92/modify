<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<h2>쪽지 보내기</h2>
		<form action="TextWrite.te" method="post">
			<table>
				<tr>
					<td>sender</td>
					<td><input type="text" name="sender" value="${sessionScope.nickname}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>receiver</td>
					<td><input type="text" name="receiver" placeholder="receiver" required="required"></td>
				</tr>
				<tr>
					<td>subject</td>
					<td class="td_right"><input type="text" name="subject" placeholder="subject" required="required"></td>
				</tr>
				<tr>
					<td>contents</td>
					<td><textarea name="contents" cols="40" rows="15" placeholder="contents" required="required"></textarea></td>
				</tr>
			</table>
			<section>
				<input type="submit" value="전송">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기">
				<a href="TextList.te?receiver=${sessionScope.nickname }"><input type="button" value="목록"></a>
			</section>
		</form>
	</section>
</body>
</html>