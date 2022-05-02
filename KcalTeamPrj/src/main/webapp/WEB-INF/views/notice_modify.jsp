<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/css/default.css"/>
	<link rel="stylesheet" href="${path}/css/notice_create.css"/>
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/604dbbab30.js"></script>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
		<div class="noticeBox">
            <div class="noticeImg">
                <img src="${path}/images/menu/noticeImg.jpg" alt="">
                <ul>
                    <li>Notice</li>
                    <li>공지사항 수정하기</li>
               	</ul>
            </div>
            
            <div class="noticeContents">
                <div class="noticeTitle"></div>
            </div>
            <div class="createNotice">
                <div class="createNoticeBox">
                    <form action="${path}/notice/modify_result?curPage=curNotice" method="post" id="createNotice">
                        <ul>
                            <li>
                                <p>게시글 작성</p>
			                 	<input type="hidden" id="unum" name="unum" value="${sessionScope.account.unum}"> 
								<input type="hidden" id="bnum" name="bnum" value="${bbsVO.bnum}">
                            </li>
                            <li>
                                <label for="category" id="selectBoxLabel">게시판</label>
                                <select name="category" id="selectBox">
                                    <option value="notice" selected>공지사항</option>
                                </select>
                            </li>
                            <li>
                                <label for="title" id="titleLabel">제목</label>
                                <input type="text" name="title" id="title" value="${bbsVO.title}"/>
                            </li>
                            <li>
                                <textarea name="content" id="content" cols="30" rows="10">${bbsVO.content}</textarea>
                            </li>
                            <li>
                                <button id="cancel" type="button">취소</button>
                                <button id="clear" type="button">작성완료</button>
                            </li>
                        </ul>
                    </form>     
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		$(function() {
			CKEDITOR.replace('content', {
				width:870,
				height: 400,
				resize_enabled : false,
				toolbarCanCollapse : true,
				filebrowserUploadUrl: '${path}/tipFile/imgUpload'
			});
			
			$('#cancel').click(function() {
				location.href = '${path}/notice/goNotice?curPage=NoticeTip';
			});
		});
		
		const title = document.getElementById('title');
		const createNotice = document.getElementById('createNotice');
		
		document.getElementById('clear').addEventListener('click', function() {
			if (title.value == "" && CKEDITOR.instances.content.getData() == "") {
				alert('제목과 내용을 입력해주세요');
				return;
			}
			
			if (title.value == "") {
				alert('제목을 입력해주세요');
				return;
			}
			
			if (CKEDITOR.instances.content.getData() == "") {
				alert('내용을 입력해주세요');
				return;
			} 
			
			if (title.value != "" && CKEDITOR.instances.content.getData() != "") {
				alert('작성되었습니다.')
				createNotice.submit();
			} 
        });
	</script>
</body>
</html>