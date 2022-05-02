<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${path}/css/community_bbs_create.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="community_header.jsp"></jsp:include>

	<div id="wrap">
		<form action="${path}/bbs/create_result" method="post" id="createBBS">
			<ul>
				<li>
					<input type="hidden" id="unum" name="unum" value="${sessionScope.account.unum}"> 
					<input type="hidden" id="id" name="id" value="${sessionScope.account.id}">
					<input type="hidden" id="nickname" name="nickname" value="${sessionScope.account.nickname}">
				</li>
				<li id="categoryCon">
					<select name="category" id="category">
							<option value="free" selected>자유게시판</option>
							<option value="question">고민&질문</option>
							<option value="tip">팁&노하우</option>
							<option value="review">다이어트후기</option>
							<option value="emate">운동메이트</option>
					</select>
					<input type="text" name="region" id="region" placeholder="지역" />
				</li>
				<li>
				<input type="text" name="title" id="title" placeholder="제목"/></li>
				<li>
					<textarea name="content" id="content" cols="30" rows="10"></textarea>
				</li>
			</ul>
		</form>
		<div id="btns">
			<button id="cancel" type="button">취소</button>
			<button id="submit" type="button">작성</button>
		</div>
	</div>


	<!-- 푸터 -->
	<jsp:include page="footer.jsp"></jsp:include>


	<script type="text/javascript">
		$(function() {
			// 글쓰기 눌렀을때 있었던 카테고리가 현재 카테고리 
			let currCategory = "${currCategory}";
			$(".menuTab[data-category="+currCategory+"]").addClass("selected");
			
			
			// 헤더 탭메뉴 클릭 시
			$(document).on('click', '.menuTab', function() {
				location.href = "${path}/community/bbs?category=" + $(this).data("category");
			})

			// 넘어온 카테고리로 기본값 
			$("#category").val(currCategory);
			if (currCategory == "emate") {
				$("#region").show();
				$("#region").attr("disabled", false);
			} else {
				$("#region").hide();
				$("#region").attr("disabled", true);
			}
			
			// select 카테고리 변경 시
			$("#category").on("change", function(){ 
				let select = $("#category option:selected").val();

				// 헤더 탭메뉴 변화
				$(".menuTab").removeClass("selected");
				$(".menuTab[data-category="+select+"]").addClass("selected");
				
				// 운동메이트 선택에 따른 지역 input창 변화
				if (select == "emate") {
					$("#region").show();
					$("#region").attr("disabled", false);
				} else {
					$("#region").hide();
					$("#region").attr("disabled", true);
				}
			})
			
			// 작성완료 클릭
			$("#submit").click(function(){				
				
				if ($("#title").val() == "") {
					alert('제목을 입력해주세요.');
				}else if(CKEDITOR.instances.content.getData() == "") {
					alert('내용을 입력해주세요.');
				}else {
					let chk = confirm("작성완료 하시겠습니까?"); 
					if(chk) {
						$("#createBBS").submit();
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
				filebrowserUploadUrl : '${path}/bbsFile/imgUpload'
			});

		})
	</script>

</body>
</html>