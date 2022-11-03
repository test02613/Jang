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
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
/* 전체 랩 */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
	border-radius: 10px;
}
/* 페이지 상단 타이틀 : "주문관리" */
.subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	height: 100px;
}
/* 변경 버튼 */
.change {
	width: 60px;
	height: 30px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}

#title {
	text-align: center;
	align-content: center;
	font-weight: :bold;
}

/* 주문관리 타이틀 */
#ordertitle {
	text-align: center;
	align-content: center;
	font-weight: :bold;
}

td:hover {
	text-decoration: underline;
}

.orderstate {
	text-align: right;
}

/* 주문,배송 상태 */
#orderstate2 {
	color: red;
	text-align: center;
	align-content: center;
}

/* 버튼 */
#button {
	text-align: center;
}
/* 관리자페이지로 가기 */
.adminbutton {
	width: 200px;
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
</style>
</head>
<body>

	<form id="itemselect" method="post">
		<!-- 게시판 부트스트랩 -->
		<div class="wrapper">
			<div id="wrapper">
				<h1 class="subjecet">주문관리</h1>
				<div class="orderstate">
					<select name="order_num" id="order_num" class='order_num'
						style="width: 200px; height: 30px;">
						<option value="">=== 주문 번호 ===</option>
						<c:forEach items="${orderlist}" var="orderlist">
							<option value="${orderlist.ordernum}">${orderlist.ordernum}</option>
						</c:forEach>
					</select> <select name="order_state" id="order_state" class='order_state'
						style="width: 200px; height: 30px;">
						<option value="">== 주문상태 변경 ==</option>
						<option value="결제 완료">결제 완료</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
					</select>
					<button id="change" class="change">변경</button>
				</div>
				<br>
				<table class="table">
					<thead class="table-dark">
						<tr>
							<th id="title" width="100" scope="col">주문 번호</th>
							<th id="title" width="100" scope="col">이미지</th>
							<th id="title" width="150" scope="col">상품명/옵션명</th>
							<th id="title" width="100" scope="col">아이디</th>
							<th id="title" width="100" scope="col">이름</th>
							<th id="title" width="100" scope="col">주문 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderlist}" var="orderlist">
							<tr
								<%-- onClick="location.href='/orderAdmin?num=${orderlist.ordernum}'" --%>
								style="cursor: pointer;">
								<td id="title" style="text-decoration: none;">${orderlist.ordernum}</td>
								<td style="text-align: center" style="text-decoration: none;"><img
									src="" style="width: 100px; height: 100px;" /></td>
								<td id="title" style="text-decoration: none;"><c:out
										value="${orderlist.itemattrvo.itemname}/${orderlist.itemattrvo.itemoption}" /></td>
								<td id="title" style="text-decoration: none;"><c:out
										value="${orderlist.id}" /></td>
								<td id="title" style="text-decoration: none;"><c:out
										value="${orderlist.name}" /></td>
								<td id="orderstate2" style="text-decoration: none;"><c:out
										value="${orderlist.state}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: center" id="button">
					<a href="/adminMain"><button type="button" class="adminbutton">관리자페이지로
							가기</button></a>
				</div>
			</div>
		</div>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		order_num
		$("#change").on("click", function() { // 구매 버튼
			$.ajax({
				type : "post",
				url : "/state_selcted",
				data : {
					state : $("#order_state option:selected").val(),
					num : $("#order_num option:selected").val()
				},
				dataType : "json",
				success : function(result) {
					var a = result;
					if (result) {
						/* alert("완료"+a);  */
					} else {
						/* alert("전송된 값 없음"+result);   */
					}
				},
				error : function() {
					/* alert("에러 발생"+result);  */
				}

			});//아작스 끝

		});
	})
</script>
</html>
