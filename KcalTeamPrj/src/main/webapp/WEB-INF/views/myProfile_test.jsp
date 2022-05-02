<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/css/myProfile_re.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://kit.fontawesome.com/604dbbab30.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="community_header.jsp"></jsp:include>

		<div class="profileContainer">
			<div class="profileBox">
				<div class="photo">
					<img src="${path}/images/main/main1.jpg" alt="">
				</div>
				<div class="info">
					<ul>
						<li>
							<p>계랑마리</p>
							<div>
								<i class="xi-mail-o" id="messageModal"></i> <i class="xi-cog"
									id="settingModal"></i>
							</div>
						</li>
						<li>
							<p id="followerBox">
								팔로워 <span>5000</span>
							</p>
							<p id="followBox">
								팔로우 <span>2000</span>
							</p>
						</li>
						<li>
							<p>안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요
								정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요
								정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요
								정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요 정민구입니다.안녕하세요
								정민구입니다.</p>
						</li>
					</ul>
				</div>
			</div>


			<div class="tabBox">
				<ul>
					<li><label for="menu1">게시물 <input type="radio"
							name="menu" id="menu1" class="menu" value="1" checked>
					</label></li>
					<li><label for="menu2">식단기록 <input type="radio"
							name="menu" id="menu2" class="menu" value="2">
					</label></li>
					<li><label for="menu3">인바디기록 <input type="radio"
							name="menu" id="menu3" class="menu" value="3">
					</label></li>
					<li><label for="menu4">운동계획표 <input type="radio"
							name="menu" id="menu4" class="menu" value="4">
					</label></li>
				</ul>
			</div>



			<!-- 게시물 -->
					<div id="section1" class="main postBox">
						<c:if test="${'N' eq member.p_isopen }">
						<p>비공개입니다.</p>

					</c:if>
					<c:if test="${'Y' eq member.p_isopen}">

						<ul id="userpostUl">
						</ul>
                      <div id="pageBox"></div>
					</c:if>
						<div class="postListBox">
							<div class="postCard">
								<p class="postDate">2022-02-08</p>
								<div class="postContent">
									<div class="postImg">
										<img src="${path}/images/main/main1.jpg" alt="">
									</div>

									<div class="postBtnBox">
										<i class="xi-pen" id="writeBtn"></i> <i class="xi-cog"></i>
									</div>



									<ul>
										<li>이곳은 제목이 들어갈 곳입니다.asdfasdfasdfasdfsd</li>
										<li>이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳
											입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다 .이곳은 내용이 들어갈 곳
											입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은
											내용이 들어갈 곳 입니다.</li>
										<li><i class="xi-eye-o"><span> 20000</span></i> <i
											class="xi-thumbs-up"><span> 20000</span></i></li>
									</ul>
								</div>
							</div>

							<div class="postCard">
								<p class="postDate">2022-02-08</p>
								<div class="postContent">
									<div class="postImg">
										<img src="${path}/images/main/main2.jpg" alt="">
									</div>
									<ul>
										<li>이곳은 제목이 들어갈 곳입니다.asdfasdfasdfasdfsd</li>
										<li>이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳
											입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다 .이곳은 내용이 들어갈 곳
											입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은
											내용이 들어갈 곳 입니다.</li>
										<li><i class="xi-eye-o"><span> 20000</span></i> <i
											class="xi-thumbs-up"><span> 20000</span></i></li>
									</ul>
								</div>
							</div>

							<div class="postCard">
								<p class="postDate">2022-02-08</p>
								<div class="postContent">
									<div class="postImg">
										<img src="${path}/images/main/main3.jpg" alt="">
									</div>
									<ul>
										<li>이곳은 제목이 들어갈 곳입니다.asdfasdfasdfasdfsd</li>
										<li>이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳
											입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다 .이곳은 내용이 들어갈 곳
											입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은
											내용이 들어갈 곳 입니다.</li>
										<li><i class="xi-eye-o"><span> 20000</span></i> <i
											class="xi-thumbs-up"><span> 20000</span></i></li>
									</ul>
								</div>
							</div>

							<div class="postCard">
								<p class="postDate">2022-02-08</p>
								<div class="postContent">
									<div class="postImg">
										<img src="${path}/images/main/main4.jpg" alt="">
									</div>
									<ul>
										<li>이곳은 제목이 들어갈 곳입니다.asdfasdfasdfasdfsd</li>
										<li>이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳
											입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다 .이곳은 내용이 들어갈 곳
											입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은 내용이 들어갈 곳 입니다.이곳은
											내용이 들어갈 곳 입니다.</li>
										<li><i class="xi-eye-o"><span> 20000</span></i> <i
											class="xi-thumbs-up"><span> 20000</span></i></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="pageBtnBox">
							<p>&#8249;</p>
							<p>&#8250;</p>
						</div>
					</div>
					<!-- ================================== -->

					<!-- 식단기록 -->
					<div id="section2" class="main">
						<p>asdfasdfsdf</p>
					</div>

					<!-- ================================== -->

					<!-- 인바디기록 -->
					<div id="section3" class="main">
						<p>서비스 준비중입니다.</p>
					</div>

					<!-- ================================== -->

					<!-- 운동기록 -->
					<div id="section4" class="main">
						<p>서비스 준비중입니다.</p>
					</div>

					<!-- ================================== -->

					<!-- 글쓰기 -->
					<div id="writeDiv">
						<ul>
							<li>
								<p>게시물작성</p>
							</li>
							<li><label for="postTitle">제목</label> <input type="text"
								id="postTitle" name="postTitle"></li>
							<li><label for="postContent">내용</label> <textarea
									id="postContent" name="postContent" id="" cols="30" rows="10"></textarea>
							</li>
							<li>
								<p>게시글 공개 여부</p>
								<div>
									<label for="post_isopenY">공개</label> <input type="radio"
										id="post_isopenY" name="post_isopen" value="Y"> <label
										for="post_isopenN">비공개</label> <input type="radio"
										id="post_isopenN" name="post_isopen" value="N">
								</div>
							</li>
							<li>사진 파일은 최대 3개 까지 가능합니다.</li>
							<li>
								<div id="postfile1Img">
									<label for="postfile1"><span>Image</span></label> <input
										type="file" class="postfiles" id="postfile1">
								</div>
								<div id="postfile2Img">
									<label for="postfile2"><span>Image</span></label> <input
										type="file" class="postfiles" id="postfile2">
								</div>
								<div id="postfile3Img">
									<label for="postfile3"><span>Image</span></label> <input
										type="file" class="postfiles" id="postfile3">
								</div>
							</li>
							<li>
								<div class="choiceBtnBox">
									<button id="postCancle">취 소</button>
									<button id="postSave">작성완료</button>
								</div>
							</li>
						</ul>
					</div>






					<!-- profile setting 모달================================== -->

					<div class="settingModalContainer" id="settingContainer">
						<div class="settingBox">
							<ul>
								<span id="closeSetting">&Cross;</span>
								<li>
									<p>프로필 설정</p>
								</li>
								<li>
									<div class="changeImg">
										<img src="${path}/images/main/fcimg.jpg" alt="">
									</div>
									<button>프로필 사진변경</button>
								</li>
								<li>
									<p>자기소개</p> <textarea name="" id="" cols="30" rows="10"></textarea>
								</li>
								<li>
									<p>공개여부 설정</p>
								</li>
								<li>
									<p>게시물</p> <input type="radio" name="p_isopen" id="ra_py"
									value="Y" checked> <label for="ra_py">공개</label> <input
									type="radio" name="p_isopen" id="ra_pn" value="N"> <label
									for="ra_pn">비공개</label>
								</li>
								<li>
									<p>식단기록</p> <input type="radio" name="d_isopen" id="ra_dy"
									value="Y" checked> <label for="ra_dy">공개</label> <input
									type="radio" name="d_isopen" id="ra_dn" value="N"> <label
									for="ra_dn">비공개</label>
								</li>
								<li>
									<p>인바디기록</p> <input type="radio" name="i_isopen" id="ra_iy"
									value="Y" checked> <label for="ra_iy">공개</label> <input
									type="radio" name="i_isopen" id="ra_in" value="N"> <label
									for="ra_in">비공개</label>
								</li>
								<li>
									<p>운동계획표</p> <input type="radio" name="e_isopen" id="ra_ey"
									value="Y" checked> <label for="ra_ey">공개</label> <input
									type="radio" name="e_isopen" id="ra_en" value="N"> <label
									for="ra_en">비공개</label>
								</li>
								<li>
									<div>
										<button type="button" id="profileCancelBtn">취소</button>
										<button type="button" id="profileSetBtn">저장</button>
									</div>
								</li>
							</ul>
						</div>
					</div>






					<!-- 팔로워 모달================================== -->

					<div class="followContainer follower">
						<div class="followBox">
							<div class="followTitle">
								<p>팔로워</p>
								<span id="closeFollower">&Cross;</span>
							</div>
							<div class="followList">
								<ul>
									<li>
										<div>
											<img src="${path}/images/main/fcimg.jpg" alt="">
										</div>
										<p>계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/main/fcimg.jpg" alt="">
										</div>
										<p>계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/csImg.jpg" alt="">
										</div>
										<p>계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/csImg.jpg" alt="">
										</div>
										<p>계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/csImg.jpg" alt="">
										</div>
										<p>계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/csImg.jpg" alt="">
										</div>
										<p>계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/csImg.jpg" alt="">
										</div>
										<p>계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/csImg.jpg" alt="">
										</div>
										<p>계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/csImg.jpg" alt="">
										</div>
										<p>계랑마리</p>
										<button>팔로우 취소</button>
									</li>
								</ul>
							</div>
						</div>
					</div>





					<!-- 팔로우 모달================================== -->

					<div class="followContainer follow">
						<div class="followBox">
							<div class="followTitle">
								<p>팔로워</p>
								<span id="closeFollow">&Cross;</span>
							</div>
							<div class="followList">
								<ul>
									<li>
										<div>
											<img src="${path}/images/menu/tipImg.jpg" alt="">
										</div>
										<p>치즈계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/tipImg.jpg" alt="">
										</div>
										<p>치즈계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/tipImg.jpg" alt="">
										</div>
										<p>치즈계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/tipImg.jpg" alt="">
										</div>
										<p>치즈계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/tipImg.jpg" alt="">
										</div>
										<p>치즈계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/tipImg.jpg" alt="">
										</div>
										<p>치즈계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/tipImg.jpg" alt="">
										</div>
										<p>치즈계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/tipImg.jpg" alt="">
										</div>
										<p>치즈계랑마리</p>
										<button>팔로우 취소</button>
									</li>
									<li>
										<div>
											<img src="${path}/images/menu/tipImg.jpg" alt="">
										</div>
										<p>치즈계랑마리</p>
										<button>팔로우 취소</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<script>
		$(function() {
			$("input:radio[name=menu]").click(
					function() {
						$("input:radio[name=menu]").parent().css('color',
								'dimgray');
						$("input:radio[name=menu]:checked").parent().css(
								'color', 'orangered');

						let checkValue = $("input:radio[name=menu]:checked")
								.val();
						$(".main").hide();
						$("#section" + checkValue).show();
						$("#writeDiv").hide();
						$("#postDetail").hide();
					});

			$("#writeBtn").click(function() {
				$("#section1").hide();
				$("#writeDiv").show();
			});

			$('#settingModal').click(function() {
				$('#settingContainer').css('display', 'block');
			});

			document.getElementById('menu1').click();
		});

		const settingModal = document.getElementById('settingModal');
		const settingBox = document.getElementById('settingContainer');
		const closeSetting = document.getElementById('closeSetting');

		const followerBox = document.getElementById('followerBox');
		const follower = document.querySelector('.follower');
		const closeFollower = document.getElementById('closeFollower');

		const followBox = document.getElementById('followBox');
		const follow = document.querySelector('.follow');
		const closeFollow = document.getElementById('closeFollow');

		const profileCancelBtn = document.getElementById('profileCancelBtn');

		settingModal.addEventListener('click', function() {
			settingBox.style.display = 'block';
		});

		closeSetting.addEventListener('click', function() {
			settingBox.style.display = 'none';
		});

		profileCancelBtn.addEventListener('click', function() {
			settingBox.style.display = 'none';
		});

		followerBox.addEventListener('click', function() {
			follower.style.display = 'block';
		});

		closeFollower.addEventListener('click', function() {
			follower.style.display = 'none';
		});

		followBox.addEventListener('click', function() {
			follow.style.display = 'block';
		});

		closeFollow.addEventListener('click', function() {
			follow.style.display = 'none';
		});

		window.addEventListener('click', function(e) {
			if (e.target == settingBox) {
				settingBox.style.display = 'none';
			}

			if (e.target == follower) {
				follower.style.display = 'none';
			}

			if (e.target == follow) {
				follow.style.display = 'none';
			}
		});
	</script>
</body>
</html>