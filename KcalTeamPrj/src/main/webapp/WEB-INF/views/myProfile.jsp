<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="${path}/css/meal_test.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/css/myprofile_4.css">
<script src="https://kit.fontawesome.com/604dbbab30.js"
	crossorigin="anonymous"></script>

<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<title>Insert title here</title>
<style>
.defaultImg {
	background-Image: url('${path}/images/myprofile/default-profile.png')
}
</style>
</head>

<body>
	<jsp:include page="community_header.jsp"></jsp:include>
	<div id="wrapper">


		<div id="profile">

			<div id="profileImg"
				<c:if test="${empty member.img_localname}">class="defaultImg"</c:if>
				<c:if test="${!empty member.img_localname}">style="background:url('${path}/images/myprofile/${member.img_servername}') no-repeat center center; background-size:contain;"
			 </c:if>></div>


			<div id="profileEx">
				<div>

					<div>
						<p id="usernick" style="display: inline-block;">${member.nickname}</p>

						<c:if test="${sessionScope.account.nickname ne member.nickname}">
							<span id="messageModal"><i
								class="fas fa-comments messageBtns"></i></span>
						</c:if>
						<c:if test="${sessionScope.account.nickname eq member.nickname}">
							<span id="messageBtn"><i
								class="far fa-envelope messageBtns"></i></span>
							<span id="profileSet"> <i
								class="fas fa-user-cog prosetBtn"></i>
							</span>
						</c:if>
						<c:choose>
					<c:when test="${followcheck eq 'true' }">
						
						<span><i class="fas fa-user-minus followBtns prosetBtn" id="followDeleteBtn"></i></span>
					</c:when>
					<c:when test="${followcheck eq 'false' }">
						
						<span><i class="fas fa-user-plus followBtns prosetBtn" id="followBtn"></i></span>
					</c:when>
					<c:when test="${followcheck eq 'mine' }">

					</c:when>

				</c:choose>

					</div>
				</div>
				<div id="modalOverlay"></div>
				<div id="followDiv">
					<p class="followCnt" id="followerBtn">????????? ${followerCnt}</p>
					<p class="followCnt" id="followeeBtn">????????? ${followeeCnt}</p>
				</div>
				<div>
					<p id="memComment">
						<c:if test="${null eq member.comment}">
                        ??????????????? ????????????.
                    </c:if>
						<c:if test="${null ne member.comment}">
                        ${member.comment}
                    </c:if>
					</p>
				</div>
				<div id="gofollowDiv">

				<%-- <c:choose>
					<c:when test="${followcheck eq 'true' }">
						
						<span><i class="fas fa-user-minus followBtns" id="followDeleteBtn"></i></span>
					</c:when>
					<c:when test="${followcheck eq 'false' }">
						
						<span><i class="fas fa-user-plus followBtns" id="followBtn"></i></span>
					</c:when>
					<c:when test="${followcheck eq 'mine' }">

					</c:when>

				</c:choose> --%>

			</div>
			</div>
			
		</div>




		<div id="imageModal" class="modal">

			<c:if test="${empty member.img_localname}">
				<img src="${path}/images/myprofile/default-profile.png" alt="" />

			</c:if>
			<c:if test="${!empty member.img_localname}">
				<img src="${path}/images/myprofile/${member.img_servername}" alt="" />
			</c:if>
			<span class="closeBtn"><i class="far fa-times-circle"></i></span>


		</div>
		<div id="followerModal" class="modal">
			<h2 class="modalTitle">??????????????????</h2>
			<span class="closeBtn"><i class="far fa-times-circle"></i></span>
			<div class="hr"></div>
			<ul>
				<c:forEach var="item" items="${followerList}">
					<li><div
							<c:if test="${empty item.erimg_servername}">class="defaultImg followImg"</c:if>
							<c:if test="${!empty item.erimg_servername}">class="followImg" style="background-Image:url('${path}/images/myprofile/${item.erimg_servername}');"
			 </c:if>></div>

						<a class="followA" href="main?nickname=${item.follower_n}">${item.follower_n}</a>
						<c:if test=""></c:if></li>
				</c:forEach>

			</ul>
		</div>
		<div id="followeeModal" class="modal">
			<h2 class="modalTitle">??????????????????</h2>
			<span class="closeBtn"><i class="far fa-times-circle"></i></span>
			<div class="hr"></div>
			<ul>
				<c:forEach var="item" items="${followeeList}">
					<li><div
							<c:if test="${empty item.eeimg_servername}">class="defaultImg followImg"</c:if>
							<c:if test="${!empty item.eeimg_servername}">class="followImg" style="background-Image:url('${path}/images/myprofile/${item.eeimg_servername}');"
			 </c:if>></div>
						<a class="followA" href="main?nickname=${item.followee_n}">${item.followee_n}</a>
						<button class="followCancle" id="followCancle">????????? ??????</button> <input type="text"
						id=followerNick class="displayNone" value="${item.follower_n}" />
						<input type="text" id=followeeNick class="displayNone"
						value="${item.followee_n}" /></li>
				</c:forEach>

			</ul>
		</div>
		<div id="profileModal" class="modal">
			<div id="profileDiv">
				<h2 class="modalTitle">????????? ??????</h2>
				
					<span class="closeBtn"><i class="far fa-times-circle"></i></span>
					<div class="hr"></div>

					<div id="proImgDiv">
						<div id="proImgPreview"
							<c:if test="${empty member.img_localname}">class="defaultImg"</c:if>
							<c:if test="${!empty member.img_localname}">style="background:url('${path}/images/myprofile/${member.img_servername}') no-repeat center center; background-size:contain;"
			 </c:if>>
						</div>
						<br> <label id="profileImgSetLB" for="profileImgSet">
						<p id="profileImgSetLBP">????????? ?????? ??????</p></label> <input type="file"
							id="profileImgSet" name="profileImgSet" />
					</div>
					<h3>????????????</h3>
					<textarea name="comment" id="comment" cols="40" rows="10">${member.comment}</textarea>
					<h3>?????? ?????? ??????</h3>
					<div class="hr" style="width: 100%;"></div>
					<ul id="profileSetUl">
						<li>????????? <input style="margin-left:99px" type="radio" name="p_isopen" id="ra_py"
							value="Y" <c:if test="${'Y' eq member.p_isopen}">checked</c:if>><label
							for="ra_py">??????</label> <input type="radio" name="p_isopen"
							id="ra_pn" value="N"
							<c:if test="${'N' eq member.p_isopen}">checked</c:if>><label
							for="ra_pn">?????????</label>
						</li>
						<li>???????????? <input style="margin-left:85px" type="radio" name="d_isopen" id="ra_dy"
							value="Y" <c:if test="${'Y' eq member.d_isopen}">checked</c:if>><label
							for="ra_dy">??????</label> <input type="radio" name="d_isopen"
							id="ra_dn" value="N"
							<c:if test="${'N' eq member.d_isopen}">checked</c:if>><label
							for="ra_dn">?????????</label>
						</li>
						<%-- <li>??????????????? <input style="margin-left:70px" type="radio" name="i_isopen" id="ra_iy"
							value="Y" <c:if test="${'Y' eq member.i_isopen}">checked</c:if>><label
							for="ra_iy">??????</label> <input type="radio" name="i_isopen"
							id="ra_in" value="N"
							<c:if test="${'N' eq member.i_isopen}">checked</c:if>><label
							for="ra_in">?????????</label>
						</li>
						<li>??????????????? <input style="margin-left:70px" type="radio" name="e_isopen" id="ra_ey"
							value="Y" <c:if test="${'Y' eq member.e_isopen}">checked</c:if>><label
							for="ra_ey">??????</label> <input type="radio" name="e_isopen"
							id="ra_en" value="N"
							<c:if test="${'N' eq member.e_isopen}">checked</c:if>><label
							for="ra_en">?????????</label>
						</li> --%>

					</ul>
					<div class="hr" style="width: 100%; margin-top:20px;"></div>
                   <div id="settingBtns">
					<button type="button" id="profileSetBtn">??????</button>
					<button type="button" id="profileCancleBtn">??????</button>
					</div>
				</div>
			

		</div>
		<!-- <div id="sendLetterDiv" class="modal">
	<h3>cksnlcxnklas</h3>
	</div> -->

		<div id="sendLetterDiv" class="modal">
		<h2 class="modalTitle">?????? ?????????</h2>
				
					<span class="closeBtn"><i class="far fa-times-circle"></i></span>
					<div class="hr"></div>
			<form action="${path}/letter/replyLetter" id="sendLetterModal"
				method="POST">
				<span id="sendCloseBtn" class="closeBtn"><i
					class="far fa-times-circle"></i></span>
				<ul>
					<li><span>?????????</span><input value="${member.nickname}"
						type="text" id="reply-recipient" name="rnick" readonly /></li>
					<li><input type="text" id="reply-title" name="title"
						placeholder="??????" /></li>
					<li><textarea cols="37" rows="17" id="reply-content" name="content"
							placeholder="??????"></textarea></li>
					<li><button type="button" id="replySubmit">??????</button></li>
				</ul>
				<input type="hidden" name="snick"
					value="${sessionScope.account.nickname}" />
			</form>
		</div>


		<ul id="menuBar">
			<li id="menuBar1"><label for="menu1">
					<h3 class="menuBarH3">
						?????????<input class="radioBtn" type="radio" name="menu" id="menu1"
							value=1 checked>
					</h3>
			</label></li>
			<li id="menuBar2"><label for="menu2">
					<h3 class="menuBarH3">
						????????????<input class="radioBtn" type="radio" name="menu" id="menu2"
							value=2>
					</h3>
			</label></li>
			<!-- <li id="menuBar3"><label for="menu3">
					<h3 class="menuBarH3">????????? ??????<input class="radioBtn" type="radio" name="menu" id="menu3" value=3></h3>
			</label></li>
			<li id="menuBar4"><label for="menu4">
					<h3 class="menuBarH3">???????????????<input class="radioBtn" type="radio" name="menu" id="menu4" value=4></h3>
			</label></li> -->
		</ul>
		<!-- ????????? ?????? ??? ??? -->
		<div id="postDetail" class="displayNone">
		<div class="postclickDiv">
			<h2 id="postTitleD"></h2>
			<p id="postDateD"></p>
			</div>
			<div style="width:100%; background-color:orangered" class="hr"></div>
			<div id="postImgD"></div>
			<p id="postContentD"></p>
			<div style="width:100%; background-color:orangered" class="hr"></div>
			<div id="postVRD">
				
			</div>
		</div>

		<!-- ????????? ?????? div -->
		<div id="writeDiv">
			<h3 id="wpWrite"></h3>
			<h4 id="wpTitle">??????</h4>
			<input name="postTitle" id="postTitle" type="text" />

			<h4 id="contenth4">??????</h4>
			<textarea name="postContent" id="postContent" cols="120" rows="40"></textarea>

			<h4 id="wpYN">????????? ?????? ??????</h4>
			<label for="post_isopenY">Yes</label><input type="radio"
				id="post_isopenY" name="post_isopen" value="Y" checked /> <label
				for="post_isopenN">No</label><input type="radio" name="post_isopen"
				id="post_isopenN" value="N" />
			<p>?????? ????????? ?????? 3????????? ???????????????.</p>
			<ul id="postfileUl">

				<li><label for="postfile1"><div id="postfile1Img"
							class="postImgDiv"></div></label><input type="file" class="postfiles"
					id="postfile1" /></li>
				<li><label for="postfile2"><div id="postfile2Img"
							class="postImgDiv"></div></label><input type="file" class="postfiles"
					id="postfile2" /></li>
				<li><label for="postfile3"><div id="postfile3Img"
							class="postImgDiv"></div></label><input type="file" class="postfiles"
					id="postfile3" /></li>
			</ul>
			<div id="postBtns">
				<!-- <button id="postSave"></button> -->
				<button id="postCancle">??????</button>
			</div>

		</div>



		<!-- ????????? -->
		<!-- section1 -->
		<c:choose>
			<c:when test="${sessionScope.account.nickname ne member.nickname}">
				<section id="section1" class="main">


					<c:if test="${'N' eq member.p_isopen }">
					
						<ul>
						<li class="noShow">
						<h3>??????????????????.</h3>
						</li></ul>

					</c:if>
					<c:if test="${'Y' eq member.p_isopen}">

						<ul id="userpostUl">
						</ul>
						<div id="pageBox"></div>
					</c:if>



				</section>
			</c:when>
			<c:when test="${sessionScope.account.nickname eq member.nickname}">
				<section id="section1" class="main">

					<span id="modifyBtn"><i class="fas fa-cog"></i></span> <span
						id="writeBtn"><i class="fas fa-pen"></i></span>

					<ul id="userpostUl">
					</ul>
					<div id="pageBox"></div>
				</section>

			</c:when>
		</c:choose>
		
		<!-- section2 -->
		<c:choose>
			<c:when test="${sessionScope.account.nickname ne member.nickname}">
				<section id="section2" class="main">


					<c:if test="${'N' eq member.d_isopen }">
					
						<ul>
						<li class="noShow">
						<h3>??????????????????.</h3>
						</li></ul>

					</c:if>
					<c:if test="${'Y' eq member.d_isopen}">
             <div id="mealController">
				<ul id="searchDate">
					<li><input type="text" id="datepicker_start"
						class="datepicker" /></li>
					<li>~</li>
					<li><input type="text" id="datepicker_end" class="datepicker" /></li>
					<li><button id="searchDateBtn">??????</button></li>
				</ul>
				
			</div>
						<div id="content"></div>
					</c:if>



				</section>
			</c:when>
			<c:when test="${sessionScope.account.nickname eq member.nickname}">
				<section id="section2" class="main">
                 <div id="mealController">
				<ul id="searchDate">
					<li><input type="text" id="datepicker_start"
						class="datepicker" /></li>
					<li>~</li>
					<li><input type="text" id="datepicker_end" class="datepicker" /></li>
					<li><button id="searchDateBtn">??????</button></li>
				</ul>
				<button id="kcalCalc">
					???????????? ???????????? <i class="fas fa-sign-in-alt"></i>
				</button>
			</div>

			<div id="content"></div>
				</section>

			</c:when>
		</c:choose>
		
	</div>






	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript">

	// ???????????? ??????
    $(".datepicker").datepicker({ 
		changeMonth: true, 
		changeYear: true, 
		minDate: '-50y', 
		nextText: '?????? ???', 
		prevText: '?????? ???', 
		yearRange: 'c-50:c+20', 
		showButtonPanel: true, 
		currentText: '?????? ??????', 
		closeText: '??????', 
		dateFormat: "yy-mm-dd", 
		showAnim: "slide", 
		showMonthAfterYear: true, 
		dayNamesMin: ['???', '???', '???', '???', '???', '???', '???'],
		monthNamesShort: ['1???','2???','3???','4???','5???','6???','7???','8???','9???','10???','11???','12???'] 
	});
	
	
  // ?????? ????????? ??????: ????????? ??? ~ ??????
    $('#datepicker_start').datepicker('setDate', '-7D');
    $('#datepicker_end').datepicker('setDate', 'today');
	 
    // ????????? ?????????
	let startDate = $("#datepicker_start").val();
	let endDate = $("#datepicker_end").val();
		
	
	
	
	
	
	
		$(function() {
			/* $("#getMeal").click(function(){
				getMeal(1);
			}) */
			 
			$("input:radio[name=menu]").click(function() {
				let checkValue = $("input:radio[name=menu]:checked").val();
				 $("input:radio[name=menu]").parent().css('color', 'dimgray');
				$("input:radio[name=menu]:checked").parent().css('color', 'orangered');
				$(".main").hide();
				$("#section" + checkValue).show();
				$("#writeDiv").hide();
				$("#postDetail").hide();

			});
			document.getElementById('menu1').click();
			
			$("#profileImg").click(function(){
				$("#modalOverlay").show();
				$("#imageModal").show();
			});

			$("#followerBtn").click(function() {
				$("#modalOverlay").show();
				$("#followerModal").show();
			});

			$("#followeeBtn").click(function() {
				$("#modalOverlay").show();
				$("#followeeModal").show();
			});

			$("#profileSet").click(function() {
				$("#modalOverlay").show();
				$("#profileModal").show();
			});
          /* modal x?????? */
			$(".closeBtn").click(function() {
				$("#modalOverlay").hide();
				$(".modal").hide();
				 
				
			});
			$("#profileCancleBtn").click(function(){
				$("#modalOverlay").hide();
				$(".modal").hide();
				
			});
			$("#modalOverlay").click(function() {
				$("#modalOverlay").hide();
				$(".modal").hide();
			});
			
			/* ????????? ?????? */
			$("#profileImgSet").change(function(){
				readInputFile(this);
			});

			$("#profileSetBtn").click(function() {
				
                 let profileUpdate={
                	"nickname":'${member.nickname}',
                	"comment":$("#comment").val(),
                	"p_isopen":$("input:radio[name=p_isopen]:checked").val(),
                	"d_isopen":$("input:radio[name=d_isopen]:checked").val(),
                	/* "i_isopen":$("input:radio[name=i_isopen]:checked").val(),
                	"e_isopen":$("input:radio[name=e_isopen]:checked").val() */
                	"i_isopen":'Y',
                	"e_isopen":'Y'
                } 
                const profileImg =$("#profileImgSet");
                const formData = new FormData();
                let files=profileImg[0].files;
                console.log(files);
                formData.append("uploadFile",files[0]);
                formData.append('data', new Blob([ JSON.stringify(profileUpdate)], {type : "application/json"}));
				$.ajax({
					url :'${path}/profile/profileUpdate',
					processData : false,
					contentType : false,
					enctype : 'multipart/form-data',
					type: "POST",	
	        		/* data: JSON.stringify(profileUpdate), */
	              /*   contentType : 'application/json; charset=UTF-8', */
	                data : formData,
					success : function(result) {
						if(result == "success") {
							$("#modalOverlay").hide();
							$(".modal").hide();
							alert("?????????????????? ?????????????????????.");
							location.reload();
						}
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("error");
					}
				});
                
			});
			
			
			
			function readInputFile(input){
				
				if(input.files && input.files[0]) { 
					var reader = new FileReader(); 
				reader.onload = function (e) { 
					
					$("#proImgPreview").css({"background-image":'url(\"'+e.target.result+'\")'}); 	
					} 
				
				reader.readAsDataURL(input.files[0]); 
				}

				
			}
			/*userpost ????????? */
			$("#writeBtn").click(function(){
				$("#postBtns").empty();
				let postSave=document.createElement("button");
				let postCancle=document.createElement("button");
				
				postCancle.setAttribute("id","postCancle");
				$("#postBtns").append(postCancle);
				postSave.setAttribute("id","postSave");
				$("#postBtns").prepend(postSave);
			    $("#section1").hide(); 
				$("#writeDiv").show();
				$("#wpWrite").text("????????? ??????");
				$("#postSave").text("??? ??????");
				$("#postCancle").text("??????");
			});
			
			$(document).on('click', '#postCancle', function(){
				 $("#writeDiv").hide();
					$("#writeDiv").load(location.reload());
			 
			 });
			$(".postfiles").change(function(e){
				let id=e.target.getAttribute('id');
				 readPostInputFile(this,id); 
			});
function readPostInputFile(input, id){
				console.log(id);
				if(input.files && input.files[0]) { 
					var reader = new FileReader(); 
				reader.onload = function (e) { 
					
					$("#"+id+"Img").css({"background-image":'url(\"'+e.target.result+'\")'}); 	
					} 
				
				reader.readAsDataURL(input.files[0]); 
				}

				
			}
/* ????????? ?????? ??? */
 $(document).on('click', '#flexWrap', function(){
	 $("#postVRD").empty();
	$("#postImgD").empty();
	$("#postDetail").show();
	$("#section1").hide();
	let recBtn=document.createElement("span");
	let listBtn=document.createElement("span");
	
	recBtn.setAttribute("data-pnum",$(this).data("pnum"));
	recBtn.setAttribute("id","recBtn");
	listBtn.setAttribute("id","listBtn");
	
	recBtn.innerHTML="<i class='xi-thumbs-up'></i>";
	listBtn.innerHTML="<i class='fas fa-list'></i>";
	$("#postVRD").prepend(recBtn);
	$("#postVRD").append(listBtn);
	
	let pnumval=$(this).data("pnum");
	let pnum={"pnum":pnumval};
	$.ajax({
		url:'${path}/post/userpostView',
		type:"POST",
		data: JSON.stringify(pnum),
		contentType:"application/json; charset=utf-8;", 
		
		success: function(data){
			
			$("#postTitleD").html(data.title);
	        $("#postDateD").html(data.createdate);
	        $("#postContentD").html(data.content);
	     
			$.ajax({
				url:'${path}/post/userpostViewImg',
				type:"POST",
				data: JSON.stringify(pnum),
				contentType:"application/json; charset=utf-8;",
				
				success: function(data){
					
					$(data).each(function(){
						
						$("#postImgD").append("<img src='${path}/images/postfile/"+this.servername+"'></img>");
						let recBtn=document.createElement("button");
						
						
						});
				},
				error: function(){
					alert("stringify error");
				}
			});
		},
		error: function(){
			alert("stringify error");
		}
	});  
	});
 $(document).on('click', '#recBtn', function(){
	 let pnumval=$(this).data("pnum");
		let pnum={"pnum":pnumval};
		console.log(pnum);
		$.ajax({
			url:'${path}/post/userpostRec',
			type:"POST",
			data: JSON.stringify(pnum),
			contentType:"application/json; charset=utf-8;", 
			
			success: function(result){
				if(result=="success"){
					alert("?????????????????????.")
					location.reload();
				}
		     
			},
			error: function(){
				alert("stringify error");
			}
		});  
	 
 });
 /* ??? ?????? ?????? */
 $(document).on('click', '#postSave', function(){
	 let userpost={
				"unum":'${member.unum}',
         	"content":$("#postContent").val(),
         	"title":$("#postTitle").val(),
         	"isopen":$("input:radio[name=post_isopen]:checked").val(),
         	
		}
		 const fileInput =$(".postfiles");
     const formData = new FormData();
     for (var i = 0; i < fileInput.length; i++) {
     	if (fileInput[i].files.length > 0) {
     		for (var j = 0; j < fileInput[i].files.length; j++) {           			
     			// formData??? 'postfile'????????? ???????????? fileInput ?????? append ?????????.  
     			formData.append('postfiles', $('.postfiles')[i].files[j]);
     		}
     	}
     }
     formData.append('userpost', new Blob([ JSON.stringify(userpost)], {type : "application/json"}));
	    
     $.ajax({
         url: '${path}/post/userpost',
         data: formData,
         contentType: false,               
         processData: false,  
         type: "POST",
         enctype : 'multipart/form-data',  
         success: function(result) {
           if (result=="success") {
            alert("???????????? ?????????????????????.");
				location.reload();
           } else {
            alert("??????");
            }
         }
   });
	
	 
 });
			
		
 $(document).on('click', '#listBtn', function(){
				$("#postDetail").hide();
				$("#section1").show();
			});
			
			/* ????????? ?????? */
			$(document).on('click', '#followCancle', function(){
				
				
				let deletefollow={
						"followee_n":$(this).siblings().last().val(),
						"follower_n":$(this).siblings().last().prev().val()
						}
				$(this).parent().remove();
				
				$.ajax({
					url:'${path}/follow/deletefollow',
					type:"POST",
					data: JSON.stringify(deletefollow),
					contentType:"application/json; charset=utf-8;",
					/* datatype: 'json' */
					success: function(result){
 						if (result=="success") {
	                        /*   alert("???????????? ?????????????????????.");
	   						location.reload(); */
	                      }else{
	                    	  alert("ERROR");
	                      }
					},
					error: function(){
						alert("stringify error");
					}
			})
			 

		});
         /* ????????? ?????? ??? ????????? ???????????? */
			let getuserpostList=function(pageNum){
				$("#userpostUl").empty();
				
				const userpostUl = $("#userpostUl");
				const pageBox=$("#pageBox");
				userpostUl.empty();
				pageBox.empty();
				let data={"pageNum" : pageNum,
						  "count" : 8,
						  "nickname":'${member.nickname}'
				}
				$.ajax({
		    		url: "${path}/pofile/getuserpostList",
		    		type: "POST",	
		    		data: data,
		            dataType : 'json',
		    		success: function(data) {
		    		  if(data[0].pageCnt==0){
		    			  const li= document.createElement("li");
		    			  let title=document.createElement("h3");
		    			  li.setAttribute("class","nopostLi")
		    			  title.setAttribute("class","nopost");
		    			  title.innerText="???????????? ????????????.";
		    			  li.append(title);
		    			  userpostUl.append(li);
		    		  }else{
		    			  
		    		  
		    			for(let item of data){             
		    				
		    				const li = document.createElement("li");
		    				let title=document.createElement("h3");
		    				let createdate=document.createElement("p");
		    				let flexWrap=document.createElement("div");
		    				let postThumbnail=document.createElement("div");
		    				let flexDiv=document.createElement("div");
		    				
		    				let content=document.createElement("p");
		    				let viewrec=document.createElement("p");
		    				let input=document.createElement("input");
		    				let deleteBtn=document.createElement("span");
		    				let modifyBtn=document.createElement("span");
		    				
		    				li.setAttribute("class","userpostLi");
		    				if(item.servername==null){
		    					 postThumbnail.setAttribute("style","background-Image:url('${path}/images/postfile/default.png')");  
		    				}else{
		    					
		    					 postThumbnail.setAttribute("style","background-Image:url('${path}/images/postfile/"+item.servername+"')");  	    				
		                         				
		    				}
		    				
		    				postThumbnail.setAttribute("class","postThumbnail");
		    				
		    				
		    				title.innerText = item.title;
		    				var timestamp=item.createdate;
		    				var date = new Date(timestamp);
		    				deleteBtn.innerHTML = '<i class="far fa-trash-alt userControll"></i>';
		    				modifyBtn.innerHTML = '<i class="fas fa-edit userControll"></i>';
			   		         createdate.innerText = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
			   		        
			   		         content.innerText = item.content;
			   		         viewrec.innerHTML = '<i class="xi-eye-o colorClass"></i>'+item.view_cnt+'&nbsp;&nbsp;&nbsp;&nbsp;<i class="xi-thumbs-up colorClass"></i>'+item.recommend;
			   		         content.setAttribute("class","postContentClass")
			   		        flexDiv.append(title);
			   		        flexDiv.append(content);
			   		        /* flexDiv.append(viewrec); */
			   		        flexWrap.append(postThumbnail);
			   		        flexWrap.append(flexDiv);
			   		        input.setAttribute("value",item.pnum);
			   		        input.setAttribute("style","display:none");
			   		      flexDiv.setAttribute("style","margin-left:40px; padding-top:10px"); 
			   		     flexWrap.setAttribute("style","display:flex; margin-left:20px");
			   		     flexWrap.setAttribute("id","flexWrap");
			   		     flexWrap.setAttribute("data-pnum", item.pnum);
			   		      title.setAttribute("style","margin-top:35px"); 
			   		   viewrec.setAttribute("style","position:absolute; right:30px; bottom:20px"); 
			   		li.setAttribute("style","position:relative; z-index:2");
			   		createdate.setAttribute("class","createdate");
			   		deleteBtn.setAttribute("id","postDeleteBtn");
			   		modifyBtn.setAttribute("id","postModifyBtn");
			   		deleteBtn.setAttribute("data-pnum", item.pnum);
   	        		modifyBtn.setAttribute("data-pnum", item.pnum);
   	        		
		    				
			   		      /* li.append(title); */
			   		      li.append(createdate);
			   		      li.append(flexWrap);
			   		      li.append(viewrec);
			   		      li.append(deleteBtn);
			   		      li.append(modifyBtn);
			   		      li.append(input);
			   		   
			   		   userpostUl.append(li);
                              }
		    			
		    			 let prePage = document.createElement("span");
		   	        	 prePage.innerHTML = '<span class="leftBtn"><p <p class="pageBtn ">&#8249;</p></span>';
		   	        	 if(pageNum != 1) {
		   	        		prePage.setAttribute("class", "PrePage");
		   	        		prePage.setAttribute("data-num", pageNum-1);
		   	        	    
		   	        		
		   	        	 }
	   	        		 pageBox.append(prePage);
	   	        		 
		    			
		    			 let nextPage = document.createElement("span");
			   	        	nextPage.innerHTML = '<span class="rightBtn"> <p class="pageBtn">&#8250;</p></span>';
			   	        	 if(pageNum != data[0].pageCnt) {
			   	        		nextPage.setAttribute("class", "NextPage");
			   	        		nextPage.setAttribute("data-num", pageNum+1);
			   	        		
			   	        	 }
			   	        	pageBox.append(nextPage);
			   	        	
		    			 }
		    		},
		    		
					error: function(){
						alert("stringify error");
					}
                })
                }
			// ??????????????? <
			 $(document).on('click', '.PrePage', function(){
				 getuserpostList($(this).data("num"));
			 })
			// ??????????????? >
			 $(document).on('click', '.NextPage', function(){
				 getuserpostList($(this).data("num"));
			 })
			 
			
			getuserpostList(1);
			 $("#modifyBtn").click(function(){
            	 $(".userControll").toggle();
				 
			 });
			
			 $("#followBtn").click(function(){
				 let send = confirm("???????????? ?????????????????????????");
  	    	   if(send) {
				 let followdata={"nickname":'${member.nickname}'}
				 
				 $.ajax({
						url:'${path}/follow/signupfollow',
						type:"POST",
						data: JSON.stringify(followdata),
						contentType:"application/json; charset=utf-8;",
						/* datatype: 'json' */
						success:function(result) {
		                      if (result=="success") {
		                          alert("????????? ????????? ?????????????????????.");
		   						location.reload();
		                      }else{
		                    	  alert("ERROR");
		                      }
						    
						},
						error: function(){
							alert("stringify error");
						}
				 
			 })
  	    	   }
			 });
             $("#followDeleteBtn").click(function(){
            	  let send = confirm("???????????? ?????????????????????????");
    	    	   if(send) {
           	  
    	    	   
 				let deletefollow={
 						"follower_n":'${sessionScope.account.nickname}',
 						"followee_n":'${member.nickname}'
 						}
 				
 				
 				$.ajax({
 					url:'${path}/follow/deletefollow',
 					type:"POST",
 					data: JSON.stringify(deletefollow),
 					contentType:"application/json; charset=utf-8;",
 					/* datatype: 'json' */
 					success: function(result){
 						if (result=="success") {
	                          alert("???????????? ?????????????????????.");
	   						location.reload();
	                      }else{
	                    	  alert("ERROR");
	                      }
 					    
 					},
 					error: function(){
 						alert("stringify error");
 					}
 				
 			})
    	    	   }
				 
			 });
              $("#messageBtn").click(function(){
            	  let send = confirm("??????????????? ??????????????? ??????????????????????");
     	    	   if(send) {
            	  location.href = '${path}/member/mypage?currTab=letter';
     	    	   }
			  });
              $("#messageModal").click(function(){
            	  $("#sendLetterDiv").show();
            	  $("#modalOverlay").show();
			 });
              $("#replySubmit").click(function(){
            	  let send = confirm("????????? ?????????????????????????");
      	    	   if(send) {
      	    		   $.ajax({
      	    			   url: "${path}/letter/replyLetter",
      	                   type:   "POST",
      	                   data: $("#sendLetterModal").serialize(), 
      	                   success: function(data){
      	                	   if(data == "s") {
      	                		   alert("????????? ??????????????? ??????????????????.");
      	                		 location.reload();
      				    		   $("#reply-title").val("");
      				    		   $("#reply-content").val("");				    		   
      	                	   }else {
      	                		   alert("error");
      	                	   }
      	                   }
      	    		   })
      	    		   
      	    	   }
			 });
            
             
              $(document).on('click', '#postDeleteBtn', function(){
            	  let pnumval=$(this).data("pnum");
            	  console.log(pnumval);
                	let pnum={"pnum":pnumval};
            	  let send = confirm("???????????? ?????????????????????????");
            	  if(send) {
     	    		   $.ajax({
     	    			  url:'${path}/post/userpostDelete',
     	           		type:"POST",
     	           	contentType: 'application/json; charset=utf-8',
     	           		data: JSON.stringify(pnum),
     	                   success: function(data){
     	                	   if(data == "delete") {
     	                		   alert("???????????? ?????????????????????.");
     	                		  location.reload();
     				    		  		    		   
     	                	   }else {
     	                		   alert("error");
     	                	   }
     	                   },	error: function(){
             					alert("stringify error");
             				}
                        })
                    }
             			});
             		
              
          
              $(document).on('click', '#postModifyBtn', function(){
            	  $("#postBtns").empty();
            	  $("#section1").hide(); 
  				$("#writeDiv").show();
  				$("#wpWrite").text("????????? ??????");
  				
  				let postModify=document.createElement("button");
  				let postCancle=document.createElement("button");
				postModify.setAttribute("id","postModify");
				postModify.setAttribute("data-pnum",$(this).data("pnum"));
				postCancle.setAttribute("id","postCancle");
				$("#postBtns").prepend(postModify);
				$("#postBtns").append(postCancle);
				$("#postCancle").text("??????");
				
				$("#postModify").text("??? ??????");
  				
  				let pnumval=$(this).data("pnum");
  				let pnum={"pnum":pnumval};
  				$.ajax({
  					url:'${path}/post/userpostView',
  					type:"POST",
  					data: JSON.stringify(pnum),
  					contentType:"application/json; charset=utf-8;", 
  					
  					success: function(data){
  						
  						$("input:radio[name ='post_isopen']:input[value="+data.isopen+"]").attr("checked", true);

  				      $("#postTitle").val(data.title);
  				      $("#postContent").val(data.content);
  				     
  						  $.ajax({
  							url:'${path}/post/userpostViewImg',
  							type:"POST",
  							data: JSON.stringify(pnum),
  							contentType:"application/json; charset=utf-8;",
  							
  							success: function(data){
  								
  								$(data).each(function(){
  									
  									$("#postImgD").append("<img src='${path}/images/postfile/"+this.servername+"'></img>");
  									});
  							},
  							error: function(){
  								alert("stringify error");
  							}
  						}); 
  					},
  					error: function(){
  						alert("stringify error");
  					}
  				});  
  				
 			 });
              $(document).on('click', '#postModify', function(){
            	  let userpost={
          				"pnum":$(this).data("pnum"),
                   	"content":$("#postContent").val(),
                   	"title":$("#postTitle").val(),
                   	"isopen":$("input:radio[name=post_isopen]:checked").val(),
                   	
          		}
          		 const fileInput =$(".postfiles");
               const formData = new FormData();
               for (var i = 0; i < fileInput.length; i++) {
               	if (fileInput[i].files.length > 0) {
               		for (var j = 0; j < fileInput[i].files.length; j++) {           			
               			// formData??? 'postfile'????????? ???????????? fileInput ?????? append ?????????.  
               			formData.append('postfiles', $('.postfiles')[i].files[j]);
               		}
               	}
               }
               formData.append('userpost', new Blob([ JSON.stringify(userpost)], {type : "application/json"}));
          	    
               $.ajax({
                   url: '${path}/post/userpostModify',
                   data: formData,
                   contentType: false,               
                   processData: false,  
                   type: "POST",
                   enctype : 'multipart/form-data',  
                   success: function(result) {
                     if (result=="success") {
                      alert("???????????? ?????????????????????.");
          				location.reload();
                     } else {
                      alert("??????");
                      }
                   }
             });
          	
            	  
              });
              
           // ??? ?????? ????????? ???????????? ??????
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
  	        				mealNone.innerText = "?????? ????????? ????????? ????????? ????????????.";
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
  			        			todayKcal.innerText = '?????? ??? ?????? ??????  ' + mealList[dateIndex].todayKcal + 'kcal';
  			        			
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
  			        				mealtime.innerText = '?????? ?????? ' + mealList[dateIndex].mealcards[cardIndex].time;
  			        				let totalKcal = document.createElement("span");
  			        				totalKcal.className = 'totalKcal';
  			        				totalKcal.innerText = '??? ?????? ' + mealList[dateIndex].mealcards[cardIndex].totalKcal + "kcal";
  			        				
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

  		/* 	// ????????? ????????????
  			$(document).on('click', '#getMeal', function(){
  				getMeal(1);
  			}) */
  			getMeal(${member.unum});

  			// ?????? ???????????? ??????
  			$(document).on('click', '#searchDateBtn', function(){
  				startDate = $("#datepicker_start").val();
  				endDate = $("#datepicker_end").val();
  				getMeal(${member.unum});
  			})
  			
  			
  			// ?????? ??????
  			$(document).on('click', '.deleteBtn', function(){
  				let mealnum = $(this).data("mealnum");
  				console.log(mealnum);
  				let deleteConfirm = confirm("?????????????????????????");
  				if(deleteConfirm) {
  					$.ajax({
  			        	url: "${path}/kcal/deleteMeal",
  			        	type: "POST",	
  			        	data: { "mealnum" : mealnum },
  			        	success: function(data) {
  			        		if(data == "success") {
  			        			getMeal(${member.unum});
  			        		}else {
  			        			alert("error");
  			        		}
  			        	}
  					})
  				}
  			})		
  			
  			
  			// ???????????? ????????????
  			$(document).on('click', '#kcalCalc', function(){
  				location.href = "${path}/kcal/goKcal?curPage=curKcal";
  			})
  			
  			// ???????????? ??????
  			$(document).on('click', '.menuTab', function(){
	        	 location.href = "${path}/community/bbs?category="+$(this).data("category");	        	 
	         })
  			 
		    		
		});
		
	</script>
</body>

</html>