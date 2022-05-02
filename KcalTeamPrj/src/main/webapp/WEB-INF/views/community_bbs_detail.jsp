<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${path}/css/community_bbs_detail.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="community_header.jsp"></jsp:include>
	
	<div id="wrap">
		<div id="titleBox">
			<div id="category">
				<c:choose>
					<c:when test="${bbsVO.category eq 'free'}">자유게시판</c:when>
					<c:when test="${bbsVO.category eq 'question'}">고민 & 질문</c:when>
					<c:when test="${bbsVO.category eq 'tip'}">팁 & 노하우</c:when>
					<c:when test="${bbsVO.category eq 'review'}">다이어트 후기</c:when>
					<c:when test="${bbsVO.category eq 'emate'}">운동메이트</c:when>	
					<c:when test="${bbsVO.category eq 'cnotice'}">커뮤니티 공지</c:when>	
				</c:choose>
			</div>
			<p id="title">
				<c:if test="${!empty bbsVO.region}">[${bbsVO.region}]</c:if>&nbsp;${bbsVO.title}			
			</p>
			<ul id="bbsInfo">
				<li>
					<a href="${path}/profile/main?nickname=${bbsVO.nickname}" id="ownerNickname">${bbsVO.nickname}</a>
					<span id="createdate">${bbsVO.createdate}</span>
					<span id="viewCnt">조회수 ${bbsVO.view_cnt}</span>
				</li>
				<li id="controllBtns">
					<c:if test="${sessionScope.account.unum eq bbsVO.unum}">
						<button id="modifyBBS">수정</button>
						<button id="deleteBBS">삭제</button>					
					</c:if>
				</li>
			</ul>
		</div>
		<div id="contentBox">
			<p id="content">
				<c:out value="${bbsVO.content}" escapeXml="false" />
			</p>
			<span id="recommend"><i class="fas fa-thumbs-up"></i>&nbsp;&nbsp;<span id="recommendCnt">${bbsVO.recommend}</span></span>
			<span id="backToList"><i class="fas fa-list"></i>&nbsp;&nbsp;목록</span>
		</div>
		<div id="replyBox">
			<p id="replyCnt">댓글 ${bbsVO.replyCnt}개</p>
			<div id="newReply">
				<textarea rows="5" id="reply"></textarea>
				<button id="putReply">댓글 등록</button>
			</div>
			<div id="replyList">
			</div>
		</div>		
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(function(){
			// 현재 카테고리
			let currCategory = "${bbsVO.category}";
			$(".menuTab[data-category="+currCategory+"]").addClass("selected");
			
			// 헤더 탭메뉴 클릭 시
			$(document).on('click', '.menuTab', function() {
				location.href = "${path}/community/bbs?category=" + $(this).data("category");
			})
			
			// 수정버튼 클릭
	        $(document).on('click', '#modifyBBS', function(){
   				location.href = "${path}/bbs/modify?bnum=${bbsVO.bnum}";
   			})
			
			// 삭제버튼 클릭
	        $(document).on('click', '#deleteBBS', function(){
	        	let chk = confirm("삭제하시겠습니까?");
	        	if(chk) {
	   				location.href = "${path}/bbs/delete?bnum=${bbsVO.bnum}&category=${bbsVO.category}";	        		
	        	}
	        	
   			})
   			
   			// 목록버튼 클릭
   			$("#backToList").click(function(){
   				location.href = "${path}/community/bbs?category=${bbsVO.category}";
   			})
   			
   			
   			
   			// 댓글 불러오는 함수
			let getReplyList = function() {
				$.ajax({
					url:"${path}/reply/get/${bbsVO.bnum}",
					type:"GET",
					dataType : "json",
					success : function(data){
						console.log(data);
						$("#replyList").empty();
						const replyList = document.querySelector("#replyList");
						for(const item of data){						
							
							const oneReply = document.createElement("div");
							oneReply.setAttribute("class", "oneReply");
							const rpNickname = document.createElement("span");
							rpNickname.innerText = item.nickname;
							rpNickname.setAttribute("date-nickname", item.nickname);
							rpNickname.setAttribute("class", "rpNickname");
							const rpDate = document.createElement("span");
							rpDate.innerText = item.createdate;
							rpDate.setAttribute("class", "rpDate");
							const rpContent = document.createElement("p");
							rpContent.innerText = item.content;
							rpContent.setAttribute("class", "rpContent");	
							
							
							// 해당 유저가 쓴 댓글일 경우
							if("${sessionScope.account.unum}" == String(item.unum)){
								const replyController = document.createElement("div");
								replyController.setAttribute("class", "replyController");
								
								// 수정 버튼
								const rpModify = document.createElement("span");
								rpModify.innerText = "수정";
								rpModify.setAttribute("class", "rpModify");
								
								rpModify.addEventListener("click", function(){
									
									const editReply = document.createElement("div");
									editReply.setAttribute("class", "editReply");
									const editTA = document.createElement("textarea");
									editTA.setAttribute("class", "editTA");
									editTA.value = rpContent.innerText;
									
									const editController = document.createElement("div");
									editController.setAttribute("class", "editController")
									const editModify = document.createElement("span");
									editModify.innerText = "수정완료";
									editModify.setAttribute("class", "editModify");
									const editCancel = document.createElement("span");
									editCancel.innerText = "취소";
									editCancel.setAttribute("class", "editCancel");
									
									editController.append(editModify);
									editController.append(editCancel);
									editReply.append(editTA);
									editReply.append(editController);
									
									rpContent.after(editReply);
									rpContent.style.display = "none";
									replyController.style.display = "none";
									
								
									// 취소 버튼 클릭 시 이벤트
									editCancel.addEventListener("click", function(){
										rpContent.style.display = "block";
										replyController.style.display = "flex";									
										editReply.remove();
									});
									
									// 수정완료 버튼 클릭 시 이벤트
									editModify.addEventListener("click", function(){
										if(confirm("수정하시겠습니까?")){
											let content = editTA.value;
											
											const modify_data = {content, rnum:item.rnum};
											
											$.ajax({
												url:"${path}/reply/update",
												type:"PATCH",
												data:JSON.stringify(modify_data),
												contentType : "application/json; charset=utf-8",
												dataType : "json",
												success:function(data){
													console.log(data);
													rpContent.innerText = data.content;
													rpContent.style.display = "block";
													replyController.style.display = "flex";
													editReply.remove();
												}
											});
										}
									});
								});
								
								replyController.append(rpModify);
								
								// 삭제 버튼
								const rpDelete = document.createElement("span");
								rpDelete.innerText = "삭제";
								rpDelete.setAttribute("class", "rpDelete");
								
								rpDelete.addEventListener("click", function(){
									let yn = confirm("삭제하시겠습니까?");
									if(yn){
										let reply_data = {rnum:item.rnum};
										
										$.ajax({
											url:"${path}/reply/delete",
											type:"DELETE",
											data:JSON.stringify(reply_data),
											contentType : "application/json; charset=utf-8",
											dataType : "html",
											success:function(data){
												oneReply.remove();
											}
										});
									}
								});
								
								replyController.append(rpDelete);
								
								oneReply.append(replyController);
								
							}
							oneReply.prepend(rpContent);
							oneReply.prepend(rpDate);
							oneReply.prepend(rpNickname);
							
							
							
							replyList.append(oneReply);
						}
					}
				});
			}
   			
			// 댓글 불러오기
			getReplyList();
   			
   			// 댓글입력 클릭 시
   			$("#putReply").click(function(){
   				if("${sessionScope.account.unum}" == "") {
   					alert("댓글작성은 로그인 후 가능합니다.");
   				}else {
   					let content = $("#reply").val();
   					
   					if(content.length > 0){
   						
   						if(confirm("댓글을 등록하시겠습니까?")) {
   							let reply_data = {content, bnum :"${bbsVO.bnum}"};
   	   						
   	   						$.ajax({
   	   							url:"${path}/reply/set",
   	   							type:"POST",
   	   							data:JSON.stringify(reply_data),
   	   							contentType : "application/json; charset=utf-8",
   	   							dataType : "json",
   	   							success:function(data){
   	   								$("#reply").val("");
   	   								$("#replyList").empty();
   	   								getReplyList();
   	   							}
   	   						});
   						}
   						
   					}else{
   						alert("내용을 입력해주세요.");
   					}
   				}   				
				
			});
			
   			
   			// 추천 클릭
   			$("#recommend").click(function(){
   				if("${sessionScope.account.unum}" == "") {
   					alert("비회원은 추천이 불가능합니다.");
   				}else {
   					$.ajax({
   						url:"${path}/bbs/recommend",
   						type:"POST",
   						data: { bnum : ${bbsVO.bnum} },
   						success:function(data){
   							if(data == "success") {
   								let recommendCnt = Number($("#recommendCnt").text());
   								$("#recommendCnt").text(recommendCnt + 1);
   							}
   						}
   					});
   				}
   			})
			
		})
	</script>
</body>
</html>