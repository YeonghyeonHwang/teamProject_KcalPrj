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
<link rel="stylesheet" type="text/css" href="${path}/css/community_bbs.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="community_header.jsp"></jsp:include>
	
	<div id="boardWrap">
		<!-- <div id="ad"></div> -->
		<div id="categoryTitle">자유게시판</div>
		<div id="bbsCon">
			<table id="bbs">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회</th>
							<th>추천</th>
						</tr>
					</thead>
					<tbody id="noticeList">
						
					</tbody>
					<tbody id="bbsList">
						
					</tbody>
				</table>
				<c:if test="${!empty sessionScope.account}">	          
					<button type="button" id="create">글쓰기</button>				
	        	</c:if>
				<div id="pageBox"></div>
				<div id="searchBox">
					<select name="searchCategory" id="searchCategory">
						<option value="all">제목+내용</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" id="searchText"/>
					<button id="searchBtn">검색</button>
				</div>
		</div>
		
	</div>
	
	
	<!-- 푸터 -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script type="text/javascript">
	$(function(){
				
		// 공지 불러오기
		let getNotice = function(pageNum){
			$(".moreNotice").remove();
	    	const noticeList = document.querySelector("#noticeList");
	    	
	    	let data = {
	    			"category" : "cnotice",
	    			"pageNum" : pageNum,
	    			"count" : 3
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
	   		        	 let ntitleTd = document.createElement("td");
	   		        	 let titleTd = document.createElement("td");
	   		        	 let ownerTd = document.createElement("td");
	   		        	 let dateTd = document.createElement("td");
	   		        	 let viewTd = document.createElement("td");
	   		        	 let recommendTd = document.createElement("td");
	   		        	 
	   		        	 titleTd.setAttribute('data-bnum', item.bnum);
	   		        	 titleTd.setAttribute('class', "cnoticeTitle");
	   		        	 
	   		        	 ntitleTd.innerText = "[공지]";
		   		       	 titleTd.innerText = item.title;
	   		        	 ownerTd.innerText = "관리자";
	   		        	 dateTd.innerText = item.createdate;
	   		        	 viewTd.innerText = item.view_cnt;
	   		        	 recommendTd.innerText = item.recommend;
	   		        	 
	   		        	 
	   		        	 
 	   		        	 /* ntitleTd.style.color = "orangered";
 	   		        	 titleTd.style.color = "orangered"; */
	   		        	 
	   		        	 tr.append(ntitleTd);
	   		        	 tr.append(titleTd);
	   		        	 tr.append(ownerTd);
	   		        	 tr.append(dateTd);
	   		        	 tr.append(viewTd);
	   		        	 tr.append(recommendTd);
	   		        	 
	   		        	 tr.style.color = "orangered";
	   		        	 
	   		        	 noticeList.append(tr);
	   	        	 }
	   	        	 
	   	        	const tr = document.createElement("tr");
	   	        	let td = document.createElement("td");
	   	        	td.setAttribute("colspan", "6");
	   	        	td.setAttribute("class", "moreNotice");
	   	        	td.innerText = "공지 더보기"; 
	   	        	td.style.textAlign = "center";
	   	        	
	   	        	tr.append(td);
	   	        	noticeList.append(tr);
	   	        	
	    			}
	   	        	
	    		},
	    		error: function(data) {
	    			alert("error");
	    		}
	    	})    	
	    }
		
		// 공지 defalut 
		let noticePageNum = 1;
		getNotice(noticePageNum);
		
		// 공지 더보기 클릭
		$(document).on('click', '.moreNotice', function(){
			noticePageNum += 1;
			getNotice(noticePageNum);
		})
		
		// 글 불러오는 함수
	    let getBBSList = function(category, pageNum, searchCategory, searchText){
	    	$("#bbsList").empty();
	    	$("#pageBox").empty();
	    	const bbsList = document.querySelector("#bbsList");
	    	const pageBox = document.querySelector("#pageBox");
	    	
	    	let data = {
	    			"category" : category,
	    			"pageNum" : pageNum,
	    			"count" : 15,
	    			"searchCategory" : searchCategory,
	    			"searchText" : searchText
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
		   		        	 let viewTd = document.createElement("td");
		   		        	 let recommendTd = document.createElement("td");
		   		        	 
		   		        	 titleTd.setAttribute('data-bnum', item.bnum);
		   		        	 titleTd.setAttribute('class', "bbsTitle");
		   		        	 ownerTd.setAttribute('data-nickname', item.nickname);
		   		        	 ownerTd.setAttribute('class', "owner");
		   		        	 
		   		        	 bnumTd.innerText = item.bnum;
		   		        	 if(category != "emate") {
			   		        	 titleTd.innerText = item.title;		   		        		 
		   		        	 }else {
			   		        	 titleTd.innerText = "[" + item.region + "] " + item.title;		   		        		 		   		        		 
		   		        	 }
		   		        	 ownerTd.innerText = item.nickname;
		   		        	 dateTd.innerText = item.createdate;
		   		        	 viewTd.innerText = item.view_cnt;
		   		        	 recommendTd.innerText = item.recommend;
		   		        	 
		   		        	 // 제목 옆에 댓글 수
		   		        	 let replyCnt = document.createElement("span");
		   		        	 replyCnt.innerText = item.replyCnt;
		   		        	 replyCnt.setAttribute('class', "replyCnt");
		   		        	 titleTd.append(replyCnt); 
		   		        		   		        	
		   		        	 tr.append(bnumTd);
		   		        	 tr.append(titleTd);
		   		        	 tr.append(ownerTd);
		   		        	 tr.append(dateTd);
		   		        	 tr.append(viewTd);
		   		        	 tr.append(recommendTd);
		   	        		 
		   		        	 bbsList.append(tr);
		   	        	 }
		   	        	 
		   	        	 
		   	        	let preBlock = document.createElement("span");
		   	        	 preBlock.innerHTML = '<i class="fas fa-angle-double-left"></i>';
		   	        	 if(data.minBlock-1 >= 1) {
		   	        		preBlock.setAttribute("class", "PreBlock");
		   	        		preBlock.setAttribute("data-num", data.minBlock-1);
		   	        		preBlock.setAttribute("data-category", category);
		   	        		preBlock.setAttribute("data-scategory", searchCategory);
	   	        			preBlock.setAttribute("data-stext", searchText);
		   	        	 }
	   	        		 pageBox.append(preBlock);
		   	        	 
		   	        	 let prePage = document.createElement("span");
		   	        	 prePage.innerHTML = '<i class="fas fa-angle-left"></i>';
		   	        	 if(data.pageNum != 1) {
		   	        		prePage.setAttribute("class", "PrePage");
		   	        		prePage.setAttribute("data-num", data.pageNum-1);
		   	        		prePage.setAttribute("data-category", category);
		   	        		prePage.setAttribute("data-scategory", searchCategory);
	   	        			prePage.setAttribute("data-stext", searchText);
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
	   	        			 page.setAttribute("data-category", category);
	   	        			 page.setAttribute("data-scategory", searchCategory);
	   	        			 page.setAttribute("data-stext", searchText);
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
		   	        		nextPage.setAttribute("data-category", category);
		   	        		nextPage.setAttribute("data-scategory", searchCategory);
	   	        			nextPage.setAttribute("data-stext", searchText);
		   	        	 }
		   	        	pageBox.append(nextPage);
	   	        		 
	   	        		let nextBlock = document.createElement("span");
	   	        		nextBlock.innerHTML = '<i class="fas fa-angle-double-right"></i>';
		   	        	 if(data.maxBlock < data.pageCnt) {
		   	        		nextBlock.setAttribute("class", "NextBlock");
		   	        		nextBlock.setAttribute("data-num", data.maxBlock+1);
		   	        		nextBlock.setAttribute("data-category", category);
		   	        		nextBlock.setAttribute("data-scategory", searchCategory);
	   	        			nextBlock.setAttribute("data-stext", searchText);
		   	        	 }
		   	        	pageBox.append(nextBlock);
	    			}else {
	    				const tr = document.createElement("tr");
	    				const noneTd = document.createElement("td");
	    				noneTd.setAttribute("colspan", "6");
	    				noneTd.innerText = "글이 없습니다."; 
	    				noneTd.style.textAlign = "center";
	    				noneTd.style.height = "350px";
	    				
	    				tr.append(noneTd);
	    				bbsList.append(tr);
	    			}
		        		 
	    		},
	    		error: function(data) {
	    			alert("error");
	    		}
	    	})    	
	    }
			
		// 게시글 리스트 default - 자유게시판
		getBBSList("${category}" , 1, "", "");
		$(".menuTab").removeClass("selected");
   	 	$(".menuTab[data-category='${category}']").addClass("selected");
		
		// 페이지 숫자 클릭
        $(document).on('click', '.PageNum', function(){
        	getBBSList($(this).data("category"), $(this).data("num"), $(this).data("scategory"), $(this).data("stext"));
		})		
		// 페이지블럭 <<
		 $(document).on('click', '.PreBlock', function(){
			 getBBSList($(this).data("category"), $(this).data("num"), $(this).data("scategory"), $(this).data("stext"));
		 })
		// 페이지블럭 <
		 $(document).on('click', '.PrePage', function(){
			 getBBSList($(this).data("category"), $(this).data("num"), $(this).data("scategory"), $(this).data("stext"));
		 })
		// 페이지블럭 >
		 $(document).on('click', '.NextPage', function(){
			 getBBSList($(this).data("category"), $(this).data("num"), $(this).data("scategory"), $(this).data("stext"));
		 })
		// 페이지블럭 >>
		 $(document).on('click', '.NextBlock', function(){
			 getBBSList($(this).data("category"), $(this).data("num"), $(this).data("scategory"), $(this).data("stext"));
		 })	
		 
						
		 // 메뉴탭 클릭
		 let currCategory = "${category}"; 
		 if(currCategory == "free") { 
			 $("#categoryTitle").text("자유게시판");
		 }else if(currCategory == "question") { 
			 $("#categoryTitle").text("고민&질문"); 
		 }else if(currCategory == "tip") { 
			 $("#categoryTitle").text("팁&노하우");
		 }else if(currCategory == "review") { 
			 $("#categoryTitle").text("다이어트후기");
		 }else if(currCategory == "emate") { 
			 $("#categoryTitle").text("운동메이트");
		 }
		 
         $(document).on('click', '.menuTab', function(){
        	 $(".menuTab").removeClass("selected");
        	 $(this).addClass("selected");
        	 
        	 let category = $(this).attr("data-category");
        	 if(category == "free") { $("#categoryTitle").text("자유게시판"); }
        	 else if(category == "question") { $("#categoryTitle").text("고민&질문"); }
        	 else if(category == "tip") { $("#categoryTitle").text("팁&노하우"); }
        	 else if(category == "review") { $("#categoryTitle").text("다이어트후기"); }
        	 else if(category == "emate") { $("#categoryTitle").text("운동메이트"); }
        	 
        	 currCategory = category;
        	 
        	 $("#noticeList").empty();
        	 noticePageNum = 1;
        	 getNotice(noticePageNum);
        	 
        	 getBBSList(category, 1, "", "");
         })
         
         // 글쓰기버튼 클릭
         $("#create").click(function(){
        	 console.log("글쓰기버튼 클릭");
        	 location.href = "${path}/bbs/create?currCategory=" + currCategory;
         })
         
         // 검색버튼 클릭
         $(document).on('click', '#searchBtn', function(){
        	 let searchCategory = $("#searchCategory option:selected").val();
        	 let searchText = $("#searchText").val();
        	 
        	 if(searchText == "") {
        		 alert("검색어를 입력해주세요.");
        	 }else {
	        	 getBBSList(currCategory, 1, searchCategory, searchText);        		 
        	 }
        	 
         })
         
         // 게시물 제목클릭
         $(document).on('click', '.bbsTitle', function(){
        	let bnum = $(this).data("bnum");
			location.href = "${path}/bbs/detail?bnum=" + bnum;       	 
         })
         
         // 게시물 작성자 클릭
         $(document).on('click', '.owner', function(){
        	let nickname = $(this).data("nickname");
			location.href = "${path}/profile/main?nickname=" + nickname;       	 
         })
         
         // 공지 제목클릭
         $(document).on('click', '.cnoticeTitle', function(){
        	let bnum = $(this).data("bnum");
			location.href = "${path}/bbs/detail?bnum="+bnum;       	 
         })
			
	})
	
	
	</script>
</body>
</html>