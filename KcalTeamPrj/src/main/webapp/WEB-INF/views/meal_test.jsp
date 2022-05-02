<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/meal_test.css"/>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<button id="getMeal">식단</button>
	
	<div id="mealController">
		<ul id="searchDate">
			<li><input type="text" id="datepicker_start" class="datepicker"/></li>
			<li>~</li>
			<li><input type="text" id="datepicker_end" class="datepicker" /></li>
			<li><button id="searchDateBtn">검색</button></li>
		</ul>
		<button id="kcalCalc">식단입력 바로가기 <i class="fas fa-sign-in-alt"></i></button>
	</div>
	
	<div id="content">
	</div>
	
	<script type="text/javascript">
	
		// 날짜선택 달력
	    $(".datepicker").datepicker({ 
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
		
		
	  // 달력 초기값 설정: 일주일 전 ~ 오늘
	    $('#datepicker_start').datepicker('setDate', '-7D');
	    $('#datepicker_end').datepicker('setDate', 'today');
		 
	    // 시작일 종료일
		let startDate = $("#datepicker_start").val();
		let endDate = $("#datepicker_end").val();
			
		$(function(){
			
			// 내 식단 리스트 불러오는 함수
			let getMeal = function(unum){
				const content = $("#content");
				content.empty();
				
				let data = {
						"unum" : unum,
						"startDate" : startDate,
						"endDate" : endDate
				}
				
				$.ajax({
		        	url: "${path}/kcal/mealList",
		        	type: "POST",	
		        	data: data,
		        	success: function(data) {
		        		
	        			if(data.length == 0) {
	        				let mealNone = document.createElement("div");
	        				mealNone.innerText = "해당 날짜에 저장된 식단이 없습니다.";
	        				mealNone.className = 'mealNone';
	        				content.append(mealNone);
		        		}else {
	        			
	        			let mealList = new Array();
	        			
			        		for(let item of data) {
			        			console.log(item.date);
			        			console.log(item.time);
			        			console.log(item.mealnum);
			        			console.log(item.menu);
			        			console.log(item.intake + "g");
			        			console.log(item.kcal + "kcal");
			        			
			        			let dateIndex = mealList.findIndex(i => i.date == item.date);
			        					        			
			        			if(dateIndex == -1) {
			        				let oneday = new Object();
			        				oneday.date = item.date;	
			        				let mealcards = new Array();
			        				oneday.mealcards = mealcards;
			        				oneday.todayKcal = 0;
			        				
			        				
			        				oneday = JSON.stringify(oneday)
			        				mealList.push(JSON.parse(oneday));
			        				
			        				dateIndex = mealList.findIndex(i => i.date == item.date);
			        				
			        				mealList[dateIndex].todayKcal += item.kcal;
			        			}else {
			        				mealList[dateIndex].todayKcal += item.kcal;
			        			}
	
			        			let cardIndex = mealList[dateIndex].mealcards.findIndex(i => i.mealnum == item.mealnum);
			        			if(cardIndex == -1) {
			        				let mealcard = new Object();
			        				mealcard.mealnum = item.mealnum;
			        				mealcard.time = item.time;
			        				let mealinfo = new Array();
			        				mealcard.mealinfo = mealinfo;
			        				mealcard.totalKcal = 0;
			        				
			        				mealcard = JSON.stringify(mealcard);
			        				mealList[dateIndex].mealcards.push(JSON.parse(mealcard));
			        				
			        				cardIndex = mealList[dateIndex].mealcards.findIndex(i => i.mealnum == item.mealnum);
	
			        				mealList[dateIndex].mealcards[cardIndex].totalKcal += item.kcal;
			        			}else {
			        				mealList[dateIndex].mealcards[cardIndex].totalKcal += item.kcal;
			        			}
			        			
			        			let mealinfo = new Object();
			        			mealinfo.menu = item.menu;
			        			mealinfo.intake = item.intake;
			        			mealinfo.kcal = item.kcal;
			        			
			        			mealinfo = JSON.stringify(mealinfo);
			        			mealList[dateIndex].mealcards[cardIndex].mealinfo.push(JSON.parse(mealinfo));
			        		}
			        		
			        		for(dateIndex in mealList) {
			        			let dayBox = document.createElement("div");
			        			dayBox.className = 'dayBox';	        			
			        			
			        			let dayTop = document.createElement("div");
			        			dayTop.className = 'dayTop';
			        			let mealDate = document.createElement("span");
			        			mealDate.className = 'mealDate';
			        			mealDate.innerText = mealList[dateIndex].date;
			        			let todayKcal = document.createElement("span");
			        			todayKcal.className = 'todayKcal';
			        			todayKcal.innerText = '하루 총 섭취 열량  ' + mealList[dateIndex].todayKcal + 'kcal';
			        			
			        			dayTop.append(mealDate);
			        			dayTop.append(todayKcal);
			        			dayBox.append(dayTop);
			        			
			        			let mealcards = document.createElement("div");
			        			mealcards.className = 'mealcards'
			        			
			        			for(cardIndex in mealList[dateIndex].mealcards) {
			        				let mealcard = document.createElement("div");
			        				mealcard.className = 'mealcard';
			        				
			        				let deleteBtn = document.createElement("span");
				        			deleteBtn.className = 'deleteBtn';
				        			deleteBtn.setAttribute('data-mealnum', mealList[dateIndex].mealcards[cardIndex].mealnum);
				        			deleteBtn.innerHTML = '<c:if test="${sessionScope.account.unum eq 1}"><i class="fas fa-times"></i></c:if>';
				        			mealcard.append(deleteBtn);
			        				
			        				let mealtime = document.createElement("span");
			        				mealtime.className = 'mealtime';
			        				mealtime.innerText = '식사 시간 ' + mealList[dateIndex].mealcards[cardIndex].time;
			        				let totalKcal = document.createElement("span");
			        				totalKcal.className = 'totalKcal';
			        				totalKcal.innerText = '총 열량 ' + mealList[dateIndex].mealcards[cardIndex].totalKcal + "kcal";
			        				
			        				let menuList = document.createElement("div");
			        				menuList.className = 'menuList';
			        				let table = document.createElement("table");		        				
			        				for(menuIndex in mealList[dateIndex].mealcards[cardIndex].mealinfo) {
			        					let tr = document.createElement("tr");
			        					let menuTd = document.createElement("td");
			        					menuTd.innerText = mealList[dateIndex].mealcards[cardIndex].mealinfo[menuIndex].menu;
			        					let intakeTd = document.createElement("td");
			        					intakeTd.innerText = mealList[dateIndex].mealcards[cardIndex].mealinfo[menuIndex].intake + "g";
			        					let kcalTd = document.createElement("td");
			        					kcalTd.innerText = mealList[dateIndex].mealcards[cardIndex].mealinfo[menuIndex].kcal + "kcal";
			        					
			        					tr.append(menuTd);
			        					tr.append(intakeTd);
			        					tr.append(kcalTd);
			        					
			        					table.append(tr);
			        					menuList.append(table);
			        				}
			        				
			        				mealcard.append(mealtime);	
			        				mealcard.append(menuList);
			        				mealcard.append(totalKcal);
			        				mealcards.append(mealcard);
			        				dayBox.append(mealcards);
			        			}
			        			
			        			content.append(dayBox);
			        		}
		        		}
		        		
		        	},
		        	error: function(data) {
		        		alert("error");	
		        	}
				})
			}

			// 식단탭 눌렀을때
			$(document).on('click', '#getMeal', function(){
				getMeal(1);
			})

			// 기간 설정해서 검색
			$(document).on('click', '#searchDateBtn', function(){
				startDate = $("#datepicker_start").val();
				endDate = $("#datepicker_end").val();
				getMeal(1);
			})
			
			
			// 식단 삭제
			$(document).on('click', '.deleteBtn', function(){
				let mealnum = $(this).data("mealnum");
				console.log(mealnum);
				let deleteConfirm = confirm("삭제하시겠습니까?");
				if(deleteConfirm) {
					$.ajax({
			        	url: "${path}/kcal/deleteMeal",
			        	type: "POST",	
			        	data: { "mealnum" : mealnum },
			        	success: function(data) {
			        		if(data == "success") {
			        			getMeal(1);
			        		}else {
			        			alert("error");
			        		}
			        	}
					})
				}
			})		
			
			
			// 식단검색 바로가기
			$(document).on('click', '#kcalCalc', function(){
				location.href = "${path}/kcal/goKcal?curPage=curKcal";
			})
			

		})
		
		
			
			
			
			
		
			
		
	</script>
</body>
</html>