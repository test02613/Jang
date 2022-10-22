<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>

<link rel="stylesheet" href="/resources/css/join.css">

</head>

<body>
   <!-- wrapper : 화면 전체랩 -->
   <div class="wrap">

      <!-- form -->
      <form id="join_form" method="post">

         <!-- 페이지 타이틀 -->
         <div class="subjecet">회원가입</div>

         <!-- 아이디 -->
         <div>
            <div class="sub_title">아이디</div>
            <input class="input_box_l id_input" name="id" placeholder="아이디"> 
            <span class="id_input_re_1">사용 가능한 아이디입니다.</span> 
            <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
         </div>

         <!-- 비밀번호 -->
         <div>   
            <div class="sub_title">비밀번호</div>
            <input class="pw_input" type="password" id="pw" name="pw" placeholder="비밀번호" />
            <input class="pwck_input" type="password" id="pwcheck" placeholder="비밀번호 확인" />
            <div>
               <!-- 비밀번호 일치여부 확인 -->
               <font id="chkNotice" size="3"></font>
            </div>
         </div>

         <!-- 이름 -->
         <div>
            <div class="sub_title">이름</div>
            <input class="user_input" name="name" placeholder="이름">
         </div>

         <!-- 전화번호 -->
         <div>
            <div class="sub_title">전화번호</div>
            <input class="mobile_input" name="mobile" placeholder="전화번호">
         </div>

         <!-- 이메일 전체영역 -->
         <div>
            <div class="sub_title">이메일</div>

            <div class="mail_input_box">
               <input class="mail_input" name="email" placeholder="이메일">
            </div>

            <div class="mail_check_input_box" id="mail_check_input_box_false">
               <input class="mail_check_input" disabled="disabled" placeholder="이메일 인증번호">
            </div>
            <div class="mail_check_button">인증번호 전송</div>
            <div class="clearfix"></div>
            <span id="mail_check_input_box_warn"></span>
         </div>

         <!-- 주소 전체영역 -->
         <div>   
            <div class="sub_title">주소</div>
            <div class="address_input_1_box">
               <input class="address_input_1" name="postcode" readonly="readonly" placeholder="우편번호">
            </div>
            <div class="address_button" onclick="execution_daum_address()">주소 찾기</div>
            <div class="clearfix"></div>
            <input class="address_input_2" name="address" readonly="readonly" placeholder="주소">
            <input class="address_input_3" name="addressDetail" readonly="readonly" placeholder="상세주소">
         </div>

         <!-- 가입하기 버튼 -->
         <input type="button" class="join_button" value="가입하기">

      </form> <!-- form 끝 -->
   </div> <!-- 화면 전체랩 끝 -->

<!-- ////////////////////////////////////////////////////////////////////////////// -->

   <script>
      $(document).ready(function() {
         // 회원가입 버튼
         $(".join_button").click(function() {
            $("#join_form").attr("action", "/joinAction");
            $("#join_form").submit();
         })
      })

      // id 중복검사
      $('.id_input').on(
            "propertychange change keyup paste input",
            function() {

               var id = $('.id_input').val();
               var data = {
                  id : id
               }

               $.ajax({
                  type : "post",
                  url : "/memberIdChk",
                  data : data,
                  success : function(result) {
                     //console.log("확인 : " + result);

                     if (result != 'fail') {
                        $('.id_input_re_1').css("display",
                              "inline-block");
                        $('.id_input_re_2').css("display", "none");
                     } else {
                        $('.id_input_re_2').css("display",
                              "inline-block");
                        $('.id_input_re_1').css("display", "none");
                     }
                  }
               }); // ajax 끝
            })

      var code = ""; // 이메일 전송 인증번호 저장 코드

      /* 인증번호 이메일 전송 */
      $(".mail_check_button").click(function() {

         var email = $(".mail_input").val(); // 입력한 이메일
         var cehckBox = $(".mail_check_input"); // 인증번호 입력란
         var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
         var warnMsg = $(".mail_input_box_warn"); // 이메일 입력 경고글 이건 어디에 있는거지?

         /* 이메일 형식 유효성 검사 */

         $.ajax({

            type : "GET",
            url : "mailCheck?email=" + email,
            success : function(data) {

               //console.log("data : " + data);
               cehckBox.attr("disabled", false);
               boxWrap.attr("id", ""); //굳이 css넣을 필요 없어서 #mail_check_input_box_true 삭제함
               code = data;

            }

         });

      });
      /* 인증번호 비교 */
      $(".mail_check_input").blur(function() {
         var inputCode = $(".mail_check_input").val(); // 입력코드   
         var checkResult = $("#mail_check_input_box_warn"); // 비교 결과    

         if (inputCode == code) { // 일치할 경우
            checkResult.html("인증번호가 일치합니다");
            checkResult.attr("class", "correct");
            //mailnumCheck = true;
         } else { // 일치하지 않을 경우
            checkResult.html("인증번호를 다시 확인해주세요");
            checkResult.attr("class", "incorrect");
            //mailnumCheck = false;
         }
      });

      // 다음 주소 연동
      function execution_daum_address() {
         new daum.Postcode({
            oncomplete : function(data) {
               // 팝업에서 검색결과 항목을 클릭했을 때 실행되는 코드

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if (data.userSelectedType === 'R') {
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== ''
                        && /[동|로|가]$/g.test(data.bname)) {
                     extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== ''
                        && data.apartment === 'Y') {
                     extraAddr += (extraAddr !== '' ? ', '
                           + data.buildingName
                           : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraAddr !== '') {
                     extraAddr = ' (' + extraAddr + ')';
                  }
                  // 주소변수 문자열과 참고항목 문자열 합치기
                  addr += extraAddr;

               } else {
                  addr += ' ';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               $(".address_input_1").val(data.zonecode);
               $(".address_input_2").val(addr);
               // 커서를 상세주소 필드로 이동한다.
               $(".address_input_3").attr("readonly", false);
               $(".address_input_3").focus();
            }
         }).open();
      }

      /* 비밀번호 일치 여부 */
      $(function() {
         $('#pw').keyup(function() {
            $('#chkNotice').html('');
         });

         $('#pwcheck').keyup(function() {

            if ($('#pw').val() != $('#pwcheck').val()) {
               $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
               $('#chkNotice').attr('color', 'red');
            } else {
               $('#chkNotice').html('비밀번호 일치함<br><br>');
               $('#chkNotice').attr('color', 'green');
            }

         });
      });
   </script>

   <!-- 주소찾기 -->
   <script
      src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>