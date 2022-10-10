<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8" />
<meta name="google-signin-client_id" content="840345488051-t7d9q5tg8he8kt3om4dmlovpjom64m3q.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
/* 로그인 페이지 전체 영역 css */
#loginform {
   width: 500px;
   margin: 0 auto;
   margin-top: 50px;
   text-align: center;
   margin-bottom: 100px
}

/* 로그인 타이틀 */
.contents {
   height : 100px;
   color : #24292F;
   font-size : 40px;
   margin-top : 20px;
}

/* 로그인 구성요소 : a 태그들 */
.logintable>#frm>a {
   float: center;
   margin-top : 50px;
   padding : 10px;
}

/* 로그인 구성요소 : 입력란 */
.logintable>#frm>.form-control {
   width: 100%;
   height: 50px;
   border: 1px solid #e0e0e0;
   border-radius : 10px;
   margin-bottom: 20px;
}

/* 로그인 구성요소 : 로그인 버튼 */
#login {
   width: 100%;
   height: 50px;
   display: block;
   border: none;
   border-radius: 10px;
   margin-top: 20px;
   margin-bottom: 40px;
   font-size: 20px;
   color : white;
   background-color : #24292F;
}

</style>


	<div id="loginform">
		<h3 class="contents">로그인</h3>
		<div class="logintable">
		<form action="loginAction" method="POST" id="frm">
			<input type="text" class="form-control" name="id"
				id="id" placeholder="아이디">
			<input type="password" class="form-control" name="pw"
				id="pw" placeholder="비밀번호">
			<a href="/findPw">비밀번호
					재설정</a>
			<a href="/findId">아이디
					찾기</a>
			<button type="submit" class="defaultBtn loginBtn" id="login">로그인</button>
		</form>
			<p>
			아직 회원이 아니신가요? <a href="join">회원가입하기</a>
			</p>
		</div>
		</div>


<script type="text/javascript">
if('${message}' != "") {
	alert('${message}');
}


//공란 확인
 $(document).ready(function() {
	
	$("#login").unbind("click").click(function(e) {
		e.preventDefault();
		fn_login();
	});

	function fn_login() {
		if($("#id").val()==""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
		} else if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#pw").focus();
		} else {
			$("#frm").submit();
		}
	}
}); 
</script>