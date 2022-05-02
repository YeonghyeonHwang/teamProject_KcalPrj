<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/cs.css" />
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>

<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>

		<div class="csBox">

			<div class="csImg">
				<img src="${path}/images/menu/csImg.jpg" alt="">

				<div class="csImgMent">
					<p>Customer Service</p>
				</div>

			</div>

			<div class="csContents">
				<div class="csTitle">
					<button class="tabMenu" id="default" onclick="openCity(event, 'csFaq')">FAQ</button>
					<button class="tabMenu" onclick="openCity(event, 'csOne')">1:1문의</button>
				</div>

				<div id="csFaq" class="tabContent">

					<div>

						<ul class="faq">
							<li><input type="checkbox" id="faq-1"> <label
								for="faq-1">회원가입을 다른 소셜 계정으로 가입해도 될까요?</label>

								<div>
									<p>네 가능합니다.</p>
									<p>저희 '확찐자구조대'는 OO, OO, OO, 소셜계정으로도 가입합니다.</p>
								</div></li>

							<li><input type="checkbox" id="faq-2"> <label
								for="faq-2">비회원은 커뮤니티, 게시판 이용이 불가능 한가요?</label>

								<div>
									<p>죄송하지만 불가능합니다.</p>
									<p>커뮤니티, 게시판 안에서의 사건·사고 예방을 위하여 실명제를 하고 있습니다.</p>
									<p>불편하시겠지만 너그러운 이해 부탁드립니다.</p>

								</div></li>
							<li><input type="checkbox" id="faq-3"> <label
								for="faq-3">쪽지 내용이 불건전 하거나 보고싶지 않아요.</label>
								<div>
									<p>먼저 불편을 드려 죄송합니다.</p>
									<p>현재 쪽지함 내의 차단/신고 서비스는 준비 중에 있습니다.</p>
									<p>빠른 시일 내에 준비하도록 노력하겠습니다.</p>

								</div></li>
							<li><input type="checkbox" id="faq-4"> <label
								for="faq-4">프로필을 남에게 보여주고 싶지 않아요.</label>
								<div>
									<p>저희 '확찐자구조대'는 개인정보 혹은 사생활 보호를 위해 비공개 유무를 선택하실 수 있습니다.</p>
									<p>프로필 페이지 내의 '톱니바퀴' 모양을 눌러 설정 확인해주시면 감사드리겠습니다.</p>
								</div></li>
							<li><input type="checkbox" id="faq-5"> <label
								for="faq-5">1:1 문의는 어떤 방식으로 운영 되는건가요?</label>
								<div>
									<p>1:1 문의는 저희 쪽 cs업무실에서 처리는 하는 중 입니다.</p>
									<p>말 그대로 1:1 문의를 위해 많은 직원들이 처리 중에 있으며, 최대한 빠르게 문의에 답변을 드릴 수
										있도록 노력하는 '확찐짜구조대' 가 되겠습니다.</p>
								</div></li>
						</ul>
					</div>
				</div>



				<div id="csOne" class="tabContent">
			 		<div class="oneToOne">
			            <form action="${path}/cs/insertCsqna?curPage=curCs" id="goQuestion" method="post">
			                <ul>
			                    <li>
			                        <p>1 : 1 문의하기</p>
			                    </li>
			                    <li>
			                        <label for="">아이디</label>
			                        <input type="text" name="nickname" id="nickname">
			                    </li>
			                    <li>
			                        <label for="">제목</label>
			                        <input type="text" name="title" id="title">
			                    </li>
			                    <li>
			                        <label for="">내용</label>
			                        <textarea type="text" name="contents" id="contents"></textarea>
			                    </li>
			                    <li>
			                    	<c:if test="${!empty sessionScope.account}">
						                <div>
			                            	<button type="button" id="sBtn">작성완료</button>
			                        	</div>
						            </c:if>
						            <c:if test="${empty sessionScope.account}">
						                <div>
			                            	<p><a href="${path}/member/goLogin">로그인</a>이 필요한 서비스입니다.</p>
			                        	</div>
						            </c:if>
			                    </li>
			                </ul>
			            </form>
			        </div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript">
	$(document).on('click', '#sBtn', function(){			
		
		if ($("#title").val() == "") {
			alert('제목을 입력해주세요.');
		} else if ($('#nickname').val() == "") {
			alert('내용을 입력해주세요.');
		} else if ($('#contents').val() == "") {
			alert('내용을 입력해주세요.');
		} else {
			let chk = confirm("작성완료 하시겠습니까?"); 
			if(chk) {
				$("#goQuestion").submit();
			}
		}
		
	});
	
	function openCity(evt, openMenu) {
        let i, tabcontent, tabMenu;

        tabContent = document.getElementsByClassName('tabContent');
        for (i = 0; i < tabContent.length; i++) {
            tabContent[i].style.display = "none";
        }

        tabMenu = document.getElementsByClassName('tabMenu');
        for (i = 0; i < tabMenu.length; i++) {
            tabMenu[i].className = tabMenu[i].className.replace(' active', '');
        }

        document.getElementById(openMenu).style.display = 'block';
        evt.currentTarget.className += ' active';
    }
	
	document.getElementById('default').click();
	

	/* const title = document.getElementById('nickname');
	const title = document.getElementById('title');
	const title = document.getElementById('contents');
	const goQuestion = document.getElementById('goQuestion');

	document.getElementById('sBtn').addEventListener('click', function() {
		if (nickname.value == "" && title.value == "" && contents == "") {
			alert('닉네임, 제목, 문의내용을 입력해주세요');
			return;
		}
		
		if (nickname.value == "") {
			alert('닉네임 입력해주세요');
			return;
		}
		
		if (title.value == "") {
			alert('제목을 입력해주세요');
			return;
		}
		
		if (contents == "") {
			alert('내용을 입력해주세요');
			return;
		} 
		
		if (nickname.value =! "" && title.value != "" && contents != "") {
			alert('작성되었습니다.')
			
			goQuestion.submit();
		} 
    }); */
	
	
 
	</script>
	


</body>
</html>