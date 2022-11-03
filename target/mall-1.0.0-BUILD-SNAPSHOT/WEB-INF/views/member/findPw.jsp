<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 비밀번호 찾기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#findMemform {
	width: 500px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
	margin-bottom: 100px
}
.contents {
	height: 100px;
	color: #24292F;
	font-size: 40px;
	margin-top: 20px;
}

h2 {
	width: 100%;
	height: 50px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	margin-bottom: 20px;
	text-align: center;
	padding-top: 10px;
}

.findpwd>a {
	float: center;
	margin-top: 50px;
	padding: 10px;
}

.findpwd>input {
	width: 100%;
	height: 50px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	margin-bottom: 20px;
}

button {
	width: 100%;
	height: 50px;
	display: block;
	border: none;
	border-radius: 10px;
	margin-top: 20px;
	margin-bottom: 40px;
	font-size: 20px;
	color: white;
	background-color: #24292F;
}
/* 전체 화면을 덮는 layer, 로딩중일때 다른 이벤트를 방지하기 위함 */
#loadingBar {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	position: fixed;
	display: block;
	opacity: 0.7;
	background-color: #fff;
	z-index: 99;
	text-align: center;
}
/* 로딩중 이미지 위치 및 출력 순서 */
#loading-image {
	position: absolute;
	top: calc(50% - 200px/ 2);
	left: calc(50% - 200px/ 2);
	z-index: 100;
}
</style>

</head>
<body>
	<!-- 로딩중 -->
	<div id="loadingBar" style="display: none;"></div>
	<input type="hidden" name="alert" value="${resultMsg}" />
	<input type="hidden" name="isResult" value="${isResult}" />
	<form action="findPwAction" method="post">
		<div id="findMemform">
			<h3 class="contents">비밀번호 재설정</h3>
			<div class="findpwd">
				<c:if test="${pw != null }">
					<h2>이메일로 임시 비밀번호를 발송하였습니다.</h2>
				</c:if>
				<c:if test="${pw == null }">
					<input type="text" class="form-control" name="id" id="id"
						placeholder="아이디">
					<input type="email" class="form-control" name="email" id="email"
						placeholder="이메일주소">
				</c:if>
				<button class="defaultBtn loginBtn" type="submit" id="pwResetBtn">비밀번호
					재설정</button>
			</div>
			<p>
				아직 회원이 아니신가요? <a href="/join">회원가입하기</a> /  <a href="/login">로그인</a>
			</p>
		</div>
	</form>
</body>
</html>