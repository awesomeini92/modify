<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<title>Do you have any Questions?</title>

<c:choose>
    <c:when test="${sessionScope.nickname!=null}">
        <header class="text-right">
			${sessionScope.nickname}님이 로그인하셨습니다 | <a href=" Logout.me">로그아웃</a>
	</header>
    </c:when>
    <c:otherwise>
        <header class="text-right">
			<a href=" LoginForm.me">로그인</a> | 	<a href=" JoinForm.me">회원가입</a>
		</header>
    </c:otherwise>
</c:choose>
