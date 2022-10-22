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
	width: 1300px;
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
}

/* 게시판 상단 타이틀 */
#title {
	text-align: center;
	align-content: center;
} 

/* 목록에 마우스 가져다대면 회색으로 처리함 */
#memlist:hover {
	background-color: lightgray;
}
/* 게시글번호, 작성일자 가운데정렬 */
#center {
	text-align: center;
}

button {
	text-align: center;
	align-content: left;
}
</style>
</head>
<body>
	<!-- 게시판 부트스트랩 -->
		<div id="wrapper">
			<div id="contents">회원관리</div>
			<table class="table">
				<!-- 게시판 상단 메뉴 -->
				<thead class="table-dark">
					<tr>
						<th scope="col" class="col-" id="title">가입날짜</th>
						<th scope="col" class="col-" id="title">이름</th>
						<th scope="col" class="col-" id="title">아이디</th>
						<th scope="col" class="col-" id="title">포인트</th>
						<th scope="col" class="col-" id="title">관리자여부</th>
						<th scope="col" class="col-" id="title">탈퇴여부</th>
					</tr>
				</thead>
				<!-- 게시글 목록 -->
				<tbody>
					<%--<c:forEach var="변수이름" items="반복할 객체명" begin="시작값" end="마지막값" step="증가값" varStatus="Status">--%>
					<c:forEach items="${memlist}" var="memlist" varStatus="Status">
						<%-- <tr onClick="location.href='${path}/eventDetail?num=${memlist.eventnum}'"
							style="cursor: pointer;" id="memlist"> --%>
						<tr>	
							<td id="center"><c:out value="${memlist.joinDate}" /></td>
							<td id="center"><c:out value="${memlist.name}" /></td>
							<td id="center"><c:out value="${memlist.id}" /></td>
							<td id="center"><c:out value="${memlist.point}" /></td>
							<td id="center"><c:out value="${memlist.admin}" /></td>
							<td id="center"><c:out value="${memlist.leave}" />
							<a href="/memberBlack?id="${memlist.id}"><button
								type="button" class="black">블랙처리<button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<div id="button" >
				<a href="/adminMain"><button>관리자페이지로 돌아가기</button></a>
			</div>

		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>
</body>
</html>