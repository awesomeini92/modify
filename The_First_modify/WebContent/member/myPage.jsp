<%@page import="member.vo.MemberBean"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("sId");
	MemberDAO mdao = MemberDAO.getInstance();
	MemberBean mb = mdao.getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function textCheck() {
	$.ajax({
		url: "/The_First/TextCheck.te",
       		type: "POST",
       	    data: {
			receiver : '${sessionScope.nickname}'
       	 	},
        	success: function (count) {
				if(count > 0) {
				window.open("/The_First/member/textCheck.jsp");
				} 
       		 }
		});
}

	setInterval(hing(), 6000);

</script>
</head>
<body>
<table border="1">
	<tr>
		<td>id</td>
		<td>nickname</td>
		<td>email</td>
		<td>cp</td>
		<td>level</td>
		<td>date</td>
	</tr>
	<tr>
		<td><%=mb.getId() %></td>
		<td><%=mb.getNickname()%></td>
		<td><%=mb.getEmail() %></td>
		<td><%=mb.getCp() %></td>
		<td><%=mb.getLevel() %></td>
		<td><%=mb.getDate() %></td>
	</tr>
</table>
	<a href="UpdateForm.me?id=<%=mb.getId()%>"><input type="button" value="회원수정"></a>
	<a href="TextList.te?receiver=<%=mb.getNickname()%>"><input type="button" value="쪽지함"></a>
</body>
</html>