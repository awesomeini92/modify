<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function () {
	submitId = false;
	submitNickname = false;
	$('#pwDupChkResult_ture').hide();
	$('#pwDupChkResult_false').hide();
	
	// 아이디 중복체크
	$('.idDup').click(function() {
		var idValue = $('#id').val();
		if (idValue == "") {
			alert("아이디 입력하세요");
			$('#id').focus();
			return;
		} 
		
		$.ajax({
			url: "/The_First/idDupCheck.me?id=" + idValue,
			type: "GET",
			success: function(count) {
				if (count == 1) {
					alert('ID 중복');
				} else {
					alert('ID 사용가능');
					submitId = true;
				}
			}
		});
	});
	
	// 닉네임 중복체크
	$('.nicknameDup').click(function() {
		var nicknameValue = $('#nickname').val();
		if (nicknameValue == "") {
			alert("닉네임 입력하세요");
			$('#nickname').focus();
			return;
		}
		$.ajax({
			url: "/The_First/nicknameDupCheck.me?nickname=" + nicknameValue,
			type: "GET",
			data: {
				nickname: nicknameValue
			},
			success: function(count) {
				if (count == 1) {
					alert('Nickname 중복');
				} else {
					alert('Nickname 사용가능');
					submitNickname = true;
				}
			}
		});
	});

	// pw 일치여부 
	$('input').keyup(function() {
		var pw1 = $('#password').val();
		var pw2 = $('#pwCheck').val();
		
		if (pw1 != "" || pw2 != "") {
			if (pw1 !== pw2) {
				$('#pwDupChkResult_ture').hide();
				$('#pwDupChkResult_false').show();
			} else {
				$('#pwDupChkResult_ture').show();
				$('#pwDupChkResult_false').hide();
			}
		}
		
	});
	
	// 중복체크 했는지 유무 판단
	$('#submit').click(function () {
			if (submitId == false) {
				alert('아이디 중복체크를 해주세요');
				return false;
			} else if (submitNickname == false) {
				alert('닉네임 중복체크를 해주세요');
				return false;
			} else if (passRegex == false) {
				alert('패스워드는 8~16자리 영문,숫자 조합');
				return false;
			} else if (sumbitId == true && submitNickname == true) {
				$("#form").submit();
			}
		});
		
});
	

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
 
</script>
</head>
<body>
	<section>
		<h1>회원가입</h1>
		<form action="JoinPro.me" method="post" id="form">
			<fieldset>
				<table>
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="id" id="id" required="required" placeholder="4~12자리 영문,숫자 조합" onkeyup="checkId(this)"> 
							<span id="checkIdResult"></span> 
							<input type="button" value="dup. check" class="idDup">
							<div id="idDupcheck"></div><br>
						</td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td>
							<input type="text" name="nickname" id="nickname"required="required"> 
							<input type="button" value="dup. check" class="nicknameDup">
							<div id="nicknameDupcheck"></div><br>
						</td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td>
							<input type="password" name="password" id="password" required="required" placeholder="8~16자리 영문,숫자 조합" onkeyup="checkPassword(this)"> 
							<span id="checkPasswordResult"></span>
						</td>
					</tr>
					<tr>
						<td>패스워드 확인</td>
						<td>
						<input type="password" name="passwordCheck" id="pwCheck" required="required" placeholder="8~16자리 영문,숫자 조합"> 
							<span id="pwCheckResult"></span>
							<span id="pwDupChkResult_ture">패스워드 일치</span>
							<span id="pwDupChkResult_false">패스워드 불일치</span>
						</td>
					</tr>
					<tr>
						<td>email</td>
						<td>
							<input type="text" name="email" id="email" required="required">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="회원가입" id="submit" />
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