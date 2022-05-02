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
	<link rel="stylesheet" href="${path}/css/tipDetail.css"/>
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
		<div class="tipBox">
            <div class="tipImg">
                <img src="${path}/images/menu/tipImg.jpg" alt="">
                <ul>
                    <li>Diet Tips</li>
                </ul>
            </div>
            <div class="tipContents">
                <div class="tipTitle"></div>
            </div>
            <div class="tipDetailBox">
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
                            <p>${tipVO.title}</p>
                        </div>
                        <div class="nickBox">
                            <ul>
                                <li>
                                    <p>${tipVO.ownername}</p>
                                    <p>${tipVO.createdate}</p>
                                </li>
                                <li>
                                    <p>조회<span> ${tipVO.view_cnt}</span></p>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <p>
                            <c:out value="${tipVO.contents}" escapeXml="false" />
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
				location.href ="${path}/tip/modify?tnum=${tipVO.tnum}&curPage=curTip";
			});
			
			$("#delete").click(function(){
				if (confirm("정말로 삭제하시겠습니까?")){
					location.href = "${path}/tip/deleteTip?tnum=${tipVO.tnum}";
				}
			});
			
			$("#back").click(function() {
				location.href ="${path}/tip/goTip?curPage=curTip";
			});
		});
	</script>
</body>
</body>
</html>