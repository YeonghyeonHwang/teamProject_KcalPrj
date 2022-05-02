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
	<link rel="stylesheet" href="${path}/css/findPwForm.css"/>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<script>
	$(function(){
		$("#send").click(function(){
			$.ajax({
				url : "${path}/member/findPW",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					if(result == "success") {
						alert("임시비밀번호가 발송되었습니다.");
					}
				},
				error: function(result) {
					alert("error");
				}
			})
		});
	})
</script>
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
		<div class="findPwContainer">
            <div class="findBox">
                <ul>
                    <li>
                        <p>비밀번호 찾기</p>
                    </li>
                    <li>
                        <p>이메일을 입력하면 ID를 알려드립니다.</p>
                        <div>
                            <label>ID</label>
                            <input type="text" id="id" name="id" required />
                        </div>
                        <div>
                            <label>Email</label>
				            <input  type="text" id="email" name="email" required>
                        </div>
                        <div>
                            <button type="button" onclick="history.go(-1);">취소</button>
                            <button type="button" id="send">찾기</button>      
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>