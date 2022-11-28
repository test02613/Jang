<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewAdmin.jsp</title>
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
/* 페이지 상단 타이틀 : "주문관리" */
.subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
}

/* 게시판 상단 타이틀 */
#title {
	text-align: center;
	align-content: center;
}
/* 삭제버튼 */
.deletebutton {
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
/* 상세보기 버튼 */
.rdetailbutton {
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
/* 목록에 마우스 가져다대면 회색으로 처리함 */
#reviewlist:hover {
	background-color: lightgray;
}
/* 게시글번호, 작성일자 가운데정렬 */
#center {
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
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "reviewAdmin?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
</head>
<body>
	<!-- 게시판 부트스트랩 -->
	<div id="wrapper">
		<h1 class="subjecet">리뷰관리</h1>
		<div id="outter">
			<!-- 옵션선택 -->
			<div style="float: right; margin-bottom: 10px;">
				<select id="cntPerPage" name="sel" onchange="selChange()">
					<option value="5"
						<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
						보기</option>
					<option value="10"
						<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
						보기</option>
					<option value="15"
						<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
						보기</option>
					<option value="20"
						<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
						보기</option>
				</select>
			</div>
			<br>
			<table class="table">
				<!-- 게시판 상단 메뉴 -->
				<thead class="table-dark">
					<tr>
						<th scope="col" class="col-4" id="title">등록날짜 / 주문번호</th>
						<th scope="col" class="col-2" id="title">작성자</th>
						<th scope="col" class="col-4" id="title">제목</th>
						<th scope="col" class="col-4" id="title">내용</th>
						<th scope="col" class="col-2" id="title">#</th>
						<th scope="col" class="col-2" id="title">#</th>
					</tr>
				</thead>
				<!-- 게시글 목록 -->
				<tbody>
					<%--<c:forEach var="변수이름" items="반복할 객체명" begin="시작값" end="마지막값" step="증가값" varStatus="Status">--%>
					<c:forEach items="${reviewlist}" var="reviewlist"
						varStatus="Status">
						<%-- <tr onClick="location.href='${path}/reviewDetail?num=${reviewlist.ordernum}'"
							style="cursor: pointer;" id="reviewlist"> --%>
						<tr>
							<td id="center"><c:out
									value="${reviewlist.reviewdate} / ${reviewlist.ordernum}" /></td>

							<td id="center"><c:out value="${reviewlist.id}" /></td>
							<td id="center"><c:out value="${reviewlist.reviewtitle}" /></td>
							<td id="center"><c:out value="${reviewlist.reviewcontent}" /></td>
							<td id="center"><a
								href='${path}/reviewDetail?num=${reviewlist.ordernum}'>
									<button type="button" class="rdetailbutton">리뷰상세보기</button>
							</a></td>
							<td id="center"><a
								href='${path}/reviewAdminDeleteAction?reviewnum=${reviewlist.reviewnum}'>
									<button type="button" class="deletebutton"
										onclick="reviewDelete();">삭제</button>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div style="display: block; text-align: center;">
				<c:if test="${paging.startPage != 1 }">
					<a id="as"
						href="/reviewAdmin?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage}"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<b id="as">${p}</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a id="as"
								href="/reviewAdmin?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a id="as"
						href="/reviewAdmin?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
			<div style="text-align: center" id="button">
				<a href="/adminMain"><button type="button" class="adminbutton">관리자페이지로
						가기</button></a>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		/* 삭제버튼 누르면 경고창 띄우기 */
		function reviewDelete() {
			alert("리뷰를 삭제하시겠습니까?")
		}
	</script>
</body>
</html>