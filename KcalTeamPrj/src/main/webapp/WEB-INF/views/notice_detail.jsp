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
	<link rel="stylesheet" href="${path}/css/notice_detail.css"/>
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://kit.fontawesome.com/604dbbab30.js"></script>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
		<div class="noticeBox">
            <div class="noticeImg">
                <img src="${path}/images/menu/tipImg.jpg" alt="">
                <ul>
                    <li>Notice</li>
                </ul>
            </div>
            <div class="noticeContents">
                <div class="noticeTitle"></div>
            </div>
            <div class="noticeDetailBox">
                <ul class="kcalDynamite">
                    <li>
                        <p>Kcal Dynamite</p>
                        <c:if test="${sessionScope.account.isadmin eq 'Y'}">
	                        <div>
	                            <button id="modify">수정</button>
	                            <button id="delete">삭제</button>
	                            <button id="back">글목록</button>
	                        </div>
                        </c:if>
                    </li>
                    <li>
                        <div>
                            <p>${bbsVO.title}</p>
                        </div>
                        <div class="nickBox">
                            <ul>
                                <li>
                                    <p>${bbsVO.nickname}</p>
                                    <p>${bbsVO.createdate}</p>
                                </li>
                                <li>
                                    <p>조회<span> ${bbsVO.view_cnt}</span></p>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <p>
                            <c:out value="${bbsVO.content}" escapeXml="false" />
                        </p>
                    </li>
                </ul>
            </div>
        </div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#modify").click(function(){
				location.href ="${path}/notice/modify?bnum=${bbsVO.bnum}&curPage=curNotice";
			});
			
			$("#delete").click(function(){
				if (confirm("정말로 삭제하시겠습니까?")){
					location.href = "${path}/notice/delete?bnum=${bbsVO.bnum}";
				}
			});
			
			$("#back").click(function() {
				location.href ="${path}/notice/goNotice?curPage=curNotice";
			});
		});
	</script>
</body>
</body>
</html>