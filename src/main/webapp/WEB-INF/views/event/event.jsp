<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
/* 전체 랩 */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}

/* 페이지 상단 타이틀 : "이벤트" */
#subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
}
/* 중앙정렬 */
.center {
	text-align: center;
}
/* 게시판 상단 타이틀 */
#title {
	text-align: center;
	align-content: center;
}
/* 글쓰기 버튼 */
#eventwrite {
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
/* 목록에 마우스 가져다대면 회색으로 처리함 */
#list:hover {
	background-color: lightgray;
}
/* 게시글번호, 작성일자 가운데정렬 */
#center {
	text-align: center;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="event?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>
<body>
	<!-- 게시판 부트스트랩 -->
		<div id="wrapper">
			<div id="subjecet">이벤트</div>
			<div id="outter">
			<!-- 옵션선택 -->
			<div style="float: right; margin-bottom:10px;">
				<select id="cntPerPage" name="sel" onchange="selChange()">
					<option value="5"
						<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
					<option value="10"
						<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
					<option value="15"
						<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
					<option value="20"
						<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
				</select>
			</div> 
			<br>
			
			<table class="table">
				<!-- 게시판 상단 메뉴 -->
				<thead class="table-dark">
					<tr>
						<th scope="col" class="col-1" id="title">번호</th>
						<th scope="col" class="col-5" id="title">제목</th>
						<th scope="col" class="col-1" id="title">작성일</th>
					</tr>
				</thead>
				<!-- 게시글 목록 -->
				<tbody>
					<%--<c:forEach var="변수이름" items="반복할 객체명" begin="시작값" end="마지막값" step="증가값" varStatus="Status">--%>
					<c:forEach items="${viewAll}" var="list" varStatus="Status">
						<tr
							onClick="location.href='${path}/eventDetail?num=${list.eventnum}'"
							style="cursor: pointer;" id="list">
							<td id="center"><c:out value="${list.eventnum}" /></td>
							<td id="center"><c:out value="${list.eventtitle}" /></td>
							<td id="center"><c:out value="${list.eventdate}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/event?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/event?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/event?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	</div>
			<br>
			<!-- 글쓰기 버튼(관리자만) -->
			<c:if test="${admin eq 1}">
				<div class="center">
					<a href="/eventCreate"><button id="eventwrite">글쓰기</button></a></div>
			</c:if>
	</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>
</body>
</html>