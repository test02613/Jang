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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<style>
/* 페이지 상단 타이틀 : "포인트 충전" */
.subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	height: 100px;
}
/* 포인트 입력란 */
#pointbox {
	height: 45px;
	border-radius: 10px;
	width: 250px;
	text-align: center;
}
/* 충전하기 버튼 */
#pointbutton {
	width: 200px;
	height: 45px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;

	border-radius: 10px;
	cursor: pointer;
}
/* 글씨 크기 */
.text {
	font-size: 25px;
	text-align: center
}
/* 마이페이지로 가기 */
.mybutton {
	width: 200px;
	height: 45px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin-bottom: 20px;
	margin-top: 40px;
}
</style>
<body>
	<br>
	<br>
	<div class="container">
		<h1 class="subjecet">포인트 충전</h1>
		<hr>
		<br>
		<form id="update" method="post">
			<div class="text">
				<input type="text" id="pointbox" name="point" /> <input
					type="button" class="update_button" id="pointbutton" value="충전하기">
			</div>
			<br>
			<div class="text">잔여 포인트 : ${member.point}</div>
			<br>
			<hr>
	</div>
	<div style="text-align: center" id="button">
		<a href="/mymain"><button type="button" class="mybutton">마이페이지로
				가기</button></a>
	</div>
</body>
<script>
	$(document).ready(function() {

		$(".update_button").click(function() {
			$("#update").attr("action", "/mypointUpdateAction");
			$("#update").submit();

		})
	})
</script>
</html>