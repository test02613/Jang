<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
<%--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/colorset.css">
  <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/user/userMyPageSideBar.css">
  <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/user/changeUserInfo.css">
  <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/changePwd.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  --%>
</head>
<body>


    <section>

      <div class="container">
        <div class="row">
 

          </div>
          <div class="col-md-9">
            <div id="changeUserHead">
              <br><br>
              <h3><strong>개인정보 변경</strong></h3>
            </div>
            <form action="${ pageContext.servletContext.contextPath }/userMyPage/updateMemberInfo" method="post" onsubmit="return validate();">
            <div class="changeUserInfo">
              <label>새비밀번호</label><input type="password" name="memPwd">
            </div>
            <div class="changeUserInfo">
              <label>새비밀번호 확인</label><input type="password" id="repwd">
            </div>
            <div class="changeUserInfo">
              <span id="pwdCheck"></span>
              <script>
              	$('#repwd').on('keyup',function() {
              		let pwd = $('input:password[name=memPwd]').val();
              		let repwd = $('#repwd').val();
              		
              		if(pwd == repwd) {
              			$('#pwdCheck').text('비밀번호가 일치합니다');
              		} else {
              			$('#pwdCheck').text('비밀번호가 일치하지 않습니다.');
              		}
              	})
              </script>
            </div>
            <div class="changeUserInfo">
              <label>이름</label><input type="text" name="user.name" value="${ requestScope.memberInfo.user.name }">
            </div>
            <div class="changeUserInfo">
              <label>닉네임</label><input type="text" name="nickname" value="${ requestScope.memberInfo.nickname }">
            </div>
            <div class="changeUserInfo">
              <label>이메일</label><input type="text" name="email" value="${ requestScope.memberInfo.email }">
              <button type="button" id="emailCheck" value="N" style="background: #F89E91; border: none; color: white; width: 60px; border-radius: 6px;">인증</button>
            </div>
            <div class="changeUserInfo">
              <label>인증코드</label><input type="text" id="codeCheck">
              <button type="button" onclick="codeChk()" style="background: #F89E91; border: none; color: white; width: 60px; border-radius: 6px;">확인</button>
            </div>
            <div class="changeUserInfo">
              <span id="checkResult" style="margin-left: 200px;"></span>
            </div>
            <div class="changeUserInfo">
              <label>우편번호</label><input type="text" name="postCode" value="${ requestScope.memberInfo.postCode }">
              <button type="button" id="postSearch" style="background: #F89E91; border: none; color: white; width: 60px; border-radius: 6px;">찾기</button>
            </div>
            <script>
            	// 우편번호 api
	            $('#postSearch').on('click', function() {
	            	
	                new daum.Postcode({
	                    oncomplete: function(data){
	                        //팝업에서 검색결과 항목을 클릭했을 시 실행할 코드를 작성하는 부분
	                        $('input:text[name=postCode]').val(data.zonecode);
	                        $('input:text[name=address]').val(data.address);
	                    }
	                }).open();
	            });
            	
            	// 이메일 인증
            	$('#emailCheck').on('click',function() {
            		let email = $("input:text[name=email]").val(); 
             		
             		$.ajax({
             			type: "post",
             			url: "${ pageContext.servletContext.contextPath }/userMyPage/emailCheck",
             			data : {
             				email : email
             			}, 
        	    		async: false,
        	    		success: function() {
        	    			alert('인증번호가 전송되었습니다.');
        	    		}
             		});
            	});
            	
            	// 인증코드 확인
            	function codeChk(){
		     		let inputCode = $("#codeCheck").val(); // 입력코드	
		     		
					$.ajax({
						type : "post",
						url : "${ pageContext.servletContext.contextPath }/userMyPage/codeCheck",
						data : {
							inputCode : inputCode	
						},
						async : false,
						success:function(data){ 

							let inputEmail = $("input:text[name=email]").val(); // 입력코드 
		     				let codeCheckResult = $("#checkResult"); // 비교결과 
		     				
		     				if(inputEmail != data){
		   						codeCheckResult.html("인증번호가 일치하지 않습니다. 인증번호를 다시 확인해주세요.");
		   						codeCheckResult.css("color", "#F35353");
		   						$('#emailCheck').val('N');
		   						return false;
		     				} else {
	     						codeCheckResult.html("인증번호가 일치합니다.");
	     						codeCheckResult.css("color", "#594EDE");
		   						$('#emailCheck').val('Y');
	   							return true;
		     				}
							
						},
						error : function(error){
		    				alert(error);
		    			}
					});
		    		
		     	};
            </script>
            <div class="changeUserInfo">
              <label>주소</label><input type="text" name="address" value="${ requestScope.memberInfo.address }">
            </div>
            <div class="changeUserInfo">
              <label>상세주소</label><input type="text" name="dAddress" value="${ requestScope.memberInfo.dAddress }">
            </div>
            <div id="confirmInfobtn">
              <button type="submit">&nbsp;&nbsp;확 &nbsp;&nbsp; 인</button>
            </div>
            </form>
            <script>
            	function validate() {
            		let pwd = $('input:password[name=memPwd]').val();
              		let repwd = $('#repwd').val();
            		
              		if(pwd == '') {
              			$('input:password[name=memPwd]').attr('disabled', true);
              		}
              		
            		if($('#emailCheck').val() == 'N') {
            			alert('인증번호가 일치하지 않습니다.');
            			return false;
            		}
            		
            		if($('input:text[name=dAddress]').val() == '' || $('input:text[name=address]').val() == '' ) {
            			alert('주소를 모두 입력해주세요.');
            			return false;
            		}
            		
            		if(pwd != repwd) {
            			alert('비밀번호를 확인해주세요.');
            			$('#repwd').focus();
            			return false;
            		}
            		
            		return true;
            	}
            </script>
          </div>
        </div>
      </div>
    </section>

  </body>
  </html>
    