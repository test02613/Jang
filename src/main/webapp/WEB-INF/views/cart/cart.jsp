<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<style>
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}
/* 페이지 상단 타이틀 : "장바구니" */
.subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	height: 100px;
}
/* 결제,삭제 버튼 */
.cbutton {
	width: 90px;
	height: 45px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
/* 결제하기 버튼 */
.orderbutton {
	width: 160px;
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
.center {
	text-align: center;
}
</style>
<body>
	<div id="wrapper">
		<h1 class="subjecet">장바구니</h1>

		<table class="table">
			<thead class="table-dark">
				<tr>
					<th style="text-align: center" scope="col" class="col-5" id="title">이미지</th>
					<th style="text-align: center" scope="col" class="col-5" id="title">상품이름 / 컬러</th>
					<th style="text-align: center" scope="col" class="col-4" id="title">가격</th>
					<th style="text-align: center" scope="col" class="col-" id="title">#</th>
					<th style="text-align: center" scope="col" class="col-" id="title">#</th>
				</tr>
			</thead>
			<tbody>
				<%--<c:forEach var="변수이름" items="반복할 객체명" begin="시작값" end="마지막값" step="증가값" varStatus="Status">--%>
				<c:forEach items="${cartlist}" var="cartlist" varStatus="Status">
					<tr
						onClick="location.href='${path}/itemDetail?num=${item.itemcode}'"
						style="cursor: pointer;" id="list">
						<td style="text-align: center" style="text-decoration: none;"><img
							src="${cartlist.itemimg}" style="width: 100px; height: 100px;" /></td>
						<td class="center"><c:out
								value="${cartlist.itemname} / ${cartlist.itemattr}" /></td>
						<td class="center"><c:out value="${cartlist.itemcost}" />원</td>
						<td class="center"><a
							href='${path}/order?code=${cartlist.itemcode}'>
								<button class="cbutton">결제</button>
						</a></td>
						<td class="center"><a
							href='${path}/cartDeleteAction?code=${cartlist.itemcode}'>
								<button class="cbutton">삭제</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>

		<div class="center" id="button">
			<a href="/#"><button type="button" class="orderbutton">구매하기
				</button></a>
		</div>
		<br>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</html>