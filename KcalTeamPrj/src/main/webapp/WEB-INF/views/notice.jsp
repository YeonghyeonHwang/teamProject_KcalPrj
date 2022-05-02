<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
	<link rel="stylesheet" href="${path}/css/notice.css"/>
	<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
		<div class="noticeBox">
            <div class="noticeImg">
                <img src="${path}/images/menu/noticeImg.jpg" alt="">
                <div class="noticeImgMent">
                    <p>Notice</p>
                </div>
            </div>

            <div class="noticeContents">
                <div class="noticeTitle">
                    <p>공지사항</p>
                </div>
                <div class="noticeContent">
                    <table id="notice">
                    	<thead>
                    		<tr>
                    			<th>번호</th>
                    			<th>제목</th>
                    			<th>작성자</th>
                    			<th>작성일</th>
                    		</tr>
                    	</thead>
                    	<tbody id="noticeList">
                    	
                    	</tbody>
                    </table>
                    <c:if test="${sessionScope.account.isadmin eq 'Y'}">	          
						<button type="button" id="create">글쓰기</button>				
	        		</c:if>
                    <div id="pageBox"></div>
                </div>
            </div>
        </div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			// 글 불러오는 함수
		    let getBBSList = function(pageNum){
		    	$("#noticeList").empty();
		    	$("#pageBox").empty();
		    	const noticeList = document.querySelector("#noticeList");
		    	const pageBox = document.querySelector("#pageBox");
		    	
		    	let data = {
		    			"category" : "notice",
		    			"pageNum" : pageNum,
		    			"count" : 10
		    	}
		    	
		    	$.ajax({
		    		url: "${path}/bbs/bbsList",
		    		type: "POST",	
		    		data: data,
		            dataType : 'json',
		    		success: function(data) {
		    			
		    			if(data.postCnt != 0) {

			   	        	 for(let item of data.bbsList) {
			   		        	 const tr = document.createElement("tr");
			   		        	 let bnumTd = document.createElement("td");
			   		        	 let titleTd = document.createElement("td");
			   		        	 let ownerTd = document.createElement("td");
			   		        	 let dateTd = document.createElement("td");
			   		        	 
			   		        	 titleTd.setAttribute('data-bnum', item.bnum);
			   		        	 titleTd.setAttribute('class', "bbsTitle");
			   		        	 
			   		        	 bnumTd.innerText = item.bnum;
			   		        	 titleTd.innerText = item.title;
			   		        	 ownerTd.innerText = "관리자";
			   		        	 dateTd.innerText = item.createdate;
			   		        	 
			   		        	 tr.append(bnumTd);
			   		        	 tr.append(titleTd);
			   		        	 tr.append(ownerTd);
			   		        	 tr.append(dateTd);
			   	        		 
			   		        	 noticeList.append(tr);
			   	        	 }
			   	        	 
			   	        	 
			   	        	let preBlock = document.createElement("span");
			   	        	 preBlock.innerHTML = '<i class="fas fa-angle-double-left"></i>';
			   	        	 if(data.minBlock-1 >= 1) {
			   	        		preBlock.setAttribute("class", "PreBlock");
			   	        		preBlock.setAttribute("data-num", data.minBlock-1);
			   	        	 }
		   	        		 pageBox.append(preBlock);
			   	        	 
			   	        	 let prePage = document.createElement("span");
			   	        	 prePage.innerHTML = '<i class="fas fa-angle-left"></i>';
			   	        	 if(data.pageNum != 1) {
			   	        		prePage.setAttribute("class", "PrePage");
			   	        		prePage.setAttribute("data-num", data.pageNum-1);
			   	        	 }
		   	        		 pageBox.append(prePage);
		   	        		 
		   	        		 let maxBlock = 0;
		   	        		 if(data.pageCnt < data.maxBlock) {
		   	        			 maxBlock = data.pageCnt;
		   	        		 }else {
		   	        			 maxBlock = data.maxBlock;
		   	        		 }
		   	        		
		   	        		 for(let i = data.minBlock; i <= maxBlock; i++) {
		   	        			 let page = document.createElement("span");
		   	        			 page.innerText = i;
		   	        			 page.setAttribute("class", "PageNum");
		   	        			 page.setAttribute("data-num", i);
		   	        			 if(i == data.pageNum) {
		   	        				 page.style.fontWeight = "bold";
		   	        				 page.style.textDecoration = "underline";
		   	        				 page.style.color = "orangered";
		   	        			 } 
		   	        			pageBox.append(page);
		   	        		 }

		   	        		 let nextPage = document.createElement("span");
			   	        	nextPage.innerHTML = '<i class="fas fa-angle-right"></i>';
			   	        	 if(data.pageNum != data.pageCnt) {
			   	        		nextPage.setAttribute("class", "NextPage");
			   	        		nextPage.setAttribute("data-num", data.pageNum+1);
			   	        	 }
			   	        	pageBox.append(nextPage);
		   	        		 
		   	        		let nextBlock = document.createElement("span");
		   	        		nextBlock.innerHTML = '<i class="fas fa-angle-double-right"></i>';
			   	        	 if(data.maxBlock < data.pageCnt) {
			   	        		nextBlock.setAttribute("class", "NextBlock");
			   	        		nextBlock.setAttribute("data-num", data.maxBlock+1);
			   	        	 }
			   	        	pageBox.append(nextBlock);
		    			}else {
		    				const tr = document.createElement("tr");
		    				const noneTd = document.createElement("td");
		    				noneTd.setAttribute("colspan", "4");
		    				noneTd.innerText = "공지가 없습니다."; 
		    				noneTd.style.textAlign = "center";
		    				noneTd.style.height = "350px";
		    				noneTd.style.lineHeight = "350px";
		    				
		    				tr.append(noneTd);
		    				noticeList.append(tr);
		    			}
			        		 
		    		},
		    		error: function(data) {
		    			alert("error");
		    		}
		    	})    	
		    }
			
		 	// default
			getBBSList(1);
		 
			// 페이지 숫자 클릭
	        $(document).on('click', '.PageNum', function(){
	        	getBBSList($(this).data("num"));
			})		
			// 페이지블럭 <<
			 $(document).on('click', '.PreBlock', function(){
				 getBBSList($(this).data("num"));
			 })
			// 페이지블럭 <
			 $(document).on('click', '.PrePage', function(){
				 getBBSList($(this).data("num"));
			 })
			// 페이지블럭 >
			 $(document).on('click', '.NextPage', function(){
				 getBBSList($(this).data("num"));
			 })
			// 페이지블럭 >>
			 $(document).on('click', '.NextBlock', function(){
				 getBBSList($(this).data("num"));
			 })
			 
			 $('#create').click(function() {
					location.href = "${path}/notice/create?curPage=curNotice";
			 });
			 
			 $(document).on('click', '.bbsTitle', function(){
		        	let bnum = $(this).data("bnum");
					location.href = "${path}/notice/detail?bnum="+bnum+"&curPage=curNotice";       	 
	         });
		})
	</script>
</body>
</html>