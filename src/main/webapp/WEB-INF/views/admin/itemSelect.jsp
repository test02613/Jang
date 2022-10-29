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
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}
/* 게시글번호, 작성일자 가운데정렬 */
#center {
	text-align: center;
}

/* 페이지 상단 타이틀 : "상품관리" */
.subject {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
}
/* 상품관리 페이지로 가기 */
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

#title {
	text-align: center;
	align-content: center;
}

td:hover {
	text-decoration: underline;
}
/* 수정,삭제 버튼 */
.itembutton {
	width: 85px;
	height: 40px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
</style>
</head>
<body>

	<form id="itemselect" method="post">
		<!-- 게시판 부트스트랩 -->
		<div id="wrapper">
			<c:if test="${num==1 }">
				<h1 class="subject">상품 수정/삭제</h1>
			</c:if>
			<c:if test="${num==2 }">
				<h1 class="subject">상품옵션 등록</h1>
			</c:if>
			<c:if test="${num==3 }">
				<h1 class="subject">상품옵션 수정/삭제</h1>
			</c:if>
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th id="title" width="100" scope="col">상품번호</th>
						<th id="title" scope="col">상품이름</th>
						<th id="title" width="100" scope="col">카테고리</th>
						<c:if test="${num==1 }">
							<th id="title" width="100" scope="col">#</th>
						</c:if>
						<c:if test="${num==1 }">
							<th id="title" width="100" scope="col">#</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<c:if test="${num==1 }">
							<tr onClick="location.href='/itemInsert?num=${list.itemnum}'"
								style="cursor: pointer;">
						</c:if>
						<!-- 상품수정 -->
						<c:if test="${num==2 }">
							<tr onClick="location.href='/attrInsert?num=${list.itemnum}'"
								style="cursor: pointer;">
						</c:if>
						<!-- 상품옵션등록 -->
						<c:if test="${num==3 }">
							<tr onClick="location.href='/attrList?num=${list.itemnum}'"
								style="cursor: pointer;">
						</c:if>
						<!-- 상품옵션수정 -->
						<td id="center" style="text-decoration: none;"><c:out
								value="${list.itemnum}" /></td>
						<td id="center"><c:out value="${list.itemname}" /></td>
						<td id="center" style="text-decoration: none;"><c:out
								value="${list.itemcat2}" /></td>
						<c:if test="${num==1 }">
							<td id="center"><a
								href='${path}/itemInsert?num=${list.itemnum}'><button
										class="itembutton" type="button">수정</button></a>
						</c:if>
						</td>
						<c:if test="${num==1 }">
							<td id="center"><a
								href='${path}/itemDeleteAction?itemnum=${list.itemnum}'><button
										class="itembutton" type="button" onclick="itemDelete();">삭제</button></a>
						</c:if>
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center" id="button">
				<a href="/itemAdmin"><button type="button" class="adminbutton">상품관리
						페이지로 가기</button></a>
			</div>
		</div>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		//삭제버튼 누르면 경고창 띄우기
		function itemDelete() {
			window.confirm("상품을 삭제하시겠습니까?")
		}
	</script>

</body>
</html>