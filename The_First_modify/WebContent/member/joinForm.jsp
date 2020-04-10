<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:if test="${sessionScope.sId != null}">
	<script>
		alert("이미 로그인된 회원입니다");
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
 // 아이디 정규표현식 확인
 // 4~12자리 영문,숫자 조합
	function checkId(id) {
		const regex = /^[A-Za-z0-9][A-Za-z0-9]{3,11}$/;
		const element = document.querySelector('#checkIdResult');
		
		if (regex.exec(id.value)) {
			element.innerHTML = "사용 가능";
		} else {
			element.innerHTML = "사용 불가능";
		}
	}
 
 // 비밀번호 정규표현식 확인 
 // 8~16자리 영문,숫자 조합
 	function checkPassword(password) {
	 	const lengthRegex = /^[A-Za-z0-9]{8,16}$/;
	 	const englishCaseRegex = /[A-Za-z]/;
	 	const digitRegex = /[0-9]/;
	 	
	 	var element = document.querySelector('#checkPasswordResult');
	 	
	 	if (lengthRegex.exec(password.value) && englishCaseRegex.exec(password.value) 
	 			&& digitRegex.exec(password.value)) {
			element.innerHTML = "적합한 패스워드";
		} else {
			element.innerHTML = "부적합한 패스워드";
		}
 	}
 
 // 아이디 중복확인
	function dupIdCheck() {
	 
 	}
 
 // 닉네임 중복확인
	function dupNicknameCheck() {
	 
 	}
 
 // 비밀번호 확인
 	function pwCheck(passwordCheck) {
	 
 	}
 
</script>
</head>
<body>
<section>
		<h1>회원가입</h1>
		<form action="JoinPro.me" method="post">
			<fieldset>
				<table>
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="id" id="id" required="required"
							placeholder="4~12자리 영문,숫자 조합" onkeyup="checkId(this)">
							<span id="checkIdResult"></span>
						</td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="nickname" id="nickname" required="required"></td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td>
							<input type="password" name="password" id="password" required="required"
							placeholder="8~16자리 영문,숫자 조합" onkeyup="checkPassword(this)">
							<span id="checkPasswordResult"></span>
						</td>
					</tr>
					<tr>
						<td>패스워드 확인</td>
						<td>
							<input type="password" name="passwordCheck" id="pwCheck" required="required"
							placeholder="8~16자리 영문,숫자 조합" onkeyup="pwCheck(this)">
							<span id="pwCheckResult"></span>
						</td>
					</tr>
					<tr>
						<td>email</td>
						<td><input type="text" name="email" id="email" required="required"></td>
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
	<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('99e4787a897671e1cd06a99afee54577');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
         Kakao.API.request({
            url: '/v2/user/me',
            success: function(res){
//                alert(JSON.stringify(res));
               var id = res.id;
               var email = res.kakao_account.email;
               var nickname = res.kakao_account.profile.nickname;
//                alert("id : " + id + "email : " + email + "nickname : " + nickname);
               //새창을 띄우든 다른페이지로 이동하던지해서 저장이 가능하다함 
               location.href="KakaoJoinPro.kakao?id="+id+"&email="+email+"&nickname="+nickname;
               
            }
         });
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
	
</body>
</html>