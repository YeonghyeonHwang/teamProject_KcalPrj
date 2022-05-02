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
	<link rel="stylesheet" href="${path}/css/findIdForm.css"/>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	 <div class="container">
	 	<jsp:include page="main_menu_bar.jsp"></jsp:include>
	 	<div class="findIdContainer">
            <div class="findBox">
                <ul>
                    <li>
                        <p>아이디 찾기</p>
                    </li>
                    <li>
                        <p>이메일을 입력하면 아이디를 알려드립니다.</p>
                        <div>
                            <label>Email</label>
                            <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요." required />
                        </div>
                        <div>
                            <button type="button" onclick="history.go(-1);">취소</button>
                            <button type="button" id="findBtn">찾기</button>
                            
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
	 </div>
    
    <script type="text/javascript">
	
	$(function(){
		$("#findBtn").click(function(){
			location.href = "${path}/member/findId?email=" + $("#email").val();
		})
	})
	</script>
</body>
</html>