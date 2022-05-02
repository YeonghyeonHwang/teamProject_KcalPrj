<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%-- <link rel="stylesheet" href="${path}/css/default.css" /> --%>
	<link rel="stylesheet" href="${path}/css/footer.css" />
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script src="https://kit.fontawesome.com/604dbbab30.js" crossorigin="anonymous"></script>
</head>
<body>
<footer>
            <div class="fline">
               <div class="siteName">
                    <p>Kacl Dynamite</p>
               </div>
               <div class="list">
                   <ul>
                       <li>회사소개</li>
                       <li>이용약관</li>
                       <li>개인정보처리방침</li>
                       <li>공지사항</li>
                   </ul>
               </div>
            </div>
            <div class="sline">
                <div class="siteInfo">
                     <ul>
                         <li>Kcal Dynamite(주)</li>
                         <li>사업자번호 : 000-00-00000</li>
                         <li>사무실 : OO시 OO구 OO대로 000 OO빌딩 O층</li>
                     </ul>
                </div>
                <div class="siteIcon">
                    <ul>
                        <li><i class="fab fa-facebook-square"></i></li>
                        <li><i class="xi-instagram"></i></li>
                        <li><i class="fab fa-twitter-square"></i></li>
                        <li><i class="fab fa-youtube-square"></i></li>
                    </ul>
                </div>
             </div>
        </footer>
</body>
</html>