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
.correct {
	color: green;
}

.incorrect {
	color: red;
}
</style>
</head>
<body>
	<form id="myUpdate_form" method="POST">
		<table class="table table-striped">
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<td>이름</td>
					<td style="text-align: left"><input type="text" name="name"
						id="MY_NAME" value="${member.name}" style="width: 100px;">
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td style="text-align: left"><input type="text" name="id"
						id="MY_ID" value="${member.id}" style="width: 100px;"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="pw" name="pw"
						placeholder="비밀번호" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="pwcheck" placeholder="비밀번호 확인" />
						<font id="chkNotice" size="2"></font></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td style="text-align: left"><input type="text" name="email"
						id="MY_EMAIL" value="${member.email}" style="width: 100px;"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td style="text-align: left"><input type="text" name="mobile"
						id="MY_PHONE" value="${member.mobile}" style="width: 120px;">
					</td>
				</tr>
				<tr>
					<td rowspan="3">주소</td>
					<td style="text-align: left"><input type="text"
						name="postcode" id="MY_ZIPCODE" value="${member.postcode}"
						style="width: 80px;">
						<button type="button" id="findAddrBtn" onclick="findAddr()">우편번호
							찾기</button></td>
				</tr>
				<tr>
					<td style="text-align: left"><input type="text" name="address"
						id="MY_ADDR1" value="${member.address}" style="width: 400px;"></td>
				</tr>
				<tr>
					<td style="text-align: left"><input type="text"
						name="addressDetail" id="MY_ADDR2" value="${member.addressDetail}"
						style="width: 400px;"></td>
				</tr>
			</tbody>
		</table>
		<input type="button" class="myUpdate_button" value="수정하기">
	</form>
		<button type="button" onclick="removeMember();"> 탈퇴하기 </button>
	<script>
		//회원정보 수정 버튼
		$(document).ready(function() {
			$(".myUpdate_button").click(function() {
				$("#myUpdate_form").attr("action", "/myUpdateAction");
				$("#myUpdate_form").submit();

			})
		})

		//주문자정보와 동일
		function fn_chkinfo() {
			var chk = document.getElementById("chkinfo").checked;
			if (chk == true) {
				document.getElementById("MY_NAME").value = "${map.MEMBER_NAME}";
				document.getElementById("MY_ID").value = "${map.MEMBER_ID}";
				document.getElementById("MY_EMAIL").value = "${map.MEMBER_EMAIL}";
				document.getElementById("MY_PHONE").value = "${map.MEMBER_PHONE}";
				document.getElementById("MY_ZIPCODE").value = "${map.MEMBER_ZIPCODE}";
				document.getElementById("MY_ADDR1").value = "${map.MEMBER_ADDR1}";
				document.getElementById("MY_ADDR2").value = "${map.MEMBER_ADDR2}";

			} else if (chk == false) {
				document.getElementById("MY_NAME").value = "";
				document.getElementById("MY_ID").value = "";
				document.getElementById("MY_EMAIL").value = "";
				document.getElementById("MY_PHONE").value = "";
				document.getElementById("MY_ZIPCODE").value = "";
				document.getElementById("MY_ADDR1").value = "";
				document.getElementById("MY_ADDR2").value = "";

			}
		}

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
			if(window.confirm("탈퇴하시겠습니까?")){
			location.href="/memberLeave";
			}
			
		}
	</script>
</body>
</html>