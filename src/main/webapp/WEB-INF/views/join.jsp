<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/join.css">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>

/* 중복아이디 존재하지 않는경우 */
.id_input_re_1 {
	color: green;
	display: none;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2 {
	color: red;
	display: none;
}
</style>
</head>
<body>

	<div class="wrapper">
		<form id="join_form" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="memberId">
					</div>
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
						class="id_input_re_2">아이디가 이미 존재합니다.</span> 
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" name="memberPw">
					</div>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input">
					</div>
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="memberName">
					</div>
				</div>
				<div class="mail_check_wrap">
					<div class="mail_name">이메일</div>
					<div class="mail_input_box">
						<input class="mail_input" name="memberMail">
					</div>
					<div class="mail_check_wrap">
						<!-- 입력란 색상 변경 : 기존 코드  -->
						<!-- <div class="mail_check_input_box"> -->

						<!-- 입력란 색상 변경 : 변경된 코드  -->
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled">
						</div>
						<div class="mail_check_button">
							<span>인증번호 전송</span>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="address_wrap">
					<div class="address_name">주소</div>
					<div class="address_input_1_wrap">
						<div class="address_input_1_box">
							<input class="address_input_1" name="memberAddr1"
								readonly="readonly">
						</div>
						<div class="address_button" onclick="execution_daum_address()">
							<span>주소 찾기</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="address_input_2_wrap">
						<div class="address_input_2_box">
							<input class="address_input_2" name="memberAddr2"
								readonly="readonly">
						</div>
					</div>
					<div class="address_input_3_wrap">
						<div class="address_input_3_box">
							<input class="address_input_3" name="memberAddr3"
								readonly="readonly">

						</div>
					</div>
				</div>
				<div class="join_button_wrap">
					<input type="submit" class="join_button" value="가입하기">
				</div>
			</div>
		</form>
	</div>

	<script>
		/* $(document).ready(function() {
			// 회원가입 버튼
			$(".join_button").click(function() {
				$("#join_form").attr("action", "/member/join");
				$("#join_form").submit();
				
			})
		})  */
		// id 중복검사
		$('.id_input').on(
				"propertychange change keyup paste input",
				function() {

					//console.log('keyup test')

					var memberId = $('.id_input').val();
					var data = {
						memberId : memberId
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
		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function() {

			var email = $(".mail_input").val(); // 입력한 이메일

			$.ajax({

				type : "GET",
				url : "mailCheck?email=" + email
				
				

			});

		});
		// 다음 주소 연동
		function execution_daum_address() {

			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을 때 실행되는 코드
				}
			}).open();
		}

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
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
						: data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraAddr !== '') {
				extraAddr = ' (' + extraAddr + ')';
			}
			// 조합된 참고항목을 해당 필드에 넣는다.
			document.getElementById("sample6_extraAddress").value = extraAddr;

		} else {
			document.getElementById("sample6_extraAddress").value = '';
		}

		// 우편번호와 주소 정보를 해당 필드에 넣는다.
		document.getElementById('sample6_postcode').value = data.zonecode;
		document.getElementById("sample6_address").value = addr;
		// 커서를 상세주소 필드로 이동한다.
		document.getElementById("sample6_detailAddress").focus();
		// 다음 주소 연동
		function execution_daum_address() {

			new daum.Postcode(
					{
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
								// 제거해야할 코드
								// 조합된 참고항목을 해당 필드에 넣는다.
								//document.getElementById("sample6_extraAddress").value = extraAddr;

								// 추가해야할 코드
								// 주소변수 문자열과 참고항목 문자열 합치기
								addr += extraAddr;

							} else {
								// 제거해야할 코드
								// document.getElementById("sample6_extraAddress").value = '';

								// 추가해야할 코드
								addr += ' ';
							}

							// 제거해야할 코드
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							//document.getElementById('sample6_postcode').value = data.zonecode;
							//document.getElementById("sample6_address").value = addr;
							// 추가해야할 코드
							$(".address_input_1").val(data.zonecode);
							$(".address_input_2").val(addr);
							// 커서를 상세주소 필드로 이동한다.
							// 제거해야할 코드
							// 커서를 상세주소 필드로 이동한다.
							//document.getElementById("sample6_detailAddress").focus();

							// 추가해야할 코드
							// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
							$(".address_input_3").attr("readonly", false);
							$(".address_input_3").focus();
						}
					}).open();
		}
	</script>

</body>
</html>