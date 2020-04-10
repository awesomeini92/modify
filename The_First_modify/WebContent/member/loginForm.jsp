<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<section id="loginFormArea">
		<h1>로그인</h1>
		<form action="LoginPro.me" method="post" name="loginForm">
			<fieldset>
				<table>
					<tr>
						<td>
							<label for="id">아이디 : </label>
						</td>
						<td>
							<input type="text" name="id">
						</td>
					</tr>
					<tr>
						<td>
							<label for="id">패스워드 : </label>
						</td>
						<td>
							<input type="password" name="password">
						</td>
					</tr>
				</table>
				<input type="submit" value="로그인">
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
               var nickname = res.kakao_account.nickname;
               alert("id : " + id + "email : " + email + "nickname : " + nickname);
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
