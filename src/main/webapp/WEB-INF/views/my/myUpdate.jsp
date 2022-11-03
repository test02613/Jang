<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<!-- 주소검색 API(카카오) -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/common.js" charset="utf-8"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 전체 wrap */
#wrap {
	width: 500px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
	margin-bottom: 100px
}
/* 페이지 상단 타이틀 : "회원정보수정" */
.subjecet {
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	margin-top: 20px;
	height: 100px;
}
/* 영역별 타이틀 중복코드 sub_title 로  통일 */
.sub_title {
	font-size: 20px;
	text-align: center;
	margin-top: 5px;
	margin-bottom: 5px;
}
/* 우편번호 입력란 */
#address_input_1_box {
	height: 50px;
	width: 65%;
	margin-bottom: 10px;
	float: left;
}
/* 주소찾기 버튼 */
.address_button {
	width: 30%;
	height: 50px;
	background-color: #24292F;
	font-size: 18px;
	color: white;
	line-height: 50px;
	text-align: center;
	border: none;
	border-radius: 10px;
	margin-bottom: 10px;
	float: right;
	cursor: pointer;
}
/* input 영역 */
.input {
	width: 100%;
	height: 50px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* 수정 불가 영역 */
.no-input{
     background-color:lightgray;
	width: 100%;
	height: 50px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* 수정,탈퇴 버튼 */
#btt {
	width: 100%;
	height: 50px;
	background-color: #24292F;
	font-size: 20px;
	font-weight: 900;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="subjecet">회원 정보수정</div>
		<hr>
		<br><br>
		<form id="myUpdate_form" method="POST">
			<div class="sub_title">이름</div>
			<div>
				<input class="input" type="text" name="name" id="MY_NAME"
					value="${member.name}">
			</div>
			<div class="sub_title">아이디</div>
			<div>
				<input class="no-input" type="text" name="id" id="MY_ID"
					value="${member.id}" readonly="readonly">
			</div>
			<div class="sub_title">비밀번호</div>
			<div>
				<input class="input" type="password" id="pw" name="pw"
					placeholder="비밀번호" />
			</div>
			<div>
				<input class="input" type="password" id="pwcheck"
					placeholder="비밀번호 확인" /> <font id="chkNotice" size="5"></font>
			</div>
			<div class="sub_title">이메일</div>
			<div>
				<input class="no-input" type="text" name="email" id="MY_EMAIL"
					value="${member.email}" readonly="readonly">
			</div>
			<div class="sub_title">휴대폰번호</div>
			<div>
				<input class="input" type="text" name="mobile" id="MY_PHONE"
					value="${member.mobile}">
			</div>
			<div class="sub_title">주소</div>
			<div>
				<input class="input" type="text" name="postcode"
					id="MY_ZIPCODE" value="${member.postcode}">
				<button type="button" class="address_button" id="findAddrBtn"
					onclick="findAddr()">우편번호 찾기</button>
			</div>
			<div>
				<input class="input" type="text" name="address" id="MY_ADDR1"
					value="${member.address}">
			</div>
			<div>
				<input class="input" type="text" name="addressDetail" id="MY_ADDR2"
					value="${member.addressDetail}">
			</div>	
			<br>	
			<hr><br>
			<br> <input type="button" id="btt" class="myUpdate_button"
				value="수정하기"><br>
			<button type="button" id="btt" onclick="removeMember();">탈퇴하기</button>
		</form>
	</div>
	<script>
		//회원정보 수정 버튼
		$(document).ready(function() {
			$(".myUpdate_button").click(function() {
				alert("회원정보를 수정하시겠습니까?")
				$("#myUpdate_form").attr("action", "/myUpdateAction");
				$("#myUpdate_form").submit();

			})
		})

		// 기존 비밀번호 일치 여부 
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

		//주소 찾기
		function findAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('MY_ZIPCODE').value = data.zonecode;
							document.getElementById("MY_ADDR1").value = roadAddr
									+ data.jibunAddress;
							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("MY_ADDR2").value = extraRoadAddr;
							} else {
								document.getElementById("MY_ADDR2").value = '';
							}
						}
					}).open();
		}

		//탈퇴버튼 누르면 경고창 띄우기
		function removeMember() {
			if (window.confirm("탈퇴하시겠습니까?")) {
				location.href = "/memberLeave";
			}

		}
	</script>

</body>
</html>