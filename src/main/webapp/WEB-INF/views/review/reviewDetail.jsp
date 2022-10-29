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
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
	border-radius: 10px;
}
/* 페이지 상단 타이틀 : "리뷰" */
#subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	height: 100px;
}
#title {
	text-align: center;
	align-content: center;
}

td:hover {
	
}

h1 {
	text-align: center;
}
/* 수정,삭제 버튼 */
.rbutton {
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
/* 제목라인 */
#title{
text-align:center;
align-content: center;
	font-weight: bold;
}
#button {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 게시판 부트스트랩 -->
		<div id="wrapper">
			<div id="subjecet">리뷰</div>
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
								value="${detail.reviewnum}" /></td>
						<td id="title"><c:out value="${detail.reviewtitle}" /></td>
						<td id="title" style="text-decoration: none;"><c:out
								value="${detail.reviewdate}" /></td>
					</tr>
					<tr>
						<td id="title" colspan="3" height="200" scope="col"><c:out
								value="${detail.reviewcontent}" /></td>
					</tr>
				</tbody>
			</table>
		
		<div id="button">
			<!-- 회원만 수정 가능 -->
			<c:if test="${admin eq 0}">
				<a href='${path}/reviewUpdate?num=${detail.reviewnum}'><button class="rbutton">수정하기</button></a>
			</c:if>
			<a href='${path}/reviewDeleteAction?num=${detail.reviewnum}'><button class="rbutton">삭제하기</button></a>
				<div style="text-align: right;">
				<a href="/myreview"><button class="rbutton">글 목록 가기</button></a></div>
		</div>
		</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
</html>