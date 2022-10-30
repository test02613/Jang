
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">



<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.0.0.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/common.js" charset="utf-8"></script>

<script type="text/javascript">
	
</script>


</head>

<style>
/* 페이지 상단 타이틀 : "주문완료" */
#subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	height: 100px;
}
/* 전체 랩 */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}

a {
	text-decoration: none;
	color: #666;
	text-decoration: none
}

h1 {
	text-align: center;
	padding: 50px 0;
	font-weight: normal;
	font-size: 2em;
	letter-spacing: 10px;
}
/* 글쓰기 버튼 */
#btt {
	width: 110px;
	height: 45px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin-bottom: 20px;
}
/* 중앙정렬 */
#center {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}
</style>

<body>
	<div id="wrapper">
		<div id="subjecet">주문완료</div>
		<hr>
		<br>
		<div id="center">주문이 완료되었습니다.</div>
		<div id="center">
			주문번호는 <a href="/my_detail?ordernum=${order.ordernum}">${order.ordernum}</a>입니다.
		</div>
		<br>
		<hr>
		<br>
		<div style="text-align: center">
			<input type="button" id="btt" name="main" value="메인으로"
				onClick="location.href='/main'"> <input type="button"
				id="btt" name="orderList" value="주문확인"
				onclick="location.href='/myorder'">
		</div>
	</div>
</body>
</html>