<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/kcal.css"/>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

</head>
<body>
	<div class="container">
		<jsp:include page="main_menu_bar.jsp"></jsp:include>
		
		<div class="kcalBox">
            <div class="kcalImg">
                <img src="${path}/images/menu/kcalImg.jpg" alt="">
                <div class="kcalImgMent">
                    <p>Kcal Calculator</p>
                </div>
            </div>

            <div class="kcalContents">
                <div class="kcalTitle">칼로리 계산기</div>

                <div id="fKcal" class="tabContent">
                	<div id="calcResult">
                		<p id="calcResultMent">원하는 음식들을 담아 한 끼 칼로리를 계산해보세요.</p>
                		<c:if test="${!empty sessionScope.account}">	          
							<div id="saveBox">
	                			<input type="text" id="datepicker" placeholder="날짜 선택">
	                			<input type="text" id="timepicker" placeholder="시간 선택">
		                		<button id="saveBtn">내 식단에 저장</button>
                			</div>
	        			</c:if>
	        			<c:if test="${empty sessionScope.account}">
	        				<p>* 식단저장은 <a href="${path}/member/goLogin">로그인</a> 후 가능합니다.</p>
	        			</c:if>
                	</div>
                	
	                <div id="myMeal">
	                	<p id="myMealTitle">선택한 음식</p>
	                	<p id="myMealMent">음식 검색 후 섭취량을 입력하고<br>추가 버튼을 클릭하세요.</p>
	                	<table id="menuList">
	                	</table>
	                	<div id="btns">
			                <button id="reset">초기화</button>
			                <button id="calcBtn">계산</button>
	                	</div>
	                </div>
	                
	                <div id="searchCon">
	                	<div id="searchBox">
	                		<input type="text" id="inputFood" placeholder="음식 이름 입력"/>
							<button type="button" id="searchFood">검색</button>
	                	</div>
	                    
						<table id="food">
							<thead>
								<tr>
									<th>음식명</th>
									<th>1회 제공량</th>
									<th>칼로리</th>
									<th>섭취량(g)</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="foodList">
							</tbody>
						</table>
					</div>
                </div>
            </div>
        </div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script type="text/javascript">
	    
	    $("#food").css("display", "none");
	    
	    // 날짜선택
	    $("#datepicker").datepicker({ 
			changeMonth: true, 
			changeYear: true, 
			minDate: '-50y', 
			nextText: '다음 달', 
			prevText: '이전 달', 
			yearRange: 'c-50:c+20', 
			showButtonPanel: true, 
			currentText: '오늘 날짜', 
			closeText: '닫기', 
			dateFormat: "yy-mm-dd", 
			showAnim: "slide", 
			showMonthAfterYear: true, 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
		});
	    
	    // 시간선택
	    $("#timepicker").timepicker({
	        timeFormat: 'H:mm',
	        interval: 30,
	        minTime: '00:00',
	        maxTime: '23:30',
	        defaultTime: '6',
	        startTime: '00:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true        
	    });
	    
	    
	    // 음식 검색
	    $(function(){
			$("#searchFood").click(function(){
				$("#food").css("display", "none");
				
				if($("#inputFood").val() == "") {
					alert("검색 결과가 없습니다.");
				}else {
					
					$("#foodList").empty();
			    	const foodList = document.querySelector("#foodList");
					
		        	let food = $("#inputFood").val();
		        	
		        	$.ajax({
			        	url: "${path}/food/getData",
			        	type: "POST",	
			        	data: { "food" : food },
			        	success: function(data) {
			        		if(data.length == 0){
			        			console.log("결과 없음");
			        			alert("검색결과가 없습니다.");
			        		}else {
			        			$("#food").css("display", "block");
			        			for(let item of data) {				       				
				       				
				       				const tr = document.createElement("tr");
				   		        	 let nameTd = document.createElement("td");
				   		        	 let sizeTd = document.createElement("td");
				   		        	 let kcalTd = document.createElement("td");
				   		        	 let intakeTd = document.createElement("td");
				   		        	 let putTd = document.createElement("td");
				   		        	 
				   		        	 
				   		        	 nameTd.innerText = item.foodName;
				   		        	 nameTd.setAttribute('class', 'fname');
				   		        	 sizeTd.innerText = item.servingSize + "g";
				   		        	 sizeTd.setAttribute('class', 'fsize');
				   		        	 sizeTd.setAttribute('data-size', item.servingSize);
				   		        	 kcalTd.innerText = item.kcal + " kcal";
				   		        	 kcalTd.setAttribute('class', 'fkcal');
				   		        	 kcalTd.setAttribute('data-kcal', item.kcal);
				   		        	 
				   		        	 let intake = document.createElement("input");
				   		        	 intake.setAttribute('class', 'intake');
				   		        	 intake.setAttribute('placeholder', '예) 130');
				   		        	 intakeTd.append(intake);
				   		        	 
				   		        	 let button = document.createElement("button");
				   		        	 button.setAttribute('class', 'putBtn');
				   		        	 button.innerText = "추가";
				   		        	 putTd.append(button);				   		        	
				   		        	 
				   		        	 tr.append(nameTd);
				   		        	 tr.append(sizeTd);
				   		        	 tr.append(kcalTd);
				   		        	 tr.append(intakeTd);
				   		        	 tr.append(putTd);
				   	        		 
				   		        	 foodList.append(tr);
				       			}
			        		}
			        	},
			        	error: function(data) {
			        		alert("error");
			        	}
			        })
				}
				
	        })


	        let jsonArray = new Array();
	    	let menuNum = 0;
	        
	    	// 추가 버튼 클릭
	        $(document).on('click', '.putBtn', function(){
	        	$("#myMealMent").css("display", "none");
	        	
	        	let fname = $(this).parent().prevAll('.fname').text();
	        	let fsize = $(this).parent().prevAll('.fsize').data('size');
	        	let fkcal = $(this).parent().prevAll('.fkcal').data('kcal');
	        	let intake = Number($(this).parent().prev().children('.intake').val());
	        	let calcKcal = Math.round( (intake / fsize) * fkcal );		//소수점은 반올림
	        	
	        	console.log(typeof(intake));
	        	console.log(intake);
	        	
	        	if((intake <= 0) || (isNaN(intake) == true)) {
	        		alert("올바르지 않은 입력입니다.");
	        	} else {
		        	/* alert(fname + " / " + fsize + " / " + fkcal + " / " + intake + " / " + calcKcal); */
		        	
		        	let jsonObj = new Object();
		        	
		        	jsonObj.num = menuNum;
		        	jsonObj.menu = fname;
		        	jsonObj.intake = intake;
		        	jsonObj.kcal = calcKcal;
		        	
		        	jsonObj = JSON.stringify(jsonObj);
		        	jsonArray.push(JSON.parse(jsonObj));     	
	    	
		        	console.log(jsonArray);
		    
		        	
		        	
		        	const menuList = document.querySelector("#menuList");
		        	const tr = document.createElement("tr");
		        	let nameTd = document.createElement("td");
			        let intakeTd = document.createElement("td");
			        let kcalTd = document.createElement("td");
			        let removeTd = document.createElement("td");
			        
			        nameTd.innerText = fname;
			        intakeTd.innerText = intake + "g";
			        kcalTd.innerText = calcKcal + "kcal";
			        removeTd.innerHTML = "<i class='fas fa-times'></i>";
			        removeTd.setAttribute('class', 'remove');
			        removeTd.setAttribute('data-num', menuNum);
			        
			        tr.append(nameTd);
			        tr.append(intakeTd);
			        tr.append(kcalTd);
			        tr.append(removeTd);
		        		 
			        
			        menuList.append(tr);
			        
			        menuNum++;
	        		
	        	}
	        	
	        	
	        })
	        
	        // x버튼 클릭시 해당 음식 제거, jsonArray에서도 삭제
	        $(document).on('click', '.remove', function(){
	        	$(this).parent().remove();
	        	let num = $(this).data('num');
	        	console.log(num);
	        	jsonArray.splice(jsonArray.findIndex(i => i.num == num), 1);
	        	console.log(jsonArray);
	        	
	        	if(jsonArray.length == 0) {
	        		$("#myMealMent").css("display", "block");
	        	}
	        })
	        
	        // 초기화 버튼 클릭시 모든 음식 제거, jsonArray 비우기
	        $(document).on('click', '#reset', function(){
	        	$("#menuList").empty();
	        	jsonArray.splice(0, jsonArray.length);
	        	console.log(jsonArray);
	        	
	        	kcalAll = 0;
	        	$("#calcResultMent").text("원하는 음식을 담아 한 끼 칼로리를 계산해보세요.");
	        	$("#myMealMent").css("display", "block");
	        })
	        
	        
	        let kcalAll = 0;
	    	// 계산하기 버튼
	        $(document).on('click', '#calcBtn', function(){
	        	kcalAll = 0;
	        	for(let i = 0; i < jsonArray.length; i++) {
	        		kcalAll += jsonArray[i].kcal;
	        	}
	        	
	        	$("#calcResultMent").html("선택한 음식들의 총 칼로리는 <span>" + kcalAll + "kcal</span> 입니다.");
	        })
	        
	        // 저장하기 버튼 
	        $(document).on('click', '#saveBtn', function(){
	        	let date = $("#datepicker").val();
	        	let time = $("#timepicker").val();
	        	
	        	let data = {
	        			"foodList" : JSON.stringify(jsonArray),
	        			"kcalAll" : kcalAll,
	        			"date" : date,
	        			"time" : time
	        	}
	        	
	        	if(kcalAll == 0) {
	        		alert("저장할 데이터가 없습니다.");
	        	}else if(date == "") {
	        		alert("날짜를 선택해주세요.");
	        	}else if(time == "") {
	        		alert("시간을 선택해주세요.");
	        	}else {
	        		
			        $.ajax({
				       	url: "${path}/kcal/saveMyMeal",
				       	type: "POST",	
				       	data: data,
				       	success: function(data) {
				       		if(data == "success") {
				       			alert("식단이 저장되었습니다.");
				       		}else {
				       			alert("error");
				       		}
				       	},
				       	error: function(data) {
				       		alert("error");
				       	}
				    })
		        		
	        	}
	        	
	        	
	        	
	        	
	        })
	        
	        
	        
	        
	    })
	</script>
</body>
</html>