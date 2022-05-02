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
	<link rel="stylesheet" href="${path}/css/tip.css"/>
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
                <div class="tipImgMent">
                    <p>Diet Tips</p>
                </div>
            </div>

            <div class="tipContents">
                <div class="tipTitle">
                    <button class="tabMenu" id="columnTab" >칼럼</button>
                    <button class="tabMenu" id="workoutTab" >운동</button>
                </div>
                
				<div id="column" class="tabContent">
                    <ul class="titleBox">
                        <li>Diet Tips(칼럼)</li>
                    </ul>
                    
                    <div class="cPageing">
	                   	<c:forEach var="tipcList" items="${cList}">
		                    <div class="contentBox">
		                        <ul>
		                            <li>
		                            	<p><a href="${path}/tip/tipDetail?tnum=${tipcList.tnum}&curPage=curTip"><c:out value="${tipcList.title}" escapeXml="false" /></a></p>
		                            </li>
		                            <li class="conBox">
		                            	<c:out value="${tipcList.contents}" escapeXml="false" />
		                            </li>
		                            <li>
		                            	<p><c:out value="${tipcList.createdate}" escapeXml="false" /></p>
		                                <div>
		                                    <i class="xi-eye-o"><span> ${tipcList.view_cnt}</span></i>
		                                </div>
		                            </li>
		                        </ul>
		                    </div>
		                </c:forEach>
		                <c:if test="${sessionScope.account.isadmin eq 'Y'}">
			                <div class="writeBox">
			                	<button class="createBtn">작성하기</button>
			            	</div>
			            </c:if>
	                </div>
	               <%
						// 현재 페이지
						int cnum = (Integer)request.getAttribute("cnum");
						// 전체 데이터 개수
						int cCount = (Integer)request.getAttribute("cCount");
						// 전체 페이지 개수
						int cTotal = cCount/3+((cCount%3==0)?0:1);
						// 한 블럭에서 가장 작은 번호를 가지는 페이지 번호
						int cMinBlock = (((cnum-1)/5)*5)+1;
						// 한 블럭에서 가장 큰 번호를 가지는 페이지 번호
						int cMmaxBlock = (((cnum-1)/5)+1)*5;
						
						pageContext.setAttribute("cTotal", cTotal);
						pageContext.setAttribute("cMinBlock", cMinBlock);
						pageContext.setAttribute("cMmaxBlock", cMmaxBlock);
					%>
					
					<div class="pageMoveBox">
						<div class="pageMove">
							<c:choose>
								<c:when test="${(cMinBlock-1) < 1 }">
									<span id="cantPrev">&#8249;</span>	
								</c:when>
								<c:otherwise>
									<a href="${path}/tip/goTip?cnum=${cMinBlock-1}&category=column" id="canPrev">&#8249;</a>
								</c:otherwise>
							</c:choose>
							
							<%-- <c:choose>
								<c:when test="${cnum==1 }">
									<span>◀</span>
								</c:when>
								<c:otherwise>
									<a href="${path}/tip/goTip?cnum=${num-1}&category=column">◀</a>
								</c:otherwise>
							</c:choose> --%>
							<c:forEach begin="${cMinBlock}" end="${(cTotal<cMmaxBlock)?cTotal:cMmaxBlock}" step="1" var="i">
								<c:choose>
									<c:when test="${cnum == i}">
										<span class="numCantMove">${i}</span>
									</c:when>
									<c:otherwise>
										<a href="${path}/tip/goTip?cnum=${i}&category=column" class="numMove">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- <c:choose>
								<c:when test="${cnum == cTotal }">
									<span>▶</span>
								</c:when>
								<c:otherwise>
									<a href="${path}/tip/goTip?cnum=${cnum+1}&category=column">▶</a>	
								</c:otherwise>
							</c:choose> --%>
							
							<c:choose>
								<c:when test="${cMmaxBlock > cTotal }">
									<span id="cantNext">&#8250;</span>	
								</c:when>
								<c:otherwise>
									<a href="${path}/tip/goTip?cnum=${cMmaxBlock+1}&category=column" id="canNext">&#8250;</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
                </div>
                
                <div id="workout" class="tabContent">
                    <ul class="titleBox">
                        <li>Diet Tips(운동)</li>
                    </ul>
                    
                    <div class="wPageing">
	                    <c:forEach var="tipwList" items="${wList}">
		                    <div class="contentBox">
		                        <ul>
		                            <li>
		                                <p><a href="${path}/tip/tipDetail?tnum=${tipwList.tnum}"><c:out value="${tipwList.title}" escapeXml="false" /></a></p>
		                            </li>
		                            <li>
		                            	<p>${tipwList.contents}</p>
		                            </li>
		                            <li>
		                                <p><c:out value="${tipwList.createdate}" escapeXml="false" /></p>
		                                <div>
		                                    <i class="xi-eye-o"><span> ${tipwList.view_cnt}</span></i>
		                                </div>
		                            </li>
		                        </ul>
		                    </div>
	                   	</c:forEach>
	                   	<c:if test="${sessionScope.account.isadmin eq 'Y'}">
			                <div class="writeBox">
			                	<button class="createBtn">작성하기</button>
			            	</div>
			            </c:if>
					</div>
					<%
						// 현재 페이지
						int wnum = (Integer)request.getAttribute("wnum");
						// 전체 데이터 개수
						int wCount = (Integer)request.getAttribute("wCount");
						// 전체 페이지 개수
						int wTotal = wCount/3+((wCount%3==0)?0:1);
						// 한 블럭에서 가장 작은 번호를 가지는 페이지 번호
						int wMinBlock = (((wnum-1)/5)*5)+1;
						// 한 블럭에서 가장 큰 번호를 가지는 페이지 번호
						int wMmaxBlock = (((wnum-1)/5)+1)*5;
						
						pageContext.setAttribute("wTotal", wTotal);
						pageContext.setAttribute("wMinBlock", wMinBlock);
						pageContext.setAttribute("wMmaxBlock", wMmaxBlock);
					%>
					
					<div class="pageMoveBox">
						<div class="pageMove">
							<c:choose>
								<c:when test="${(wMinBlock-1) < 1 }">
									<span id="cantPrev">&#8249;</span>	
								</c:when>
								<c:otherwise>
									<a href="${path}/tip/goTip?wnum=${wMinBlock-1}&category=workout" id="canPrev">&#8249;</a>
								</c:otherwise>
							</c:choose>
							
							<%-- <c:choose>
								<c:when test="${wnum==1 }">
									<span>◀</span>
								</c:when>
								<c:otherwise>
									<a href="${path}/tip/goTip?wnum=${wnum-1}&category=workout">◀</a>
								</c:otherwise>
							</c:choose> --%>
							<c:forEach begin="${wMinBlock}" end="${(wTotal<wMmaxBlock)?wTotal:wMmaxBlock}" step="1" var="j">
								<c:choose>
									<c:when test="${wnum == j}">
										<span class="numCantMove">${j}</span>
									</c:when>
									<c:otherwise>
										<a href="${path}/tip/goTip?wnum=${j}&category=workout" class="numMove">${j}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- <c:choose>
								<c:when test="${wnum == wTotal }">
									<span>▶</span>
								</c:when>
								<c:otherwise>
									<a href="${path}/tip/goTip?wnum=${wnum+1}&category=workout">▶</a>	
								</c:otherwise>
							</c:choose> --%>
							
							<c:choose>
								<c:when test="${wMmaxBlock > wTotal }">
									<span id="cantNext">&#8250;</span>	
								</c:when>
								<c:otherwise>
									<a href="${path}/tip/goTip?wnum=${wMmaxBlock+1}&category=workout" id="canNext">&#8250;</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>	
				</div>
			</div>
			
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript">
		$(document).on('click', '.createBtn', function(){
			location.href = '${path}/tip/createTip?curPage=curTip';
		});
		
	    $(function(){
	    	if("${category}" == "column") {
				$("#column").show();
				$("#workout").hide();
				$("#columnTab").addClass('active');
				$("#workoutTab").removeClass('active');		
			} else if("${category}" == "workout") {
				$("#column").hide();
				$("#workout").show();
				$("#columnTab").removeClass('active');
				$("#workoutTab").addClass('active');	
			}
	    	
	    	$("#columnTab").click(function(){
	    		$("#column").show();
				$("#workout").hide();
				$("#columnTab").addClass('active');
				$("#workoutTab").removeClass('active');	
	    	})
	    	
	    	$("#workoutTab").click(function(){
	    		$("#column").hide();
				$("#workout").show();
				$("#columnTab").removeClass('active');
				$("#workoutTab").addClass('active');
	    	})
	    })		
	</script>
</body>
</html>


















































