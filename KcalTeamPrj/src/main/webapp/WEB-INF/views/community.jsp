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
	<link rel="stylesheet" href="${path}/css/community.css" />
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="community_header.jsp"></jsp:include>
		<div class="adNLogin">
            <div class="ad">
                <img src="${path}/images/main/ad.jpg" alt="">
            </div>
            
            <c:if test="${empty sessionScope.account}">
                <div class="login">
	                <p>로그인 후 자유롭게 이용하세요</p>
	                <button class="changeBtn">로그인</button>
            	</div>
            	
            	<div class="loginSubmit">
	                <div class="loginSiteName">
	                    <p>Kcal Dynamite</p>
	                </div>
	                <form action="${path}/community/login" id="loginPass" method="post">
	                    <div class="idWrite">
	                        <label for="id">아이디</label>
	                        <input type="text" id="id" name="id">
	                    </div>
	                    <div class="pwWrite">
	                        <label for="password">비밀번호</label>
	                        <input type="password" id="password" name="password">
	                    </div>
	                    <div class="logBtnBox">
                        	<button class="logBtn">로그인</button>
                    	</div>
	                </form>
	                <div class="supportBox">
	                    <p id="goJoinMember"><i class="fas fa-address-card"></i><span> 회원가입</span></p>
	                    <p id="goFindId"><i class="fas fa-search"></i><span> 아이디 찾기</span></p>
	                    <p id="goFindPw"><i class="fas fa-key"></i><span> 비밀번호 찾기</span></p>
	                </div>
	            </div>
            </c:if>
            
        	<c:if test="${!empty sessionScope.account}">
                <div class="loginAfter">
	                <div class="logout">
	                    <p>${sessionScope.account.nickname}</p>
	                    <p id="logoutBtn">로그아웃</p>
	                </div>
                
	                <div class="profileLine">
	                    <div class="profileImage">
		                    <c:if test="${empty sessionScope.account.img_servername}">
		                        <img src="${path}/images/myprofile/default-profile.png" alt="">
	                        </c:if>
	                        <c:if test="${!empty sessionScope.account.img_servername}">
		                        <img src="${path}/images/myprofile/${sessionScope.account.img_servername}" alt="">
	                        </c:if>
	                    </div>
	                    <div class="profileBtns">
	                        <button id="goProfile">프로필</button>
	                        <button id="goMypage">마이페이지</button>
	                        <button id="goLetter">쪽지함</button>
	                    </div>
	                </div>
            	</div>
            </c:if>
        </div>

        <div class="peopleBox">
            <div class="pTitle">
                <p>실시간 피플</p>
            </div>
        </div>

        <div class="peopleList">
            <ul>
                <li class="randomProfile" data-nickname="${randomList[0].nickname}">
                	<span class="rprofileImg">
	                	<c:if test="${empty randomList[0].img_servername}">
	                		<img src="${path}/images/myprofile/default-profile.png" alt="" />
	                	</c:if>
	                	<c:if test="${!empty randomList[0].img_servername}">
	                		<img src="${path}/images/myprofile/${randomList[0].img_servername}" alt="" />
	                	</c:if>  
                	</span>              
                    <p>${randomList[0].nickname}</p>
                    <ul>
                        <li>팔로우<span> ${randomList[0].followingCnt}</span></li>
                        <li>팔로워<span> ${randomList[0].followerCnt}</span></li>
                    </ul>
                </li>
                <li class="randomProfile" data-nickname="${randomList[1].nickname}">
                	<span class="rprofileImg">
	                    <c:if test="${empty randomList[1].img_servername}">
	                		<img src="${path}/images/myprofile/default-profile.png" alt="" />
	                	</c:if>
	                	<c:if test="${!empty randomList[1].img_servername}">
	                		<img src="${path}/images/myprofile/${randomList[1].img_servername}" alt="" />
	                	</c:if>  
	                </span>              
                    <p>${randomList[1].nickname}</p>
                    <ul>
                        <li>팔로우<span> ${randomList[1].followingCnt}</span></li>
                        <li>팔로워<span> ${randomList[1].followerCnt}</span></li>
                    </ul>
                </li>
                <li class="randomProfile" data-nickname="${randomList[2].nickname}">
                	<span class="rprofileImg">
	                    <c:if test="${empty randomList[2].img_servername}">
	                		<img src="${path}/images/myprofile/default-profile.png" alt="" />
	                	</c:if>
	                	<c:if test="${!empty randomList[2].img_servername}">
	                		<img src="${path}/images/myprofile/${randomList[2].img_servername}" alt="" />
	                	</c:if>
	                </span>                
                    <p>${randomList[2].nickname}</p>
                    <ul>
                        <li>팔로우<span> ${randomList[2].followingCnt}</span></li>
                        <li>팔로워<span> ${randomList[2].followerCnt}</span></li>
                    </ul>
                </li>
                <li class="randomProfile" data-nickname="${randomList[3].nickname}">
                	<span class="rprofileImg">
	                    <c:if test="${empty randomList[3].img_servername}">
	                		<img src="${path}/images/myprofile/default-profile.png" alt="" />
	                	</c:if>
	                	<c:if test="${!empty randomList[3].img_servername}">
	                		<img src="${path}/images/myprofile/${randomList[3].img_servername}" alt="" />
	                	</c:if>  
	                </span>              
                    <p>${randomList[3].nickname}</p>
                    <ul>
                        <li>팔로우<span> ${randomList[3].followingCnt}</span></li>
                        <li>팔로워<span> ${randomList[3].followerCnt}</span></li>
                    </ul>
                </li>
                <li class="randomProfile" data-nickname="${randomList[4].nickname}">
                	<span class="rprofileImg">
	                    <c:if test="${empty randomList[4].img_servername}">
	                		<img src="${path}/images/myprofile/default-profile.png" alt="" />
	                	</c:if>
	                	<c:if test="${!empty randomList[4].img_servername}">
	                		<img src="${path}/images/myprofile/${randomList[4].img_servername}" alt="" />
	                	</c:if> 
	                </span>               
                    <p>${randomList[4].nickname}</p>
                    <ul>
                        <li>팔로우<span> ${randomList[4].followingCnt}</span></li>
                        <li>팔로워<span> ${randomList[4].followerCnt}</span></li>
                    </ul>
                </li>
                <li class="randomProfile" data-nickname="${randomList[5].nickname}">
                	<span class="rprofileImg">
	                    <c:if test="${empty randomList[5].img_servername}">
	                		<img src="${path}/images/myprofile/default-profile.png" alt="" />
	                	</c:if>
	                	<c:if test="${!empty randomList[5].img_servername}">
	                		<img src="${path}/images/myprofile/${randomList[5].img_servername}" alt="" />
	                	</c:if>
	                </span>                
                    <p>${randomList[5].nickname}</p>
                    <ul>
                        <li>팔로우<span> ${randomList[5].followingCnt}</span></li>
                        <li>팔로워<span> ${randomList[5].followerCnt}</span></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="bbsHotBox">
            <div class="bTitle">
                <p>최신글</p>
            </div>
        </div>

        <div class="bbsBox">
        	<div id="free">
        		<div class="titleCon">
        			<span class="cateTitle">자유게시판</span>
        			<span class="more" data-category="free">더보기&nbsp;<i class="fas fa-plus"></i></span>
        		</div>
        		<ul id="freeList">
        			<li class="bbsTitle" data-bnum="${free[0].bnum}">${free[0].title}</li>
        			<li class="bbsTitle" data-bnum="${free[1].bnum}">${free[1].title}</li>
        			<li class="bbsTitle" data-bnum="${free[2].bnum}">${free[2].title}</li>
        			<li class="bbsTitle" data-bnum="${free[3].bnum}">${free[3].title}</li>
        			<li class="bbsTitle" data-bnum="${free[4].bnum}">${free[4].title}</li>
        		</ul>
        	</div>
        	
        	<div id="question">
        		<div class="titleCon">
        			<span class="cateTitle">고민&질문</span>
        			<span class="more" data-category="question">더보기&nbsp;<i class="fas fa-plus"></i></span>
        		</div>
        		<ul id="questionList">
        			<li class="bbsTitle" data-bnum="${question[0].bnum}">${question[0].title}</li>
        			<li class="bbsTitle" data-bnum="${question[1].bnum}">${question[1].title}</li>
        			<li class="bbsTitle" data-bnum="${question[2].bnum}">${question[2].title}</li>
        			<li class="bbsTitle" data-bnum="${question[3].bnum}">${question[3].title}</li>
        			<li class="bbsTitle" data-bnum="${question[4].bnum}">${question[4].title}</li>
        		</ul>
        	</div>
        	
        	<div id="tip">
        		<div class="titleCon">
        			<span class="cateTitle">팁&노하우</span>
        			<span class="more" data-category="tip">더보기&nbsp;<i class="fas fa-plus"></i></span>
        		</div>
        		<ul id="tipList">
        			<li class="bbsTitle" data-bnum="${tip[0].bnum}">${tip[0].title}</li>
        			<li class="bbsTitle" data-bnum="${tip[1].bnum}">${tip[1].title}</li>
        			<li class="bbsTitle" data-bnum="${tip[2].bnum}">${tip[2].title}</li>
        			<li class="bbsTitle" data-bnum="${tip[3].bnum}">${tip[3].title}</li>
        			<li class="bbsTitle" data-bnum="${tip[4].bnum}">${tip[4].title}</li>
        		</ul>
        	</div>
        	
        	<div id="review">
        		<div class="titleCon">
        			<span class="cateTitle">다이어트후기</span>
        			<span class="more" data-category="review">더보기&nbsp;<i class="fas fa-plus"></i></span>
        		</div>
        		<ul id="freeList">
        			<li class="bbsTitle" data-bnum="${review[0].bnum}">${review[0].title}</li>
        			<li class="bbsTitle" data-bnum="${review[1].bnum}">${review[1].title}</li>
        			<li class="bbsTitle" data-bnum="${review[2].bnum}">${review[2].title}</li>
        			<li class="bbsTitle" data-bnum="${review[3].bnum}">${review[3].title}</li>
        			<li class="bbsTitle" data-bnum="${review[4].bnum}">${review[4].title}</li>
        		</ul>
        	</div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
	</div>
	
	<script type="text/javascript">
		$(function(){
			// 메뉴탭 클릭
			 let currCategory = "free"; 
			 
	         $(document).on('click', '.menuTab', function(){
	        	 location.href = "${path}/community/bbs?category="+$(this).data("category");	        	 
	         })
	         
	         $(document).ready(function() {
	        	 $('.adNLogin .login').show(); 
	        	 $('.loginSubmit').hide();
	        	 
	        	 $('.changeBtn').click(function(){
		        	 $ ('.adNLogin .login').hide(); 
		        	 $ ('.loginSubmit').show(); 
		        	 return false;
	        	 });
        	 });
	         
	         // 로그아웃
	         $("#logoutBtn").click(function(){
					location.href = '${path}/member/logout';
			 });
	         
	         // 회원가입
	         $("#goJoinMember").click(function(){
					location.href = '${path}/member/createMember';
			 });
	         
	         // ID 찾기
	         /* $("#goFindId").click(function(){
					location.href = '${path}/';
			 }); */
	         
	         // PW 찾기
	         /* $("#goFindPw").click(function(){
					location.href = '${path}/';
			 }); */
	         
	         // 프로필
	         $("#goProfile").click(function(){
					location.href = '${path}/profile/main?nickname=${sessionScope.account.nickname}';
			 }); 
	         
	         // 마이페이지
	         $("#goMypage").click(function(){
			 		location.href = '${path}/member/mypage';
			 });
			 
	         
	         // 쪽지함
	         $("#goLetter").click(function(){
					location.href = '${path}/member/mypage?currTab=letter';
			 });
	         
	         
	         
	         // 최신글 더보기 클릭
	         $(".more").click(function() {
	        	 location.href = "${path}/community/bbs?category=" + $(this).data("category");
	         })
	         
	         // 게시물 제목클릭
        
	         $(document).on('click', '.bbsTitle', function(){
	        	 location.href = "${path}/bbs/detail?bnum=" + $(this).data("bnum");         
	         })
	         
	         
	         // 랜덤프로필 클릭 시 해당 프로필페이지로 이동
	         $(".randomProfile").click(function() {
	        	 location.href = "${path}/profile/main?nickname=" + $(this).data("nickname");
	         })
		
		})
	</script>
</body>
</html>