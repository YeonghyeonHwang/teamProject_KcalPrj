<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/css/default.css" />
	<link rel="stylesheet" href="${path}/css/main_menu_bar.css" />
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
	<header class="header">
		<div id="top">Top</div>
	    <div class="logo">
	        <img src="${path}/images/logoImg/logo.png" alt="">
	        <ul>
	            <li>확찐자구조대</li>
	        </ul>
	    </div>
	    <div class="menuCenter">
	        <ul>
	            <li id='curTip' class='menu tip active' onclick='curPageFn(curTip)'>다이어트 꿀팁</li>
	            <li id='curKcal' class='menu kcal active' onclick='curPageFn(curKcal)'>칼로리 계산기</li>
	            <li id='curNotice' class='menu notice active' onclick='curPageFn(curNotice)'>공지사항</li>
	            <li id='curCs' class='menu cs active' onclick='curPageFn(curCs)'>고객센터</li>
	        </ul>
	    </div>
	    <div class="menuRight">
	        <ul>
	            <li><button id="cmBtn" class="rightBtn community">커뮤니티</button></li>
	        </ul>
	        <ul>
	        	<c:if test="${empty sessionScope.account}">
	                <li id="signUp">회원가입</li>
	                <li id="login">로그인</li>
	            </c:if>
	        	<c:if test="${!empty sessionScope.account}">
	                <li id="mhNickname">${sessionScope.account.nickname}</li>
	                <li id="logout">로그아웃</li>
	            </c:if>
	        </ul>
	    </div>
	    <div class="userBox ubLogin">
			<span id="ubLoginClose"><i class="fas fa-times"></i></span>
			<div id="userImg">
				<c:if test="${empty sessionScope.account.img_servername}">
                		<img src="${path}/images/myprofile/default-profile.png" alt="" />
                </c:if>
                <c:if test="${!empty sessionScope.account.img_servername}">
                		<img src="${path}/images/myprofile/${sessionScope.account.img_servername}" alt="" />
                </c:if>
			</div>
			<div id="userInfo">
				<span id="ubNickname">${sessionScope.account.nickname}</span>
				<span id="letterBox"><i class="fas fa-envelope"></i></span>
			</div>
			<div class="ubBtn myProfile">프로필</div>
			<div class="ubBtn myPage">마이페이지</div>
		</div>
	</header>
 	<script type="text/javascript">
	 	document.getElementById('top').addEventListener('click', function() {
	        window.scrollTo(0,0);
	    });
	 	
	 	let curPageFn = function(cur) {
	 		if (cur === curTip) {
	 			location.href = '${path}/tip/goTip?curPage=curTip';
	 		} else if (cur === curKcal) {
	 			location.href = '${path}/kcal/goKcal?curPage=curKcal';
	 		} else if (cur === curNotice) {
	 			location.href = '${path}/notice/goNotice?curPage=curNotice';
	 		} else if (cur === curCs) {
	 			location.href = '${path}/cs/goCs?curPage=curCs';
	 		}
	 	}
	 	
		$(function(){
			$('.logo').click(function() {
				location.href = '${path}/index';
			});
			
			$("#login").click(function(){
				location.href = '${path}/member/goLogin';
			});
			
			$("#logout").click(function(){
				location.href = '${path}/member/logout';
			});
			
			$('#signUp').click(function() {
				location.href = '${path}/member/createMember'
			});
			
			$("#adBtn").click(function(){
				location.href = '${path}/admin/admin';
			});
			
			$("#cmBtn").click(function(){
				location.href = '${path}/community/main';
			});
			
			
			// 로그인상태-닉네임 클릭
			$(document).on('click', '#mhNickname', function(){
				$(".ubLogin").addClass("clicked");
			})
			
			// 로그인상태-userBox 닫기 클릭
			$(document).on('click', '#ubLoginClose', function(){
				$(".ubLogin").removeClass("clicked");
			})
			
			// 쪽지 아이콘 클릭: 쪽지함 이동
			$(document).on('click', '#letterBox', function(){
				location.href = "${path}/member/mypage?currTab=letter";
			})
						
			// userBox-프로필 클릭
			$(document).on('click', '.myProfile', function(){
				location.href = "${path}/profile/main?nickname=${sessionScope.account.nickname}"; 
			})
				
			// userBox-마이페이지 클릭
			$(document).on('click', '.myPage', function(){
				location.href = "${path}/member/mypage";
			})
			
			
			$('.menu').removeClass('active');
			
			let curPage = "<c:out value = '${param.curPage}' />";
			let selectPage = "#";
			
			$(selectPage + curPage).addClass('active');
			
			
		});
    </script>
</body>
</html>




















