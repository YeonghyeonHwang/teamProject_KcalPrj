<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>확찐자구조대 로그인</title>

<link rel="stylesheet" 
		href="${path}/css/login.css" />

<link rel="stylesheet" 
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap">
	
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
	
<script src="https://kit.fontawesome.com/53a8c415f1.js"
		crossorigin="anonymous">
</script>

<script type="text/javascript"
		src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
		charset="utf-8">
</script>
<script  type="text/javascript">
// 아이디찾기
	$(function(){
		$("#findIdBtn").click(function(){
			 location.href='${path}/member/findIdForm';
		 })
		 
		$("#findPwBtn").click(function(){
			 location.href='${path}/member/findPwForm';
		 })
		 
		$("#signup").click(function(){
			location.href = "${path}/member/createMember";
		})
		
		$("#logo").click(function(){
			location.href = "${path}";
		})
		
		$("#logo").css("cursor", "pointer");
	})
</script>
<!-- <script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "_fHAm9IWt_j7GToBIaC_",
			callbackUrl: "http://127.0.0.1",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>

(1) LoginWithNaverId Javscript SDK
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
 -->

	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<!-- <script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "_fHAm9IWt_j7GToBIaC_",
				callbackUrl: "http://127.0.0.1",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					console.log(email); // 사용자 이메일 정보를 받을수 있습니다.
            		console.log(naverLogin.user); //사용자 정보를 받을수 있습니다.
                    if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}

					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/sample/main.html");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script> -->

</head>

<body>
	<div class="wrap">
		<div class="login">
			<h2 id="logo">확찐자구조대</h2>
		
			<form action="${path}/member/login" method="post">
				<div class="login_id">
					<h4>아이디</h4>
					<input type="id" placeholder="아이디" name="id">
				</div>
				
				<div class="login_pw">
					<h4>비밀번호</h4>
					<input type="password" placeholder="비밀번호" name="password">
				</div>
	
				<div class="login_etc">
					
				</div>
					
				<div class="a_box">
					<ul>
						<li><i class="fas fa-address-card"></i><span id="signup"> 회원가입</span></li>
						<li><i class="fas fa-search"></i><span id="findIdBtn"> 아이디 찾기</span></li>
						<li><i class="fas fa-key"></i><span id="findPwBtn"> 비밀번호 찾기</span></li>
					</ul>
				</div>
	
				<div class="submit">
					<button type="submit">로그인</button>
					<!-- <input type="submit" value="로그인">  -->
				</div>
			</form>
			
			<div class="login_sns">
				<ul>
					<li><i class="fab fa-instagram-square"></i></li>
					<li><i class="fab fa-facebook-square"></i></li>
					<li><i class="fab fa-twitter-square"></i></li>
				</ul>
			</div>

			<div id="naverIdLogin">

			</div>
		</div>
	</div>
</body>
</html>