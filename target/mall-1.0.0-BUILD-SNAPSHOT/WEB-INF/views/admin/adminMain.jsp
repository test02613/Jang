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
<style>
/* 페이지 전체 영역 css */
#aminform {
	width: 500px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
	margin-bottom: 100px
}
/* 타이틀 */
.contents {
	text-align: center;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	margin-top: 20px;
}
/* 버튼 */
#admin_button {
	text-decoration-line: none;
	margin-left: 250px;
	width: 400px;
	height: 150px;
	display: block;
	border: none;
	border-radius: 10px;
	margin-top: 20px;
	margin-bottom: 40px;
	font-size: 70px;
	color: white;
	text-align: center;
	background-color: #24292F;
}

#a {
	margin-left: 750px;
	width: 400px;
	height: 150px;
	display: block;
	border: none;
	border-radius: 10px;
	margin-top: 20px;
	margin-bottom: 40px;
	font-size: 70px;
	color: white;
	text-align: center;
	background-color: #24292F;
}
</style>
</head>
<body>
	<div id="loginform">
		<h1 class="contents">관리자 페이지 입니다.</h1>
		<h1>
			<a href="/memberAdmin">회원관리</a>
		</h1>
		<h1>
			<a href="/orderAdmin">주문관리</a>
		</h1>
		<h1>
			<a href="/reviewAdmin">리뷰관리</a>
		</h1>
		<h1>
			<a href="/itemAdmin">상품관리</a>
		</h1>
		<br>
		<h1>
			<a href="/qnaAdmin">1대1문의</a>
		</h1>
		<br>

 <!-- css 적용중 -->
		<div id="admin_button">
			<a href='/memberAdmin'>회원관리</a>
		</div>
		<div id="admin_button">
			<a href='/itemAdmin'>상품관리</a>
		</div>
		<div id="admin_button">
			<a href='/orderAdmin'>주문관리</a>
		</div>
		<div id="admin_button">
			<a href='/reviewAdmin'>리뷰관리</a>
		</div>



		<br>
		<br>
		<br>

	</div>

</body>
</html>