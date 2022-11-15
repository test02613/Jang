<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	width: 300px;
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
		<h1 style="text-align: center">게시판 관리</h1>
		<br> <br>
		<div align="center">
			<hr width=1000px>
		</div>
		<br>
		<div class="center">
			<br>
			<div>
				<a href="/event"><button id="btt">이벤트 관리</button></a> <a
					href="/reviewAdmin"><button id="btt">리뷰 관리</button></a>
			</div>
			<div></div>
			<br> <br>
		</div>
	</div>
</body>
</html>