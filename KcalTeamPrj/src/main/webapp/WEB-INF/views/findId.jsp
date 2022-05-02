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
	<link rel="stylesheet" href="${path}/css/afterIdForm.css"/>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='${path}/member/goLogin';
		})
	})
</script>

	
</head>
<body>
	 <div class="conatainer">
	 	<jsp:include page="main_menu_bar.jsp"></jsp:include>
        <div class="afterIdContainer">
            <div class="afterBox">
                <ul>
                    <li>
                        <p>아이디 찾기</p>
                    </li>
                    <li>
                        <div>
                            <p>회원님의 아이디는 <span>${id}</span> 입니다.</p>
                        </div>
                        <button id="loginBtn">로그인</button>
                    </li>
                </ul>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>