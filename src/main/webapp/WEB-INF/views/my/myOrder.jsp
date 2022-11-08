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
/* 전체 랩 */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}
/* 페이지 상단 타이틀 : "주문 정보 조회" */
.subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	height: 100px;
}
/* 리뷰작성 */
.reviewbutton {
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
/* 작성한 리뷰 보기 */
.reviewbutton2 {
	width: 130px;
	height: 45px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
/* 중앙정렬 */
.center {
	text-align: center;
}
/* 주문배송상태 */
#orderstate2 {
	color: red;
	text-align: center;
	align-content: center;
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
}
</style>
<body>
	<div id="wrapper">
		<h1 class="subjecet">주문 정보 조회</h1>
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th class="center">주문 날짜 / 주문번호</th>
						<th class="center">이미지</th>
						<th class="center">상품정보</th>
						<th class="center">상품구매가격</th>
						<th class="center">주문처리상태</th>
						<th class="center">리뷰작성</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${order}" var="order">
						<tr>
							<td style="text-align: center">${order.orderdate} /
								${order.ordernum}</td>
							<td style="text-align: center"><img
								src="${order.itemvo.itemimg}"
								style="width: 100px; height: 100px;"></td>
							<td style="text-align: center">${order.itemattrvo.itemname}</td>
							<td style="text-align: center">${order.ordercost}원</td>
							<td id="orderstate2">${order.state}</td>

							<c:if test="${order.review == 0}">
								<td class="center"><a
									href="/reviewCreate?item=${order.itemvo.itemnum}&order=${order.ordernum}"><button
											type="button" class="reviewbutton">리뷰 작성</button></a></td>
							</c:if>
							<c:if test="${order.review == 1}">
								<td class="center"><a
									href="/reviewDetail?num=${order.ordernum}"><button
											type="button" class="reviewbutton2">작성한 리뷰 보기</button></a></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<br>

	<div style="text-align: center" id="button">
		<a href="/mymain"><button type="button" class="mybutton">마이페이지로
				가기</button></a>
	</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</html>