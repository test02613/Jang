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
/*버튼 */
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
		<h1 style="text-align: center">마이페이지</h1>
		<br>
		<div align="center">
			<hr width=1000px>
		</div>
		<br>
		<h3 style="text-align: center">${member.name}님/잔여포인트 :
			${member.point}</h3>
				<br>
		<div class="center">
				<br>
			<div >
				<a href="/myupdate"><button id="btt">정보수정</button></a> <a
					href="/cart"><button id="btt">장바구니</button></a> <a href="/mypoint"><button
						id="btt">포인트</button></a>
			</div>
				<div>
				<a href="/myorder"><button id="btt">주문정보</button></a> <a
					href="/myreview"><button id="btt">리뷰관리</button></a> <a
					href="/myqna"><button id="btt">1대1문의</button></a>
			</div>
			<br> <br>
		</div>	</div>
</body>
</html>