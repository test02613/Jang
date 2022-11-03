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
/* 게시글번호, 작성일자 가운데정렬 */
#center {
	text-align: center;
}
/* 전체 랩 */
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
#title{
text-align:center;
align-content: center;
}
td:hover{
text-decoration: underline;

}

h1{
text-align:center;
}
#button{
text-align:center;
}
</style>
</head>
<body>

<form id="itemselect" method="post">
	<!-- 게시판 부트스트랩 -->
	<div class="wrapper">
		<div id="wrapper">
		<h1 class="subjecet">상품옵션 수정/삭제</h1>
			<table class="table" >
				<thead class="table-dark">
					<tr >
						<th id="title" width="100" scope="col">상품번호</th>
						<th id="title"  scope="col">상품이름</th>
						<th id="title"  scope="col">색상/용량</th>
						<th id="title" width="100"scope="col">상품코드</th>
						<th id="title" width="100"scope="col">#</th>
						<th id="title" width="100"scope="col">#</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr onClick="location.href='/attrInsert?code=${list.itemcode}'"  style="cursor:pointer;">
							<td id="title" style="text-decoration: none;"><c:out value="${list.itemnum}" />
							<td id="title" style="text-decoration: none;"><c:out value="${list.itemname}" />
							<td id="title" style="text-decoration: none;"><c:out value="${list.itemoption}" /></td>
							<td id="center" style="text-decoration: none;"><c:out   value="${list.itemcode}" /></td>
							<td id="center"><a href='${path}/attrInsert?code=${list.itemcode}'><button class="itembutton" type="button" >수정</button></a></td>
							<td id="center"><a href='${path}/attrselectDeleteAction?itemcode=${list.itemcode}&num=${list.itemnum}'><button type="button" class="itembutton" onclick="attrDelete();">삭제</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<div style="text-align: center" id="button">
				<a href="/itemAdmin"><button type="button" class="adminbutton">상품관리
						페이지로 가기</button></a>
			</div>
			</div>
		</div>
		</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
	
	//삭제버튼 누르면 경고창 띄우기
	function attrDelete() {
		alert("상품을 삭제하시겠습니까?")
	}
	</script>

		
</body>
</html>