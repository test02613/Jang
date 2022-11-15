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
/* 전체 랩 */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}
/* 중앙정렬 */
.center {
	text-align: center;
}
/*  버튼 */
#btt {
	width: 250px;
	height: 80px;
	background-color: #24292F;
	font-size: 35px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin-bottom: 20px;
	margin-right: 20px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<h1 style="text-align: center">관리자 페이지</h1>
		<br> <br>
		<div align="center">
			<hr width=1000px>
		</div>
		<br>
		<div class="center">
			<br>
			<div>
				<a href="/memberAdmin"><button id="btt">회원관리</button></a> <a
					href="/itemAdmin"><button id="btt">상품관리</button></a>
			</div>
			<br>
			<div>
				<a href="/orderAdmin"><button id="btt">주문관리</button></a> <a
					href="/boardAdmin"><button id="btt">게시판 관리</button></a> <a
					href="/qnaAdmin"><button id="btt">1대1문의</button></a>
			</div>
			<br> <br>
		</div>
	</div>
</body>
</html>