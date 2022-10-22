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
	width: 1000px;
	margin: auto;
	margin-top: 30px;
	border-radius : 10px ;
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
		<h1>아이템</h1>
			<table class="table" >
				<thead class="table-dark">
					<tr >
						<th id="title" width="100" scope="col">번호</th>
						<th id="title"   scope="col">이름</th>
						<th id="title" width="100"scope="col">카테고리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<c:if test="${num==1 }"><tr onClick="location.href='/iteminsert?num=${list.itemnum}'"  style="cursor:pointer;"></c:if><!-- 상품수정 -->
						<c:if test="${num==2 }"><tr onClick="location.href='/attrinsert?num=${list.itemnum}'"  style="cursor:pointer;"></c:if><!-- 상품옵션등록 -->
						<c:if test="${num==3 }"><tr onClick="location.href='/attrlist?num=${list.itemnum}'"  style="cursor:pointer;"></c:if><!-- 상품옵션수정 -->
							<td id="title" style="text-decoration: none;"><c:out  value="${list.itemnum}" /></td>
							<td  ><c:out   value="${list.itemname}" /></td>
							<td style="text-decoration: none;"><c:out   value="${list.itemcat2}" /></td>
						</tr>
					</c:forEach>
					
					
				</tbody>
			</table>
			</div>
		</div>
		</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		
</body>
</html>