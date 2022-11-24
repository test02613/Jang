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
/* 전체 랩 */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
	border-radius: 10px;
}
/* 아이디 찾기 폼 */
#findMemform {
	width: 500px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
	margin-bottom: 100px
}

/* 아이디 찾기 타이틀 */
.contents {
	height: 100px;
	color: #24292F;
	font-size: 40px;
	margin-top: 20px;
}

/* 아이디찾기 구성요소 : a태그들 */
.findid>a {
	float: center;
	margin-top: 50px;
	padding: 10px;
}

/* 아이디찾기 구성요소 : 입력란 */
.findid>input {
	width: 100%;
	height: 50px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	margin-bottom: 20px;
}

/* 아이디찾기 구성요소 : button */
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
/* 로그인 페이지로 가기 버튼 */
#gologin{
	width: 350px;
	height: 45px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin-top: 20px;
	margin-bottom: 20px;
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
/* 가운데 정렬 */
#center {
	text-align: center;
}
</style>
</head>
<body>
	<div id="wrapper">
		<input type="hidden" name="alert" value="${resultMsg}" /> <input
			type="hidden" name="isResult" value="${isResult}" />
		<form action="/findIdAction" method="post">
			<div id="findMemform">
				<c:if test="${id == null }">
					<h3 class="contents">아이디 찾기</h3>
				</c:if>
				<c:if test="${id != null }">
					<h3 class="contents">아이디 찾기 결과</h3>
				</c:if>
				<div class="findid">
					<c:if test="${id != null }">
						<h2>찾으시는 아이디는' ${id}' 입니다.</h2>
					</c:if>
					<br>
					<c:if test="${id == null }">
						<input type="text" class="form-control" name="name"
							id="MEMBER_NAME" placeholder="이름">
						<input type="email" class="form-control" name="email"
							id="MEMBER_EMAIL" placeholder="이메일주소">
					</c:if>
					<div id="center">
					
						<c:if test="${id == null }">
							<a href="/findPw">비밀번호 재설정</a>
							<button class="defaultBtn loginBtn" type="submit" id="findIdBtn">아이디
								찾기</button>
							<p>
								아직 회원이 아니신가요? <a href="/join">회원가입하기</a>
							</p></c:if>
								<c:if test="${id != null }">
							<a href="/login"><button id="gologin">로그인 페이지 가기</button></a>
						</c:if>
					</div>
					
				</div>
			</div>
				</form>
	</div>
</body>
</html>