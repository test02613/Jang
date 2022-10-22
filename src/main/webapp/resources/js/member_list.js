/**
 * 전체 회원 조회 javascript
 */

///////////////////////////////////////////////////////////////////////////////////

// jquery

$(function() {
	
	console.log("jquery member_list");
	
	// 연락처 변경 (버튼 이벤트 핸들러)
	$("[id^='mobile_update_btn_']").click(function(e) {
		
		console.log("연락처 편집");
		
		var target_id = e.currentTarget.id;
		var member_id = target_id.substring("mobile_update_btn_".length);
		var mobile_id = "mobile_" + member_id;
		
		console.log("member_id : " + member_id);
		console.log("mobile : " + $("#"+mobile_id).text().trim());
		
		// 연락처 유효성 점검
		var mobile_regex = /010-\d{4}-\d{4}/;
		
		if (mobile_regex.test($("#"+mobile_id).text().trim())) {
			
			console.log("유효성 점검 통과");
			
			// ajax
			// https://api.jquery.com/jQuery.Ajax/
			// https://cafe.naver.com/djjava24/609
			$.ajax({
				 url : '/memberProject/admin/memberMobileCheck.do',
				 type : 'get',
				 dataType:'text',
				 data : {
					 id : member_id,
					 mobile : $("#"+mobile_id).text().trim()
				 }, // data 
				 success : function(msg) { // 200 (HTTP status code)
					 //
					 alert(msg);
					 
					 if (msg.trim() == '다른 회원과 중복되어 사용할 수 없는 연락처입니다.') {
						 
						// 원래 데이터 복구
						$("#"+mobile_id).text($("#"+mobile_id).attr('title'));
						$("#"+mobile_id).focus(); // 입력 대기
						 
					 } // if
					 
					 // 저장 성공의 경우 기존값(title 속성) 갱신
					 if (msg.trim() == '회원 개별 정보(연락처) 수정에 성공하였습니다.') {
						 $("#"+mobile_id).attr("title", $("#"+mobile_id).text());
					 } //
					 
			 	} // success
				 
			 }); // ajax
			
			
		} else { // 
			
			alert("회원 연락처 정확한 전화번호 형식(010-1234-5678)으로 입력하십시오.");
			
			// 원래 데이터 복구
			$("#"+mobile_id).text($("#"+mobile_id).attr('title'));
			$("#"+mobile_id).focus(); // 입력 대기
		} // 유효성 점검
		
	}); // mobile
	
	// 주소 검색
	// 연락처 변경 (버튼 이벤트 핸들러)
	$("[id^='address_search_btn_']").click(function(e) {
		
		console.log("주소 검색 이벤트 핸들러");
		
		var member_id = e.currentTarget.id.substring('address_search_btn_'.length);
		var zip = "zip_" + member_id;
		var address1 = 'address1_' + member_id;
		var address2 = 'address2_' + member_id;
		
		getPostcodeAddress(zip, address1, address2);
		
	});
	
	// 주소 복원
	$("[id^='address_restore_btn_']").click(function(e) {
		
		console.log("주소 복원 핸들러");
		
		var id = e.currentTarget.id;
		var member_id = id.substring('address_restore_btn_'.length);
		
		console.log("member_id : " + member_id);
		
		$("#zip_"+member_id).text($("#zip_"+member_id).attr('title'));
		$("#address1_"+member_id).text($("#address1_"+member_id).attr('title'));
		$("#address2_"+member_id).text($("#address2_"+member_id).attr('title'));
		
	}); //
	
	// 주소 초기화(삭제)
	$("[id^='address_delete_btn_']").click(function(e) {
		
		console.log("주소 초기화(삭제) 핸들러");
		
		var id = e.currentTarget.id;
		var member_id = id.substring('address_delete_btn_'.length);
		
		console.log("member_id : " + member_id);
		
		// 주소 초기화(삭제)
		$("#zip_"+member_id).text("");
		$("#address1_"+member_id).text("");
		$("#address2_"+member_id).text("");
		
	}); //
	
	// 주소 수정(전송)
	$("[id^='address_update_btn_']").click(function(e) {
		
		console.log("주소 수정(전송) 핸들러");
		
		var id = e.currentTarget.id;
		var member_id = id.substring('address_update_btn_'.length);
		
		console.log("member_id : " + member_id);
		
		var zip = $("#zip_"+member_id).text();
		var address1 = $("#address1_"+member_id).text();
		var address2 = $("#address2_"+member_id).text().trim();
		
		// 폼 점검
		// 주의) 주소가 필수 사항이 아니라면 "빈"주소가 수정으로 넘어갈 수도 있음 !
		// 1) 우편번호 /기본주소 있는데 상세주소가 없는 경우
		// 2) 우편번호 /기본주소가 없는데 상세주소만 있는 경우
		
		if (zip != '' && address1 != '' && address2 == '') { // 1)
			
			alert("상세 주소를 입력하십시오.");
			$("#address2_"+member_id).focus();
			
		} else if (zip == '' && address1 == '' && address2 != '') { // 2)	
			
			alert('주소 검색 버튼을 눌러서 우편번호/기본 주소를 입력하십시오');
			$("#address_search_btn_"+member_id).focus();
			
		} else { // 정상적인 주소의 경우
			
			console.log("폼점검 통과");
			
			// ajax
			$.ajax({
				 url : '/memberProject/admin/memberAddressCheck.do',
				 type : 'post',
				 dataType:'text',
				 data : {
					 id : member_id,
					 zip : zip,
					 address1 : address1,
					 address2 : address2
				 }, // data 
				 success : function(msg) { // 200 (HTTP status code)
					 //
					 alert(msg);
					 
					 if (msg.trim() == '회원 개별 정보(연락처) 수정에 성공하였습니다.') {
						 
						 // 기존값(title 속성) 갱신
						 $("#zip_"+member_id).attr("title", $("#zip_"+member_id).text());
						 $("#address1_"+member_id).attr("title", $("#address1_"+member_id).text());
						 $("#address2_"+member_id).attr("title", $("#address2_"+member_id).text());
					 }
					 
			 	} // success
				 
			 }); // ajax
		} //
		
	}); //
	
	
	// bootstrap datepicker
    // 한글화 컴포넌트 적용
    // locales usage : https://bootstrap-datepicker.readthedocs.io/en/latest/i18n.html#
	$('input[id^=birthday_]').datepicker({
		language : 'kr', // 한글 적용
	    format: "yyyy년 mm월 dd일"
		// format: "yyyy-mm-dd"
	});
	
	// 생일 수정 
	$("[id^=birthday_update_btn_]").click(function(e) {
		
		console.log("생일 수정 ");
		
		var id = e.currentTarget.id;
		var member_id = id.substring('birthday_update_btn_'.length);
		var birthday = $("#birthday_"+member_id).val();
		
		console.log("member_id : " + member_id);
		
		// ajax
		$.ajax({
			 url : '/memberProject/admin/memberBirthdayCheck.do',
			 type : 'post',
			 dataType:'text',
			 data : {
				 id : member_id,
				 birthday : birthday
			 }, // data 
			 success : function(msg) { // 200 (HTTP status code)
				 //
				 alert(msg);
				 
				 if (msg.trim() == '회원 개별 정보(생일) 수정에 성공하였습니다.') {
					 
					 // 기존값(title 속성) 갱신
					 $("#birthday_"+member_id).attr("title", $("#birthday_"+member_id).val());
				 }
				 
		 	} // success
			 
		 }); // ajax
		
		
	});
	
	// 생일 이전 데이터 복원 
	$("[id^=birthday_restore_btn_]").click(function(e) {
		
		console.log("생일 이전 데이터 복원 ");
		
		var id = e.currentTarget.id;
		var member_id = id.substring('birthday_restore_btn_'.length);
		
		console.log("member_id : " + member_id);
		console.log("이전 보관 생일 : " + $("#birthday_"+member_id).attr("title"));
		
		$("#birthday_"+member_id).val($("#birthday_"+member_id).attr("title"));
		
	});
	
	// 생일 데이터 삭제(초기화) : 필수 항목이 아닐 경우는 적용 가능 
	$("[id^=birthday_delete_btn_]").click(function(e) {
		
		console.log("생일 데이터 삭제 ");
		
		var id = e.currentTarget.id;
		var member_id = id.substring('birthday_delete_btn_'.length);
		
		console.log("member_id : " + member_id);
		console.log("이전 보관 생일 : " + $("#birthday_"+member_id).attr("title"));
		
		$("#birthday_"+member_id).val(""); // 삭제 초기화
		
	});
	
	// 회원 활동 여부 라벨 반영
	// 체크 박스 조정시 => "활동/잠금"으로 바로 라벨 변경
	$("[id^=enabled_]").change(function(e) {
		
		var id = e.currentTarget.id;
		var member_id = id.substring('enabled_'.length);
		
		console.log("활동 여부 라벨 변경 (상태) : " + $("#enabled_"+member_id).prop("checked"));
		
		// 라벨 상태 변경
		var checked_val = $("#enabled_"+member_id).prop("checked") == true ? "활동" : "잠금";
		$("#enabled_label_"+member_id).text(checked_val);
		
		var enabled = checked_val == "활동" ? 1 : 0;
		
		// ajax
		$.ajax({
			 url : '/memberProject/admin/memberEnabledCheck.do',
			 type : 'get',
			 dataType:'text',
			 data : {
				 id : member_id,
				 enabled : enabled
			 }, // data 
			 success : function(msg) { // 200 (HTTP status code)
				 //
				 alert(msg);
				 
				 if (msg.trim() == '회원 개별 정보(활동 여부) 수정에 성공하였습니다.') {
					 
					 // 기존값(title 속성) 갱신
					 $("#enabled_"+member_id).attr("title", $("#enabled_"+member_id).val());
				 }
				 
		 	} // success
			 
		 }); // ajax
		
	});
    	
	
}); // jquery

/////////////////////////////////////////////////////////////////////////////////////

// 주소 검색

// 도로명 주소 검색 : 인자 3개 추가
    function getPostcodeAddress(zip_fld, address1_fld, address2_fld) {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                
               // 주소 정보 전체 필드 및 내용 확인 : javateacher
               /*  var output = '';
                for (var key in data) {
                	output += key + ":" +  data[key]+"\n";
                }
                
                alert(output); */

                // 3단계 : 해당 필드들에 정보 입력
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                console.log("zip_fld : " + zip_fld);
                console.log("address1_fld : " + address1_fld);
                console.log("address2_fld : " + address2_fld);
                
                // value = > innerText 변경
                document.getElementById(zip_fld).innerText = data.zonecode; //5자리 새우편번호 사용
                document.getElementById(address1_fld).innerText = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById(address2_fld).focus();
            }
        }).open();
    }


////////////////////////////////////////////////////////////////////////////////////

window.onload = function() {
	
	// 이메일 개별 수정
	var emails = document.querySelectorAll("input[id^=email]");
	
	console.log("이메일 필드 수 : " + emails.length);
	
	for (var email of emails) {
	
		email.onclick = function(e) {
			
			console.log("이메일 편집 : " + e.currentTarget.id);
			
			// CSS 동적 변경
			var emailFld = document.getElementById(e.currentTarget.id); 
			emailFld.removeAttribute("readonly");
			emailFld.style.borderWeight = "1px";
			
		}
		
		email.onblur = function(e) {
		
			// CSS 원상 복귀
			var emailFld = document.getElementById(e.currentTarget.id);
			emailFld.setAttribute("readonly", "readonly");
			emailFld.style.borderWeight = "0";
		}
		
	} // for
	
	var email_update_btns = document.querySelectorAll("[id^=email_update_btn_]");
	
	for (var email_update_btn of email_update_btns) {
		
		email_update_btn.onclick = function(e) {
			
			console.log("이메일 수정 클릭 : " + e.currentTarget.id);
			
			var btn_id = e.currentTarget.id;
			var email_id = btn_id.substring("email_update_btn_".length);
			var email_val = document.getElementById("email_"+email_id).value.trim();
			
			console.log("아이디 : " + email_id);
			console.log("변경 이메일 : " + email_val);
			
			// 이메일 폼점검
			var email_regex = /[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}/;
			
			if (email_regex.test(email_val)) {
				
				console.log("이메일 폼점검 통과");
							
				// AJAX
				// https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
				const xhr = new XMLHttpRequest();
				
				xhr.onreadystatechange = () => {
				    
					/* 
					   - readyState 상태 값 
					   : https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/readyState
					   
					   0 : uninitialized - 아직 loading이 시작되지 않았다. 객체가 생성되었지만, 초기화가 되지 않은 상태.
						   open() 메소드가 호출되지 않음.
						
				   	   1: loading - loading 중이며, 객체는 생성되었지만, send() 메소드가 호출되지 않은 상태.
						
					   2 : loaded - send() 메소드는 호출되었지만, 상태와 헤더는 아직 사용할 수 없는 상태.
						
					   3 : interactive - 충분히 load되었고 사용자가 그것과 상호작용할 수 있다. 
						      일부 결과값을 구하고자 이 상태에서 responseBody와 responseText 속성을 이용하면 에러가 발생한다.
						
					   4 : complete - 완전히 load되었다. responseBody와 responseText 속성을 이용하여 완전한 데이터를 획득할 수 있다.
					 */
					// if (xhr.readyState === 4 && xhr.status === 200) {
					if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
						
						console.log("응답 : " + xhr.responseText);

						// 추가 : 저장 성공/실패의 경우 기존값 갱신
						if (xhr.responseText.trim() == '다른 회원과 중복되어 사용할 수 없는 메일입니다.' || 
							xhr.responseText.trim() == '회원 개별 정보(이메일) 수정에 성공하였습니다.'	) {
							
							// 이전 메일값을 불러와서 복원 : 임시 hidden 필드에 보관됨
							document.getElementById("email_"+email_id).value 
								= document.getElementById("old_email_"+email_id).value; 
							
						} 

						alert(xhr.responseText); // 메시징
						
				    } // 200
				    
				} //
				
				xhr.open("GET", "/memberProject/admin/memberEmailCheck.do?id="+email_id+"&email="+email_val, true);
				xhr.send();
				
			} else {

				console.log("폼점검 부적합");
				alert("회원 이메일을 정확한 이메일 형식(abcd@abcd.com)으로 입력하십시오.");
				
				// 원래 데이터 복원
				// 이전 메일값을 불러와서 복원 : 임시 hidden 필드에 보관됨
				document.getElementById("email_"+email_id).value 
					= document.getElementById("old_email_"+email_id).value; 
			}
		
		} // email_update_btn.onclick
		
	} // for	
	
	/////////////////////////////////////////////////////////////////////////////////////////
	
	// role(롤) 개별 수정
	var role_update_btns = document.querySelectorAll("[id^=role_update_btn_]");
	
	for (var role_update_btn of role_update_btns) {
		
		role_update_btn.onclick = function(e) {
			
			console.log("role(롤) 수정 클릭 : " + e.currentTarget.id);
			
			var btn_id = e.currentTarget.id;
			var member_id = btn_id.substring("role_update_btn_".length);
			
			var role_val1_checked = document.getElementById("role1_"+member_id).checked;
			var role_val2_checked = document.getElementById("role2_"+member_id).checked;
			var role_val1 = document.getElementById("role1_"+member_id).value;
			var role_val2 = document.getElementById("role2_"+member_id).value;
			
			
			console.log("아이디 : " + member_id);
			console.log("롤(role) 정보-1(체크 여부) : " + role_val1_checked);
			console.log("롤(role) 정보-2(체크 여부) : " + role_val2_checked);
			console.log("롤(role) 정보-1(기존) : " + role_val1);
			console.log("롤(role) 정보-2(기존) : " + role_val2);
			
			// 체크 상태에 따른 값 재할당
			role_val1 = role_val1_checked == true ? 'admin' : '';
			role_val2 = role_val2_checked == true ? 'user' : '';
			
			console.log("롤(role) 정보-1(변경) : " + role_val1);
			console.log("롤(role) 정보-2(변경) : " + role_val2);
			
			if (confirm('롤(role)을 정말 변경하시겠습니까?')) {
				
				// AJAX
				const xhr = new XMLHttpRequest();
				
				xhr.onreadystatechange = () => {
				    
					if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
						
						console.log("응답 : " + xhr.responseText);
						
						// if (xhr.responseText.trim() == '다른 회원과 중복되어 사용할 수 없는 메일입니다.') {
							
							// 이전 메일값을 불러와서 복원 : 임시 hidden 필드에 보관됨
							// document.getElementById("email_"+email_id).value 
							//	= document.getElementById("old_email_"+email_id).value; 
							
						// } 
						
						if (xhr.responseText.trim() != '') {
							
							alert(xhr.responseText); // 메시징
							
						}
						
						
				    } // 200
				    
				} //
				
				console.log("인자들 : " + "id="+member_id+"&role1="+role_val1+"&role2="+role_val2);
				
				xhr.open("POST", "/memberProject/admin/memberRoleUpdate.do", true);
				xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				xhr.send("id="+member_id+"&role1="+role_val1+"&role2="+role_val2);
				
			} else { // 취소
				
			} //
			
		} //
		
	} // for
		
}; // window.onload

