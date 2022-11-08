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
<style>
/* 전체 랩 */
#wrapper {
	width: 1000px;
	margin: auto;
	margin-top: 30px;
	border-radius: 10px;
}
/* 페이지 상단 타이틀 : "이벤트" */
#subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	height: 100px;
}
/* 중앙정렬 */
.center {
	text-align: center;
}
/* 제목라인 */
#title{
text-align:center;
align-content: center;
	font-weight: bold;
}
/* 수정,삭제 버튼 */
.ebutton {
	width: 90px;
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
</head>
<body>
	<!-- 게시판 부트스트랩 -->
	<div class="wrapper">
		<div id="wrapper">
			<div id="subjecet">이벤트</div>
			<table class="table">

				<thead class="table-dark">
					<tr>
						<th id="title" width="100" scope="col">번호</th>
						<th id="title" scope="col">제목</th>
						<th id="title" width="200" scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="title" style="text-decoration: none;"><c:out
								value="${detail.eventnum}" /></td>
						<td id="title" ><c:out value="${detail.eventtitle}" /></td>
						<td id="title" style="text-decoration: none;"><c:out
								value="${detail.eventdate}" /></td>
					</tr>
					<tr>
						<td id="title" colspan="3" height="200" scope="col"><c:out
								value="${detail.eventcontent}" /></td>
					</tr>
				</tbody>
			</table>
		<div class="center">
			<c:if test="${admin eq 1}">
				<a href='${path}/eventUpdate?num=${detail.eventnum}'><button class="ebutton">수정하기</button></a>
				<a href='${path}/eventDeleteAction?num=${detail.eventnum}'><button class="ebutton">삭제하기</button></a>
			</c:if>
		</div>
			<div style="text-align: right;">
				<a href="/event"><button class="ebutton">글 목록 가기</button></a></div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
</html>