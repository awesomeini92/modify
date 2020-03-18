<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="joinFormArea">
		<h1>회원가입</h1>
		<form action="JoinPro.me" method="post" name="joinForm" onsubmit="return checkForm()">
			<fieldset>
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" required="required"></td>
					</tr>
					<tr>
						<td>아이디</td>
						<!-- 키를 눌렀다 뗄 경우 checkId() 함수 호출(입력 텍스트 전달) -->
						<td><input type="text" name="id" required="required" 
								placeholder="4~12자리 영문,숫자 조합" onkeyup="checkId(this)">
							<span id="checkIdResult"><!--  자바스크립트에 의해 메세지 출력할 공간 --></span>		
						</td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td><input type="text" name="password" required="required" 
						placeholder="8~16자리 영문,숫자,특수문자 조합" onkeyup="checkPasswd(this)">
							<span id="checkPassResult"><!--  자바스크립트에 의해 메세지 출력할 공간 --></span>	
						</td>
					</tr>
					<tr>
						<td>E-Mail</td>
						<td><input type="text" name="email" required="required"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="회원가입" />
							<input type="button" value="취소" onclick="history.back()" />
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</section>
</body>
</html>