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
	<link rel="stylesheet" href="${path}/css/createTip.css"/>
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/604dbbab30.js"></script>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
		<div class="tipBox">
            <div class="tipImg">
                <img src="${path}/images/menu/tipImg.jpg" alt="">
                <ul>
                    <li>Diet Tips</li>
                    <li>꿀팁 작성하기</li>
                </ul>
            </div>
            <div class="tipContents">
                <div class="tipTitle"></div>
            </div>
            <div class="createTip">
                <div class="createTipBox">
                    <form action="${path}/tip/create_result?curPage=curTip" method="post" id="createTips">
                        <ul>
                            <li>
                                <p>게시글 작성</p>
                                <input type="hidden" id="ownerid" name="ownerid" value="${sessionScope.account.id}">
                                <input type="hidden" id="ownername" name="ownername" value="${sessionScope.account.nickname}">
                            </li>
                            <li>
                                <label for="category" id="selectBoxLabel">게시판</label>
                                <select name="category" id="selectBox">
                                    <option value="column" selected>칼럼</option>
                                    <option value="workout">운동</option>
                                </select>
                            </li>
                            <li>
                                <label for="title" id="titleLabel">제목</label>
                                <input type="text" name="title" id="title" />
                            </li>
                            <li>
                                <textarea name="contents" id="contents" cols="30" rows="10"></textarea>
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
			CKEDITOR.replace('contents', {
				width:'100%',
				height: 400,
				resize_enabled : false,
				toolbarCanCollapse : true,
				filebrowserUploadUrl: '${path}/tipFile/imgUpload'
			});
			
			$('#cancel').click(function() {
				location.href = '${path}/tip/goTip?curPage=curTip';
			});
			
			
			/* let editorContent = CKEDITOR.instances.editor.getData();
			let convertContent = editorContent.replace(/(<([^>]+)>)/ig,""); */
		});
		
		const title = document.getElementById('title');
		const createTips = document.getElementById('createTips');
		
		document.getElementById('clear').addEventListener('click', function() {
			if (title.value == "" && CKEDITOR.instances.contents.getData() == "") {
				alert('제목과 내용을 입력해주세요');
				return;
			}
			
			if (title.value == "") {
				alert('제목을 입력해주세요');
				return;
			}
			
			if (CKEDITOR.instances.contents.getData() == "") {
				alert('내용을 입력해주세요');
				return;
			} 
			
			if (title.value != "" && CKEDITOR.instances.contents.getData() != "") {
				alert('작성되었습니다.')
				createTips.submit();
			} 
        });
		
	</script>
</body>
</html>