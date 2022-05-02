<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${path}/css/community_bbs_modify.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="community_header.jsp"></jsp:include>
	
	<div id="wrap">
		<form action="${path}/bbs/modify_result" method="post" id="modifyBBS">
			<ul>
				<li>
					<input type="hidden" id="unum" name="unum" value="${sessionScope.account.unum}">
					<input type="hidden" id="bnum" name="bnum" value="${bbsVO.bnum}">
				</li>
				<li id="categoryCon">
					
					<span id="category">
						<c:choose>
							<c:when test="${bbsVO.category eq 'free'}">자유게시판</c:when>
							<c:when test="${bbsVO.category eq 'question'}">고민 & 질문</c:when>
							<c:when test="${bbsVO.category eq 'tip'}">팁 & 노하우</c:when>
							<c:when test="${bbsVO.category eq 'review'}">다이어트 후기</c:when>
							<c:when test="${bbsVO.category eq 'emate'}">운동메이트</c:when>	
							<c:when test="${bbsVO.category eq 'cnotice'}">커뮤니티 공지</c:when>	
						</c:choose>
					</span>
					<c:if test="${!empty bbsVO.region}">
						<input type="text" id="region" name="region" value="${bbsVO.region}" />
					</c:if>
				</li>
				<li>
				<input type="text" name="title" id="title" value="${bbsVO.title}"/></li>
				<li>
					<textarea name="content" id="content" cols="30" rows="10">${bbsVO.content}</textarea>
				</li>
			</ul>
		</form>
		<div id="btns">
			<button id="cancel" type="button">취소</button>
			<button id="submit" type="button">수정</button>
		</div>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(function(){
			// 글쓰기 눌렀을때 있었던 카테고리가 현재 카테고리 
			let currCategory = "${bbsVO.category}";
			$(".menuTab[data-category="+currCategory+"]").addClass("selected");
			
			
			// 헤더 탭메뉴 클릭 시
			$(document).on('click', '.menuTab', function() {
				location.href = "${path}/community/bbs?category=" + $(this).data("category");
			})
			
			// 작성완료 클릭
			$("#submit").click(function(){				
				
				if ($("#title").val() == "") {
					alert('제목을 입력해주세요.');
				}else if(CKEDITOR.instances.content.getData() == "") {
					alert('내용을 입력해주세요.');
				}else {
					let chk = confirm("수정하시겠습니까?"); 
					if(chk) {
						$("#modifyBBS").submit();
					}
				}
				
			})
			
			// 취소버튼 클릭
   			$("#cancel").click(function(){
   				window.history.back();
   			})
   			
   		// ckeditor
			CKEDITOR.replace('content', {
				width : '100%',
				height : 400,
				resize_enabled : false,
				toolbarCanCollapse : true,
				filebrowserUploadUrl : '${path}/bbs/fileUpload'
			});
		})
	</script>
</body>
</html>