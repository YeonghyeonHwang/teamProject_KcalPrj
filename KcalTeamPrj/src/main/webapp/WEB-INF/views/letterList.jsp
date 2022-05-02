<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="rl">
		<table id="rlTable">
			<thead>
				<tr>
					<th>삭제</th>
					<th>제목</th>
					<th>보낸이</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty receiveLetterList}">
					<c:forEach var="item" items="${receiveLetterList}">
						<tr>
							<td><input type="checkbox" name="delete" value="${item.lnum}"/></td>
							<td class="letterTitle readLetter" data-lnum="${item.lnum}" data-ischeck="${item.ischeck}">${item.title}</td>
							<td data-nickname="${item.snick}" class="lnickname">${item.snick}</td>
							<td>${item.date}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty receiveLetterList}">
					<tr>
						<td class="letterNone" colspan="4">받은 쪽지가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	<%
	// rnum : 받은쪽지 현재 페이지
      int rnum = (Integer)request.getAttribute("rnum");
	// rcount : 받은쪽지 전체 데이터 개수
      int rcount = (Integer)request.getAttribute("rcount");
	// rtotal : 받은쪽지 전체 페이지 개수
      int rtotal = rcount/10 + ((rcount % 10 == 0) ? 0 : 1);
	// rminBlock : 받은쪽지 한 블럭의 가장 작은번호인 페이지 num
      int rminBlock = (((rnum-1)/5)*5)+1;
	// rmaxBlock : 받은쪽지 한 블럭의 가장 큰 번호인 페이지 num
      int rmaxBlock = (((rnum-1)/5)+1)*5;
      
      pageContext.setAttribute("rtotal", rtotal);
      pageContext.setAttribute("rminBlock", rminBlock);
      pageContext.setAttribute("rmaxBlock", rmaxBlock);
      
   %>
   <div>
   		<button type="button" class="letterDelete">선택쪽지 삭제</button>
   </div>
   <input type="hidden" value="${rnum}" id="r_num" />
   <input type="hidden" value="${rminBlock}" id="r_minBlock" />
   <input type="hidden" value="${rmaxBlock}" id="r_maxBlock" />
   
   <c:if test="${!empty sendLetterList}">
	   <div id="rl_pages">
		   <c:choose>
		   	<c:when test="${rminBlock-1 < 1}">
		   		<span><i class="fas fa-angle-double-left"></i></span>
		   	</c:when>
		   	<c:otherwise>
		   		<span id="r_preBlock" class="clickable"><i class="fas fa-angle-double-left"></i></span>
		   	</c:otherwise>
		   </c:choose>
		   <c:choose>
		      <c:when test="${rnum == 1}">
		         <span><i class="fas fa-angle-left"></i></span>
		      </c:when>
		      <c:otherwise>
		         <span id="r_pre" class="clickable"><i class="fas fa-angle-left"></i></span>
		      </c:otherwise>
		   </c:choose>
		   <c:forEach begin="${rminBlock}" end="${(rtotal < rmaxBlock) ? rtotal : rmaxBlock}" step="1" var="i">
		      <c:choose>
		         <c:when test="${rnum == i}">
		            <span class="r_currPage">${i}</span>
		         </c:when>
		         <c:otherwise>
		            <span class="r_page" style="cursor:pointer;">${i}</span>
		         </c:otherwise>
		      </c:choose>
		
		   </c:forEach>
		   <c:choose>
		      <c:when test="${rnum == rtotal}">
		         <span><i class="fas fa-angle-right"></i></span>
		      </c:when>
		      <c:otherwise>
		         <span id="r_next" class="clickable"><i class="fas fa-angle-right"></i></i></span>    
		      </c:otherwise>
		   </c:choose>
		   <c:choose>
			   	<c:when test="${rmaxBlock >= rtotal}">
			   		<span><i class="fas fa-angle-double-right"></i></span>
			   	</c:when>
			   	<c:otherwise>
			   		<span id="r_nextBlock" class="clickable"><i class="fas fa-angle-double-right"></i></span>
				</c:otherwise>
		   </c:choose>
	   </div>
   </c:if>
	</div>
	
	<div id="sl">
		<table id="slTable">
			<thead>
				<tr>
					<th>삭제</th>
					<th>제목</th>
					<th>받는이</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty sendLetterList}">
					<c:forEach var="item" items="${sendLetterList}">
						<tr>
							<td><input type="checkbox" name="delete" value="${item.lnum}"/></td>
							<td class="letterTitle" data-lnum="${item.lnum}">${item.title}</td>
							<td data-nickname="${item.rnick}" class="lnickname">${item.rnick}</td>
							<td>${item.date}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty sendLetterList}">
					<tr>
						<td class="letterNone" colspan="4">보낸 쪽지가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<%
	// snum : 보낸쪽지 현재 페이지
      int snum = (Integer)request.getAttribute("snum");
	// scount : 보낸쪽지 전체 데이터 개수
      int scount = (Integer)request.getAttribute("scount");
	// stotal : 보낸쪽지 전체 페이지 개수
      int stotal = scount/10 + ((scount % 10 == 0) ? 0 : 1);
	// sminBlock : 보낸쪽지 한 블럭의 가장 작은번호인 페이지 num
      int sminBlock = (((snum-1)/5)*5)+1;
	// smaxBlock : 보낸쪽지 한 블럭의 가장 큰 번호인 페이지 num
      int smaxBlock = (((snum-1)/5)+1)*5;
      
      pageContext.setAttribute("stotal", stotal);
      pageContext.setAttribute("sminBlock", sminBlock);
      pageContext.setAttribute("smaxBlock", smaxBlock);
      
   %>
   <div>
   		<button type="button" class="letterDelete">선택쪽지 삭제</button>
   </div>
   <input type="hidden" value="${snum}" id="s_num" />
   <input type="hidden" value="${sminBlock}" id="s_minBlock" />
   <input type="hidden" value="${smaxBlock}" id="s_maxBlock" />
   
   <c:if test="${!empty sendLetterList}">
   
	   <div id="sl_pages">
		   <c:choose>
		   	<c:when test="${sminBlock-1 < 1}">
		   		<span><i class="fas fa-angle-double-left"></i></span>
		   	</c:when>
		   	<c:otherwise>
		   		<span id="s_preBlock" class="clickable"><i class="fas fa-angle-double-left"></i></span>
		   	</c:otherwise>
		   </c:choose>
		   <c:choose>
		      <c:when test="${snum == 1}">
		         <span><i class="fas fa-angle-left"></i></span>
		      </c:when>
		      <c:otherwise>
		         <span id="s_pre" class="clickable"><i class="fas fa-angle-left"></i></span>
		      </c:otherwise>
		   </c:choose>
		   <c:forEach begin="${sminBlock}" end="${(stotal  <smaxBlock) ? stotal : smaxBlock}" step="1" var="i">
		      <c:choose>
		         <c:when test="${snum == i}">
		            <span class="s_currPage">${i}</span>
		         </c:when>
		         <c:otherwise>
		            <span class="s_page" style="cursor:pointer;">${i}</span>
		         </c:otherwise>
		      </c:choose>
		
		   </c:forEach>
		   <c:choose>
		      <c:when test="${snum == stotal}">
		         <span><i class="fas fa-angle-right"></i></span>
		      </c:when>
		      <c:otherwise>
		         <span id="s_next" class="clickable"><i class="fas fa-angle-right"></i></span>    
		      </c:otherwise>
		   </c:choose>
		   <c:choose>
			   	<c:when test="${smaxBlock >= stotal}">
			   		<span><i class="fas fa-angle-double-right"></i></span>
			   	</c:when>
			   	<c:otherwise>
			   		<span id="s_nextBlock" class="clickable"><i class="fas fa-angle-double-right"></i></span>
				</c:otherwise>
		   </c:choose>
	   </div>
   
   </c:if>
	</div>
</body>
</html>