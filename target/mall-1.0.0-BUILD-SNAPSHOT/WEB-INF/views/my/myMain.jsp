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

</head>
<body>
<div id="wrapper">
	<br>
	<br>
	<h1 style="text-align: center">마이페이지</h1>
	<br>
	<hr>
	</table>
	<h3 style="text-align: right">${member.name}님  / 잔여포인트 : ${member.point}</h3>
	<br>
	<h1>
		<a href="/myupdate">정보수정</a>
	</h1>
	<h1>
		<a href="/myorder">주문정보</a>
	</h1>
	<h1>
		<a href="/mypoint">포인트</a>
	</h1>
	<h1>
		<a href="/myreview">리뷰관리</a>
	</h1>
	<h1>
		<a href="/cart">장바구니</a>
	</h1>
	<h1>
		<a href="/myqna">1대1문의</a>
	</h1>
		<br>	<br>
		</div>
</body>
</html>