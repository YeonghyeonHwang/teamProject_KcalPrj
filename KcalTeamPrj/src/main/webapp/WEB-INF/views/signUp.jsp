<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="${path}/css/signUp.css"/>
   <script type="text/javascript" src="${path}/js/jquery-3.6.0.min.js"></script>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
   <div class="container">
      <jsp:include page="main_menu_bar.jsp"></jsp:include>

      <div class="signUp">
        <div class="signUpBox">
          <div class="signUpTitle">
            <p class="signUpMent1">
              구조대가 필요한 '<span>확</span>'찐자들을 위한 곳
            </p>
            <p class="signUpMent2">
              나의 건강이 만들어지는 공간 지금 당장 계획해봐요 !
            </p>
          </div>
          <div class="signUpContent">
            <div class="signUpContentTitle">
              <p>회원가입</p>
            </div>

            <div class="signUpInfo">
              <form
                action="${path}/member/signUp"
                method="post"
                id="signupForm"
              >
                <div class="signUpInfoBox">
                  <ul>
                    <li>
                      <label class="idLabel"><span>* </span>ID</label>
                      <input type="text" id="id" name="id" /><br />
                      <span class="idCheckResult"></span>
                      <input type="hidden" id="idCheck" value="impossible" />
                    </li>
                    <li>
                      <label class="pwLabel1"><span>* </span>비밀번호</label>
                      <input type="password" id="password1" name="password" />
                    </li>
                    <li>
                      <label class="pwLabel2"
                        ><span>* </span>비밀번호 확인</label
                      >
                      <input type="password" id="password2" />
                      <font id="chkNotice" size="3"></font>
                    </li>
                    <li>
                      <label class="nickLabel"><span>* </span>닉네임</label>
                      <input type="text" id="nickname" name="nickname" />
                      <span class="nicknameCheckResult"></span>
                      <input
                        type="hidden"
                        id="nicknameCheck"
                        value="impossible"
                      />
                    </li>

                    <li>
                      <label class="emailLabel"><span>* </span>이메일</label>
                      <input
                        type="email"
                        id="email"
                        name="email"
                        title="이메일 주소를 입력해주세요."
                        required
                      />
                      <span class="emailCheckResult"></span>
                      <input type="hidden" id="emailCheckStatus" value="impossible" />
                      <span id="emailChk" class="doubleChk Btn">인증번호 보내기</span>
                    </li>
                    <li>
                      <label class="emailKeyLabel"
                        ><span>* </span>인증번호</label
                      >
                      <input
                        type="email"
                        id="email2"
                        name="email2"
                        title="인증번호 입력"
                        disabled
                        required
                      />
                      <span
                        id="emailChk2"
                        style="display: none"
                        class="Btn doubleChk"
                        >이메일인증</span
                      >
                      <span class="point successEmailChk"
                        >이메일 입력후 인증번호 보내기를 해주십시오.</span
                      >
                      <input type="hidden" id="emailDoubleChk" value="false"/>
                    </li>
                    <li>
                      <label class="addr1Label"><span>* </span>주소</label>

                      <input type="text" id="addr1" name="addr1" readonly/>
                      <input type="text" id="addr2" name="addr2" readonly/>
                      <button type="button" id="findAddr" class="Btn">
                        주소찾기
                      </button>
                    </li>
                    <li>
                      <label class="addr3Label"><span>* </span>상세주소</label>
                      <input type="text" id="addr3" name="addr3" />
                    </li>
                  </ul>
                  <div class="signUpBtnBox">
                    <button id="signUpBtn" type="button">회원가입</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
      $(function () {
        // 아이디 중복 실시간 확인
        $("#id").on("keyup", function () {
          let id = $("#id").val();

          if (id == "") {
            $(".idCheckResult").text("ID를 입력해주세요.");
            $(".idCheckResult").css("color", "red");
            $("#idCheck").val("impossible");
          } else {
            $.ajax({
              url: "${path}/member/checkId",
              type: "POST",
              data: {
                id: id,
              },
              success: function (data) {
                if (data == "possible") {
                  $(".idCheckResult").text("사용가능한 ID입니다.");
                  $(".idCheckResult").css("color", "royalblue");
                  $("#idCheck").val(data);
                } else {
                  $(".idCheckResult").text("이미 사용중인 아이디입니다.");
                  $(".idCheckResult").css("color", "red");
                  $("#idCheck").val(data);
                }
              },
            });
          }
        });
      });

      $(function () {
        // 닉네임 중복 실시간 확인
        $("#nickname").on("keyup", function () {
          let nickname = $("#nickname").val();

          if (nickname == "") {
            $(".nicknameCheckResult").text("닉네임을 입력해주세요.");
            $(".nicknameCheckResult").css("color", "red");
            $("#nicknameCheck").val("impossible");
          } else {
            $.ajax({
              url: "${path}/member/checkNickname",
              type: "POST",
              data: {
                nickname: nickname,
              },
              success: function (data) {
                if (data == "possible") {
                  $(".nicknameCheckResult").text("사용가능한 닉네임입니다.");
                  $(".nicknameCheckResult").css("color", "royalblue");
                  $("#nicknameCheck").val(data);
                } else {
                  $(".nicknameCheckResult").text("이미 사용중인 닉네임입니다.");
                  $(".nicknameCheckResult").css("color", "red");
                  $("#nicknameCheck").val(data);
                }
              },
            });
          }
        });
      });
      
      // 이메일 중복 실시간 확인
      $("#emailChk").hide();
      
	  $("#email").on("keyup", function () {
		  let email = $("#email").val();

          if (email == "") {
            $(".emailCheckResult").text("이메일을 입력해주세요.");
            $(".emailCheckResult").css("color", "red");
            $(".emailCheck").val("impossible");
            $("#emailChk").hide();
          } else {
            $.ajax({
              url: "${path}/member/checkEmail",
              type: "POST",
              data: {
                email : email,
              },
              success: function (data) {
                if (data == "possible") {
                  $(".emailCheckResult").text("사용가능한 이메일입니다.");
                  $(".emailCheckResult").css("color", "royalblue");
                  $("#emailCheckStatus").val(data);
                  $("#emailChk").show();
                } else {
                  $(".emailCheckResult").text("이미 사용중인 이메일입니다.");
                  $(".emailCheckResult").css("color", "red");
                  $("#emailCheckStatus").val(data);
                  $("#emailChk").hide();
                }
              },
            });
          }
	  })
      
      
      //이메일 인증
      var code = "";
      $("#emailChk").click(function () {
        var email = $("#email").val();
        $.ajax({
          type: "GET",
          url: "signUp?email=" + email,
          cache: false,
          success: function (data) {
            if (data == "error") {
              alert(
                "이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요."
              );
              $("#email").attr("autofocus", true);
              $(".successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
              $(".successEmailChk").css("color", "red");
            } else {
              alert(
                "인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오."
              );
              $("#email2").attr("disabled", false);
              $("#emailChk2").css("display", "inline-block");
              $(".successEmailChk").text(
                "인증번호를 입력한 뒤 이메일 인증을 눌러주십시오."
              );
              $(".successEmailChk").css("color", "green");
              code = data;
            }
          },
        });
      });

      //인증번호 보내기 클릭 이벤트
      $(function () {
        $("#emailChk").click(function () {
          if ($("#emailChk2").css("display") == "none") {
            $("#emailChk2").show();
          }
        });
      });

      //이메일 인증번호 대조
      $("#emailChk2").click(function () {
        if ($("#email2").val() == code) {
          $(".successEmailChk").text("인증번호가 일치합니다.");
          $(".successEmailChk").css("color", "green");
          $("#emailDoubleChk").val("true");
          $("#email2").attr("disabled", true);
          //$("#sm_email").attr("disabled",true);
        } else {
          $(".successEmailChk").text(
            "인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."
          );
          $(".successEmailChk").css("color", "red");
          $("#emailDoubleChk").val("false");
          $("#email2").attr("autofocus", true);
        }
      });

      // 주소검색 클릭시 주소찾기 팝업
      $("#findAddr").click(function () {
        new daum.Postcode({
          oncomplete: function (data) {
            $("#addr1").val(data.zonecode);
            $("#addr2").val(data.roadAddress);
          },
        }).open();
      });

      // 비밀번호 확인
      $(function () {
        $("#password1").keyup(function () {
          $("#chkNotice").html("");
        });

        $("#password2").keyup(function () {
          if ($("#password1").val() != $("#password2").val()) {
            $("#chkNotice").html("비밀번호 일치하지 않음<br><br>");
            $("#chkNotice").attr("color", "red");
          } else {
            $("#chkNotice").html("비밀번호 일치함<br><br>");
            $("#chkNotice").attr("color", "royalblue");
          }
        });
      });
      document
        .getElementById("signUpBtn")
        .addEventListener("click", function () {
          var pw = document.getElementById("password1").value; // 비밀번호
          var pw2 = document.getElementById("password2").value; // 확인 비밀번호
          var idCheck = document.getElementById("idCheck").value; // 아이디
          var nicknameCheck = document.getElementById("nicknameCheck").value;
          

          if (idCheck != "possible") {
            alert("아이디를 확인해주세요.");
          } else if (pw != pw2) {
            alert("비밀번호가 일치하지 않습니다");
          } else if (nicknameCheck != "possible") {
            alert("닉네임을 확인해주세요.");
          } else if (($("#emailCheckStatus").val() == "impossible") || ($("#emailDoubleChk").val() == "false")) {
            alert("이메일을 확인해주세요.");        	  
          } else{
            document.getElementById("signupForm").submit();
          }
        });
    </script>
</body>
</html>