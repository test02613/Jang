<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<style>
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}

/* 이벤트 타이틀 */
#contents {
	height: 100px;
	color: #24292F;
	font-size: 40px;
	margin-top: 20px;
	text-align: center;
	font-weight: bold;
}
/* 수정,삭제 버튼 */
.rbutton {
	width: 80px;
	height: 40px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
/* 게시판 상단 타이틀 */
#title {
	text-align: center;
	align-content: center;
}

/* 목록에 마우스 가져다대면 회색으로 처리함 */
#myreview:hover {
	background-color: lightgray;
}
/* 게시글번호, 작성일자 가운데정렬 */
#center {
	text-align: center;
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
</head>
<body>
	<!-- 게시판 부트스트랩 -->
		<div id="wrapper">
			<!-- wrapper를 클래스랑 아이디 다 쓰는 이유는 무엇? -->
			<div id="contents">리뷰 관리</div>
			<table class="table">
				<!-- 게시판 상단 메뉴 -->
				<thead class="table-dark">
					<tr>
						<th scope="col" class="col-2" id="title">번호</th>
						<th scope="col" class="col-2" id="title">주문번호</th>
						<th scope="col" class="col-3" id="title">작성일</th>
						<th scope="col" class="col-10" id="title">제목</th>
						<th scope="col" class="col-3" id="title">#</th>
						<th scope="col" class="col-3" id="title">#</th>
					</tr>
				</thead>
				<!-- 게시글 목록 -->
				<tbody>
					<%--<c:forEach var="변수이름" items="반복할 객체명" begin="시작값" end="마지막값" step="증가값" varStatus="Status">--%>
					<c:forEach items="${myreview}" var="myreview" varStatus="Status">
						<tr
							onClick="location.href='${path}/reviewDetail?num=${myreview.ordernum}'"
							style="cursor: pointer;" id="myreview">
							<td id="center"><c:out value="${myreview.reviewnum}" /></td>
							<td id="center"><c:out value="${myreview.ordernum}" /></td>
							<td id="center"><c:out value="${myreview.reviewdate}" /></td>
							<td id="center"><c:out value="${myreview.reviewtitle}" /></td>

							<td id="center"><a
								href="/reviewUpdate?num=${myreview.reviewnum}">
									<button type="button" class="rbutton">수정</button>
							</a></td>
							<td id="center"><a
								href="/reviewDeleteAction?num=${myreview.reviewnum}">
									<button type="button" class="rbutton" onclick="riviewDelet();">삭제</button>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center" id="button">
				<a href="/mymain"><button type="button" class="mybutton">마이페이지로
						가기</button></a>
			</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		//삭제버튼 누르면 경고창 띄우기
		function riviewDelet() {
			window.confirm("리뷰 삭제시 다시 작성할 수 없습니다.")
		}
	</script>
</body>
</html>