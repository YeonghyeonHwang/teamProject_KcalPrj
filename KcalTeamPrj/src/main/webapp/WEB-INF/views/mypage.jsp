<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/css/mypage.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<header>
		<div id="logo">
			<img src="${path}/images/logoImg/logo.png" alt="로고">
			<span>확찐자구조대</span>
		</div>
		<div id="header_r">
			<span id="communityHome">커뮤니티홈</span>
			<span id="myProfile">프로필</span>
		</div>
	</header>

	<div id="mypageWrap">
		<ul class="tabs">
			<li class="tabTitle">회원정보관리</li>
			<li class="tab" data-tab="memberInfo"><span><i class="fas fa-users"></i></span>회원정보</li>
			<li class="tab" data-tab="modifyPw"><span><i class="fas fa-lock"></i></span>비밀번호변경</li>
			<li class="tab" data-tab="withdraw"><span><i class="fas fa-sign-out-alt"></i></span>회원탈퇴</li>
			<li class="tabTitle">내 활동관리</li>
			<li class="tab" data-tab="letter"><span><i class="far fa-envelope"></i></span>쪽지함</li>
			<li class="tab" data-tab="myPost"><span><i class="far fa-edit"></i></span>작성글</li>
			<li class="tab" data-tab="myAsk"><span><i class="far fa-comment-dots"></i></span>1:1 문의내역</li>
		</ul>

		<div class="contents">
			<div id="memberInfo" class="content memberCon">
				<span class="subTitle">회원정보</span>
				<table>
					<tr>
						<th>아이디</th>
						<td>${sessionScope.account.id}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password" class="password">
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>${sessionScope.account.nickname}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" value="${sessionScope.account.email}"
							name="email" class="email" required>
							<p class="emailCheckResult"></p> <input type="hidden"
							class="isPossible" value="possible" /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" value="${sessionScope.account.addr1}"
							class="addr addr1" name="addr1" readonly>
							<button type="button" class="findAddr">주소검색</button>
							<br /> <input type="text" value="${sessionScope.account.addr2}"
							class="addr addr2" name="addr2" readonly><br> <input
							type="text" value="${sessionScope.account.addr3}"
							class="addr addr3" name="addr3" required></td>
					</tr>
				</table>
				<div style="text-align:center;"><button type="button" class="modifyMember">회원정보 수정</button></div>
			</div>

			<div id="modifyPw" class="content memberCon">
				<span class="subTitle">비밀번호변경</span>
				<ul>
					<li><span>아이디</span> <span>${sessionScope.account.id}</span></li>
					<li><span>현재 비밀번호</span> <input type="password"
						class="currentPw" required></li>
					<li><span>새 비밀번호</span> <input type="password" class="newPw"
						required></li>
					<li><span>새 비밀번호 확인</span> <input type="password"
						class="newPwConfirm" required></li>
					<li><button type="button" class="modifyPw">변경</button></li>
				</ul>
			</div>

			<div id="withdraw" class="content memberCon">
				<span class="subTitle">회원탈퇴</span>
				<ul>
					<li class="wdNotice">※ 탈퇴 후 복구가 불가능합니다.</li>
					<li><span>아이디</span> <span>${sessionScope.account.id}</span></li>
					<li><span>비밀번호</span> <input type="password"
						class="wdPassword" required></li>
					<li><span>회원탈퇴 입력</span> <input type="text"
						class="confirmWord" placeholder="'회원탈퇴'를 입력해주세요." required>
					</li>
					<li><button type="button" class="withdraw">탈퇴하기</button></li>
				</ul>
			</div>

			<div id="letter" class="content">
				<ul class="letterTabs">
					<li class="ltab" data-tab="receive">받은 쪽지</li>
					<li class="ltab" data-tab="send">보낸 쪽지</li>
				</ul>
				<div class="lcon receive" id="receive"></div>
				<div class="lcon send" id="send"></div>
			</div>

			<div id="myPost" class="content">
				<ul class="myPostTabs">
					<li class="ptab" data-tab="free">자유게시판</li>
					<li class="ptab" data-tab="question">고민 & 질문</li>
					<li class="ptab" data-tab="tip">팁 & 노하우</li>
					<li class="ptab" data-tab="review">다이어트 후기</li>
					<li class="ptab" data-tab="emate">운동메이트</li>
				</ul>
				<table id="postCon">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성일</th>
							<th>조회</th>
							<th>추천</th>
						</tr>
					</thead>
					<tbody id="bbsListCon">
						
					</tbody>
				</table>
				<div id="bbsPageBox"></div>
			</div>

			<div id="myAsk" class="content">
				<span id="askTitle">1:1 문의내역</span>
				<table id="askCon">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody id="askListCon">
						
					</tbody>
				</table>
				<div id="askPageBox"></div>
			</div>
		</div>
	</div>
	
	<div id="letterModalBg">
		<div id="letterModal">
			<span id="letterCloseBtn"><i class="far fa-times-circle fa-2x"></i></span>
			<ul>
				<li id="letter-date"></li>
				<li id="letter-nickname"></li>
				<li id="letter-title"></li>
				<li>
					<textarea rows="17" id="letter-content" disabled></textarea>
				</li>
				<li><button type="button" id="replyBtn">답장</button></li>
			</ul>
		</div>
	</div>
	
	<div id="sendLetterBg">
		<form action="${path}/letter/replyLetter" id="sendLetterModal" method="POST">
			<span id="sendCloseBtn"><i class="far fa-times-circle fa-2x"></i></span>
			<ul>
				<li><span>받는이</span><input type="text" id="reply-recipient" name="rnick" readonly/></li>
				<li><input type="text" id="reply-title" name="title" placeholder="제목"/></li>
				<li><textarea rows="17" id="reply-content" name="content" placeholder="내용"></textarea></li>
				<li><button type="button" id="replySubmit">전송</button></li>
			</ul>
			<input type="hidden" name="snick" value="${sessionScope.account.nickname}" />
		</form>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript">
		$(function(){
			//로고 클릭
			$("#logo").click(function(){
				location.href = "${path}/index";
			})
			
			// 커뮤니티홈 클릭
	         $("#communityHome").click(function(){
	        	 location.href = "${path}/community/main";
	         })

	         // 마이프로필 클릭
	         $("#myProfile").click(function(){
	        	 location.href = "${path}/profile/main?nickname=${sessionScope.account.nickname}";
	         })
	        
			
			$(".tab[data-tab='${currTab}']").addClass("selected");
            $("#${currTab}").addClass("selected");
			
	        // 사이드메뉴 클릭시  
	        $(".tabs .tab").click(function(){
	        	
	            let tabId = $(this).attr("data-tab");
	
	            $(".tabs .tab").removeClass("selected");
	            $(".content").removeClass("selected");
	
	            $(this).addClass("selected");
	            $("#"+tabId).addClass("selected");
	        });
	        
	       
	        
	        // 쪽지리스트 부르는 함수
	        let getLetter = function(rnum, snum){
	        	$.ajax({
		        	url: "${path}/letter/letterList",
		        	type: "GET",	
		        	dataType : "text",
		        	data: { "nickname" : "${sessionScope.account.nickname}",
		        			"rnum" : rnum,
		        			"snum" : snum
		        	},
		        	success: function(result) {		        		
		        		let html = jQuery('<div>').html(result);
		        		let rl = html.find("div#rl").html(); 
		        		let sl = html.find("div#sl").html(); 
		        		$("#receive").html(rl);
		        		$("#send").html(sl);
		        	},
		        	error: function(result) {
		        		alert("error");
		        	}
		        })
	        }
	        
	        // 
	        getLetter(1,1);
	        $(".ltab[data-tab='receive']").addClass("selected");
            $("#receive").addClass("selected");
	        
	     // 쪽지함 클릭
	        $(".tab[data-tab='letter']").click(function(){
	        	$(".letterTabs .ltab").removeClass("selected");
	            $(".lcon").removeClass("selected");
	            
	            $(".ltab[data-tab='receive']").addClass("selected");
	            $("#receive").addClass("selected");
		        
		        getLetter(1,1);
	        });	        
	            
	        
	       // 받은쪽지함 페이징 
	        $(document).on('click', '#r_preBlock', function(){ 
	        	rminBlock = parseInt($("#r_minBlock").val());
	        	rnum = rminBlock-1; 
	        	getLetter(rnum, 1);
	        })
	        $(document).on('click', '#r_pre', function(){ 
	        	rnum = parseInt($(".r_currPage").text())-1;
	        	getLetter(rnum, 1);
	        })
	        $(document).on('click', '.r_page', function(){ 
	        	rnum = $(this).text();	        	
	        	getLetter(rnum, 1);
	        })
	        $(document).on('click', '#r_next', function(){ 
	        	rnum = parseInt($(".r_currPage").text())+1;
	        	getLetter(rnum, 1);
	        })
	        $(document).on('click', '#r_nextBlock', function(){ 
	        	rmaxBlock = parseInt($("#r_maxBlock").val());
	        	rnum = rmaxBlock+1; 
	        	getLetter(rnum, 1);
	        })
	        
	        // 보낸쪽지함 페이징
	        $(document).on('click', '#s_preBlock', function(){ 
	        	sminBlock = parseInt($("#s_minBlock").val());
	        	snum = sminBlock-1; 
	        	getLetter(1, snum);
	        })
	        $(document).on('click', '#s_pre', function(){ 
	        	snum = parseInt($(".s_currPage").text())-1;
	        	getLetter(1, snum);
	        })
	        $(document).on('click', '.s_page', function(){ 
	        	snum = $(this).text();	        	
	        	getLetter(1, snum);
	        })
	        $(document).on('click', '#s_next', function(){ 
	        	snum = parseInt($(".s_currPage").text())+1;
	        	getLetter(1, snum);
	        })
	        $(document).on('click', '#s_nextBlock', function(){ 
	        	smaxBlock = parseInt($("#s_maxBlock").val());
	        	snum = smaxBlock+1; 
	        	getLetter(1, snum);
	        })
	        
	        
	        // 쪽지 하위탭	        
	        $(document).on('click', '.letterTabs .ltab', function(){
	        	let tabId = $(this).attr("data-tab");
	        	
	        	$(".letterTabs .ltab").removeClass("selected");
	            $(".lcon").removeClass("selected");
	            
	            $(this).addClass("selected");
	            $("#"+tabId).addClass("selected");
	            
	            getLetter(1,1);	            
	        });
	       
	       
	       // 체크한 쪽지 삭제
	       $(document).on('click', '.letterDelete', function(){
	    	   let chkLetter = [];
	    	   $('input[name="delete"]:checked').each(function(){
	               chkLetter.push($(this).val());
	           });

	    	   if(chkLetter.length == 0) {
	    		   alert("선택한 쪽지가 없습니다.");
	    	   }else {
		    	   let ldConfirm = confirm("선택한 쪽지를 삭제하시겠습니까?");
		    	   if(ldConfirm) {
		    		   $.ajax({
			    		   url: "${path}/letter/deleteLetter",	
			    		   traditional: true,
		                   type:   "POST",
		                   data: { "deleteLetterList" : chkLetter },
		                   success: function(data){
		                	   getLetter(parseInt($(".r_currPage").text()), parseInt($(".s_currPage").text()));
		                	   alert("선택한 쪽지 " + data + "개가 삭제되었습니다.");
		                   },
		                   error: function(data) {
		                	   alert("error");
		                   }
			    	   })
	    	   		}
		       }   
	       })
	       
	       // 쪽지제목 클릭시 읽음 업데이트
	       $(document).on('click', '.readLetter', function(){
	    	   let lnum = parseInt($(this).attr("data-lnum"));
	    	   
	    	   $.ajax({
	    		   url: "${path}/letter/readLetter",
                   type:   "POST",
                   data: { "lnum" : lnum },
                   success: function(data){
                	   if(data != 0) {
	                	    $("td[data-lnum="+data+"]").css("color", "#ccc");                		   
                	   }
                   },
                   error: function(data) {
                	   alert("error");
                   }
	    	   })
	       })
	       
	       // 쪽지제목 클릭시 쪽지 모달창
	       $(document).on('click', '.letterTitle', function(){
	    	   let lnum = parseInt($(this).attr("data-lnum"));
	    	   
	    	   $("#letterModalBg").css("display","block");
	    	   
	    	   $.ajax({
	    		   url: "${path}/letter/letterDetail",
                   type:   "POST",
                   data: { "lnum" : lnum },
                   dataType : "json",
                   success: function(letter){
                	    $("#letter-nickname").empty();
                	    $("#letter-date").empty();
						$("#letter-title").empty();
						$("#letter-content").empty();
                	   
						if(letter.snick == "${sessionScope.account.nickname}") {
							$("#letter-nickname").append("<span>받는이</span>" + letter.rnick);	
							$("#replyBtn").css("display", "none");
						}
						if(letter.rnick == "${sessionScope.account.nickname}") {
							$("#letter-nickname").append("<span>보낸이</span><span id='lmSnick'>" + letter.snick + "</span>");	
							$("#replyBtn").css("display", "inline-block");
						}
						$("#letter-date").append("<span>날짜</span>" + letter.date);
						$("#letter-title").append("<span>제목</span>" + letter.title);
						$("#letter-content").append(letter.content);
                   },
                   error: function(result) {
                	   alert("error");
                   }
	    	   })
	       })
	       
	       // 쪽지보기 모달창 닫기버튼
	       $(document).on('click', '#letterCloseBtn', function(){
	    	   $("#letterModalBg").css("display", "none");
	       })
	       
	       // 쪽지 답장 클릭시 답장 모달창
	       $(document).on('click', '#replyBtn', function(){
	    	   $("#letterModalBg").css("display", "none");
	    	   $("#sendLetterBg").css("display", "block");  
	    	   $("#reply-recipient").val($("#lmSnick").text());
	       })
	       
	       // 쪽지 답장 전송 클릭
	       $(document).on('click', '#replySubmit', function(){
	    	   let send = confirm("쪽지를 전송하시겠습니까?");
	    	   if(send) {
	    		   $.ajax({
	    			   url: "${path}/letter/replyLetter",
	                   type:   "POST",
	                   data: $("#sendLetterModal").serialize(), 
	                   success: function(data){
	                	   if(data == "s") {
	                		   alert("쪽지를 성공적으로 전송했습니다.");
				    		   $("#sendLetterBg").css("display", "none");
				    		   $("#reply-title").val("");
				    		   $("#reply-content").val("");				    		   
	                	   }else {
	                		   alert("error");
	                	   }
	                   }
	    		   })
	    		   
	    	   }
	       })
	       
	       // 쪽지 답장 모달창 닫기버튼
	       $(document).on('click', '#sendCloseBtn', function(){
	    	   $("#sendLetterBg").css("display", "none");
	    	   $("#reply-title").val("");
    		   $("#reply-content").val("");
	       })
	       
	       // 쪽지함 리스트 닉네임 클릭
	       $(document).on('click', '.lnickname', function(){
	    	   location.href = "${path}/profile/main?nickname=" + $(this).data("nickname");
	       })
	       
	       
	        // 주소검색 클릭시 주소찾기 팝업
	        $(".findAddr").click(function() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    $(".addr1").val(data.zonecode);
	                    $(".addr2").val(data.roadAddress);
	                }
	            }).open();
	        });
	       
	        
	        // 이메일 중복 실시간 확인
	        $(".email").on("keyup", function(){
	        	let email = $(".email").val();
	        	
	        	if(email == "") {
	        		$(".emailCheckResult").text("이메일을 입력해주세요.");
	        		$(".emailCheckResult").css("color", "red");
	        	}else {
		        	$.ajax({
		        		url: "${path}/member/checkEmail",
		        		type: "POST",
		        		data: {
		        			"email" : email,
		        			"id" : "${sessionScope.account.id}"
		        		},	        		
		        		success: function(data) {
		        			if(data == "possible") {
		        				$(".emailCheckResult").text("사용가능한 이메일입니다.");
		        				$(".emailCheckResult").css("color", "royalblue");
		        				$(".isPossible").val(data);
		        			}else {
		        				$(".emailCheckResult").text("이미 사용중인 이메일입니다.");
		        				$(".emailCheckResult").css("color", "red");
		        				$(".isPossible").val(data);
		        			}
		        		}
		        	})	        		
	        	}	        	
	        });	
	        
	        
	        // 회원정보수정
	        $(".modifyMember").click(function(){	
	        	let data = {
	        			"unum" : ${sessionScope.account.unum},
	        			"email" : $(".email").val(),
	        			"addr1" : $(".addr1").val(),
	        			"addr2" : $(".addr2").val(),
	        			"addr3" : $(".addr3").val()
	        	}	
	        	
	        	if($(".addr3").val() == "") {
	        		alert("상세주소를 입력해주세요.");
	        	}else if(($(".isPossible").val() == "impossible") || ($(".email").val() == "")) {
	        		alert("이메일 입력란을 확인해주세요.");
	        	}else if($(".password").val() != "${sessionScope.account.password}") {
	        		alert("비밀번호가 일치하지 않습니다.");
	        	}else {
	        		$.ajax({
		        		url: "${path}/member/updateMember",
		        		type: "POST",	
		        		data: JSON.stringify(data),
		                dataType : 'json',
		                contentType : 'application/json; charset=UTF-8',
		        		success: function(data) {
		        			location.href = "${path}/member/mypage?currTab=memberInfo";
		        			alert("회원정보가 수정되었습니다.");
		        		},
		        		error: function(data) {
		        			alert("error");
		        		}
		        	})
	        	}
	        })
	        
	        
	        // 비밀번호 수정
	        $(".modifyPw").click(function(){
	        	let data = {
	        			"unum" : ${sessionScope.account.unum},
	        			"password" : $(".newPw").val()
	        			}
	        	
	        	if($(".currentPw").val() != "${sessionScope.account.password}") {
	        		alert("현재 비밀번호를 정확하게 입력해주세요.");
	        	}else if(($(".newPw").val() == "") || ($(".newPwConfirm").val() == "") || ($(".newPw").val() != $(".newPwConfirm").val())) {
	        		alert("새 비밀번호가 일치하지 않습니다.")	;
	        	}else {
	        		$.ajax({
		        		url: "${path}/member/updateMember",
		        		type: "POST",	
		        		data: JSON.stringify(data),
		                contentType : 'application/json; charset=UTF-8',
		                dataType : 'json',
		        		success: function(data) {
		        			location.href = "${path}/member/mypage?currTab=modifyPw";
		        			
		        			alert("비밀번호가 수정되었습니다.");
		        		},
		        		error: function(data) {
		        			alert("error");
		        		}
		        	})
	        	}
	        })
	        
	        
	        // 회원탈퇴	        
	        $(".withdraw").click(function(){
	        	if($(".wdPassword").val() != "${sessionScope.account.password}") {
	        		alert("비밀번호가 일치하지 않습니다.");
	        	}else if($(".confirmWord").val() != "회원탈퇴") {
	        		alert("탈퇴문구를 정확히 입력하세요.");
	        	}else {
	        		let result = confirm("탈퇴하시겠습니까?");
	        		if(result) {      			
		        		location.href = "${path}/member/deleteMember";	        			
	        		}
	        	}
	        })
	        
	        // 작성글 불러오는 함수
	        let getMyPost = function(category, pageNum){
	        	$("#bbsListCon").empty();
	        	$("#bbsPageBox").empty();
	        	const bbsListCon = document.querySelector("#bbsListCon");
	        	const bbsPageBox = document.querySelector("#bbsPageBox");
	        	
	        	/* let categoryName = "";
		        	 if(category == "free") {
		        		 categoryName = "자유게시판"; 
		        	 }else if(category == "question") {
		        		 categoryName = "고민 & 질문"; 		   		        		 
		        	 }else if(category == "tip") {
		        		categoryName = "팁 & 노하우"; 
		        	 }else if(category == "emate") {
		        		categoryName = "운동메이트"; 
		        	 } */
	        	
	        	let data = {
	        			"category" : category,
	        			"unum" : ${sessionScope.account.unum},
	        			"pageNum" : pageNum,
	        			"count" : 10
	        	}
	        	
	        	$.ajax({
	        		url: "${path}/bbs/bbsList",
	        		type: "POST",	
	        		data: data,
	                dataType : 'json',
	        		success: function(data) {
	        			
	        			if(data.postCnt != 0) {

			   	        	 for(let item of data.bbsList) {
			   		        	 const tr = document.createElement("tr");
			   		        	 let titleTd = document.createElement("td");
			   		        	 let dateTd = document.createElement("td");
			   		        	 let viewTd = document.createElement("td");
			   		        	 let recommendTd = document.createElement("td");
			   		        	 
			   		        	 titleTd.setAttribute('data-bnum', item.bnum);
			   		        	 titleTd.setAttribute('class', "bbsTitle");
			   		        	 
			   		        	 titleTd.innerText = item.title;
			   		        	 dateTd.innerText = item.createdate;
			   		        	 viewTd.innerText = item.view_cnt;
			   		        	 recommendTd.innerText = item.recommend;
			   		        	 
			   		       		// 제목 옆에 댓글 수
			   		        	 let replyCnt = document.createElement("span");
			   		        	 replyCnt.innerText = item.replyCnt;
			   		        	 replyCnt.setAttribute('class', "replyCnt");
			   		        	 titleTd.append(replyCnt);
			   		        	 
			   		        	 tr.append(titleTd);
			   		        	 tr.append(dateTd);
			   		        	 tr.append(viewTd);
			   		        	 tr.append(recommendTd);
			   	        		 
			   		        	 bbsListCon.append(tr);
			   	        	 }
			   	        	 
			   	        	 
			   	        	let preBlock = document.createElement("span");
			   	        	 preBlock.innerHTML = '<i class="fas fa-angle-double-left"></i>';
			   	        	 if(data.minBlock-1 >= 1) {
			   	        		preBlock.setAttribute("class", "mpPreBlock");
			   	        		preBlock.setAttribute("data-num", data.minBlock-1);
			   	        		preBlock.setAttribute("data-category", category);
			   	        	 }
		   	        		 bbsPageBox.append(preBlock);
			   	        	 
			   	        	 let prePage = document.createElement("span");
			   	        	 prePage.innerHTML = '<i class="fas fa-angle-left"></i>';
			   	        	 if(data.pageNum != 1) {
			   	        		prePage.setAttribute("class", "mpPrePage");
			   	        		prePage.setAttribute("data-num", data.pageNum-1);
			   	        		prePage.setAttribute("data-category", category);
			   	        	 }
		   	        		 bbsPageBox.append(prePage);
		   	        		 
		   	        		 let maxBlock = 0;
		   	        		 if(data.pageCnt < data.maxBlock) {
		   	        			 maxBlock = data.pageCnt;
		   	        		 }else {
		   	        			 maxBlock = data.maxBlock;
		   	        		 }
		   	        		
		   	        		 for(let i = data.minBlock; i <= maxBlock; i++) {
		   	        			 let page = document.createElement("span");
		   	        			 page.innerText = i;
		   	        			 page.setAttribute("class", "mpPageNum");
		   	        			 page.setAttribute("data-num", i);
		   	        			 page.setAttribute("data-category", category);
		   	        			 if(i == data.pageNum) {
		   	        				 page.style.fontWeight = "bold";
		   	        				 page.style.color = "orangered";
		   	        				 page.style.textDecoration = "underline";
		   	        			 } 
		   	        			bbsPageBox.append(page);
		   	        		 }
	
		   	        		 let nextPage = document.createElement("span");
			   	        	nextPage.innerHTML = '<i class="fas fa-angle-right"></i>';
			   	        	 if(data.pageNum != data.pageCnt) {
			   	        		nextPage.setAttribute("class", "mpNextPage");
			   	        		nextPage.setAttribute("data-num", data.pageNum+1);
			   	        		nextPage.setAttribute("data-category", category);
			   	        	 }
			   	        	bbsPageBox.append(nextPage);
		   	        		 
		   	        		let nextBlock = document.createElement("span");
		   	        		nextBlock.innerHTML = '<i class="fas fa-angle-double-right"></i>';
			   	        	 if(data.maxBlock < data.pageCnt) {
			   	        		nextBlock.setAttribute("class", "mpNextBlock");
			   	        		nextBlock.setAttribute("data-num", data.maxBlock+1);
			   	        		nextBlock.setAttribute("data-category", category);
			   	        	 }
			   	        	bbsPageBox.append(nextBlock);
	        			}else {
	        				const tr = document.createElement("tr");
	        				const noneTd = document.createElement("td");
	        				noneTd.setAttribute("colspan", "4");
	        				noneTd.innerText = "작성글이 없습니다."; 
	        				noneTd.style.textAlign = "center";
	        				noneTd.style.height = "450px";
	        				
	        				tr.append(noneTd);
	        				bbsListCon.append(tr);
	        			}
	   	        		 
	        		},
	        		error: function(data) {
	        			alert("error");
	        		}
	        	})
	        	
	        }
	        
	        // 작성글 페이지 숫자 클릭시
	        $(document).on('click', '.mpPageNum', function(){
   				getMyPost($(this).data("category"), $(this).data("num"));
   			})
   			
   			// 작성글 페이지블럭 <<
   			 $(document).on('click', '.mpPreBlock', function(){
   				getMyPost($(this).data("category"), $(this).data("num"));
   			 })
   			// 작성글 페이지블럭 <
   			 $(document).on('click', '.mpPrePage', function(){
   				getMyPost($(this).data("category"), $(this).data("num"));
   			 })
   			// 작성글 페이지블럭 >
   			 $(document).on('click', '.mpNextPage', function(){
   				getMyPost($(this).data("category"), $(this).data("num"));
   			 })
   			// 작성글 페이지블럭 >>
   			 $(document).on('click', '.mpNextBlock', function(){
   				getMyPost($(this).data("category"), $(this).data("num"));
   			 })
	        
	        // 작성글 클릭
	        $(".tab[data-tab='myPost']").click(function(){	
	        	$(".ptab").removeClass("selected");
	        	$(".ptab[data-tab='free']").addClass("selected");
	        	 getMyPost("free", 1);
	         })
	         
	         // 작성글 하위탭 클릭
	         $(document).on('click', '.myPostTabs .ptab', function(){
	        	 $(".ptab").removeClass("selected");
	        	 $(this).addClass("selected");
	        	 let tabId = $(this).attr("data-tab");
	        	 getMyPost(tabId, 1);
	         })
	         
	         // 작성글 제목 클릭
	         $(document).on('click', '.bbsTitle', function(){
	        	 location.href = "${path}/bbs/detail?bnum=" + $(this).data("bnum");
	         })
	         
	         
	         
	         // 문의글 불러오는 함수
	         let getQnaList = function(pageNum) {
   				$("#askListCon").empty();
	        	$("#askPageBox").empty();
	        	const askListCon = document.querySelector("#askListCon");
	        	const askPageBox = document.querySelector("#askPageBox");
	        	
	        	let data = {
	        			"nickname" : "${sessionScope.account.nickname}",
	        			"pageNum" : pageNum
	        	}
	        	
	        	$.ajax({
	        		url: "${path}/cs/csqnaList",
	        		type: "POST",	
	        		data: data,
	                dataType : 'json',
	        		success: function(data) {
	        			
	        			if(data.postCnt != 0) {

			   	        	 for(let item of data.csqnaList) {
			   		        	 const tr = document.createElement("tr");
			   		        	 let titleTd = document.createElement("td");
			   		        	 let nicknameTd = document.createElement("td");
			   		        	 
			   		        	 titleTd.setAttribute('data-seq', item.csqna_seq);
			   		        	 titleTd.setAttribute('class', "csqnaTitle");
			   		        	 
			   		        	 titleTd.innerText = item.title;
			   		        	 nicknameTd.innerText = item.nickname;
			   		        	 
			   		        	 tr.append(titleTd);
			   		        	 tr.append(nicknameTd);
			   	        		 
			   		        	askListCon.append(tr);
			   	        	 }
			   	        	 
			   	        	 
			   	        	let preBlock = document.createElement("span");
			   	        	 preBlock.innerHTML = '<i class="fas fa-angle-double-left"></i>';
			   	        	 if(data.minBlock-1 >= 1) {
			   	        		preBlock.setAttribute("class", "cqPreBlock");
			   	        		preBlock.setAttribute("data-num", data.minBlock-1);
			   	        	 }
		   	        		 askPageBox.append(preBlock);
			   	        	 
			   	        	 let prePage = document.createElement("span");
			   	        	 prePage.innerHTML = '<i class="fas fa-angle-left"></i>';
			   	        	 if(data.pageNum != 1) {
			   	        		prePage.setAttribute("class", "cqPrePage");
			   	        		prePage.setAttribute("data-num", data.pageNum-1);
			   	        	 }
			   	        	askPageBox.append(prePage);
		   	        		 
		   	        		 let maxBlock = 0;
		   	        		 if(data.pageCnt < data.maxBlock) {
		   	        			 maxBlock = data.pageCnt;
		   	        		 }else {
		   	        			 maxBlock = data.maxBlock;
		   	        		 }
		   	        		
		   	        		 for(let i = data.minBlock; i <= maxBlock; i++) {
		   	        			 let page = document.createElement("span");
		   	        			 page.innerText = i;
		   	        			 page.setAttribute("class", "cqPageNum");
		   	        			 page.setAttribute("data-num", i);
		   	        			 if(i == data.pageNum) {
		   	        				 page.style.fontWeight = "bold";
		   	        				 page.style.color = "orangered";
		   	        				 page.style.textDecoration = "underline";
		   	        			 } 
		   	        			askPageBox.append(page);
		   	        		 }
	
		   	        		 let nextPage = document.createElement("span");
			   	        	nextPage.innerHTML = '<i class="fas fa-angle-right"></i>';
			   	        	 if(data.pageNum != data.pageCnt) {
			   	        		nextPage.setAttribute("class", "cqNextPage");
			   	        		nextPage.setAttribute("data-num", data.pageNum+1);
			   	        	 }
			   	        	askPageBox.append(nextPage);
		   	        		 
		   	        		let nextBlock = document.createElement("span");
		   	        		nextBlock.innerHTML = '<i class="fas fa-angle-double-right"></i>';
			   	        	 if(data.maxBlock < data.pageCnt) {
			   	        		nextBlock.setAttribute("class", "cqNextBlock");
			   	        		nextBlock.setAttribute("data-num", data.maxBlock+1);
			   	        	 }
			   	        	askPageBox.append(nextBlock);
	        			}else {
	        				const tr = document.createElement("tr");
	        				const noneTd = document.createElement("td");
	        				noneTd.setAttribute("colspan", "2");
	        				noneTd.innerText = "작성글이 없습니다."; 
	        				noneTd.style.textAlign = "center";
	        				noneTd.style.height = "450px";
	        				
	        				tr.append(noneTd);
	        				askListCon.append(tr);
	        			}
	   	        		 
	        		},
	        		error: function(data) {
	        			alert("error");
	        		}
	        	})
   			 }
	        
   			 
	        getQnaList(1);
	         
	     	// 문의글 페이지 숫자 클릭시
	        $(document).on('click', '.cqPageNum', function(){
	        	getQnaList($(this).data("num"));
   			})
   			// 문의글 페이지블럭 <<
   			 $(document).on('click', '.cqPreBlock', function(){
   				getQnaList($(this).data("num"));
   			 })
   			// 문의글 페이지블럭 <
   			 $(document).on('click', '.cqPrePage', function(){
   				getQnaList($(this).data("num"));
   			 })
   			// 문의글 페이지블럭 >
   			 $(document).on('click', '.cqNextPage', function(){
   				getQnaList($(this).data("num"));
   			 })
   			// 문의글 페이지블럭 >>
   			 $(document).on('click', '.cqNextBlock', function(){
   				getQnaList($(this).data("num"));
   			 })
   			 
   			 
   			 // 문의글 제목 클릭
	         $(document).on('click', '.csqnaTitle', function(){
	        	 location.href = "${path}/cs/detail?csqna_seq=" + $(this).data("seq");
	         })
	        
	    })
	</script>




</body>
</html>