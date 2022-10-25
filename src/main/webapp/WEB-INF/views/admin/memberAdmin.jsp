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
	border-radius: 10px;
}

#title {
	text-align: center;
	align-content: center;
}

td:hover {
	text-decoration: underline;
}
/* 게시글번호, 작성일자 가운데정렬 */
#center {
	text-align: center;
}

h1 {
	text-align: center;
}

#button {
	text-align: center;
}
</style>
</head>
<body>
	<form id="itemselect" method="post">
		<!-- 게시판 부트스트랩 -->
		<div class="wrapper">
			<div id="wrapper">
				<h1>회원관리</h1>
				<table class="table">
					<thead class="table-dark">
						<tr>
							<th id="title" width="100" scope="col">아이디</th>
							<th id="title" width="100" scope="col">이름</th>
							<th id="title" width="100" scope="col">번호</th>
							<th id="title" width="100">상태</th>
							<th id="title" width="100">#</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<c:if test="${list.leave == 0}">
								<tr>
									<td id="title" style="text-decoration: none;"><c:out
											value="${list.id}" /></td>
									<td id="center"><c:out value="${list.name}" /></td>
									<td id="center" style="text-decoration: none;"><c:out
											value="${list.mobile}" /></td>
									<td id="center">일반</td>
									<td id="center"><a href="/memberBlack?id=${list.id}"><button
												type="button" onclick="blackMember();">블랙</button></a></td>
								</tr>
							</c:if>
							<c:if test="${list.leave == 1}">
								<tr style="background-color: lightgray;">
									<td id="title" style="text-decoration: none;"><c:out
											value="${list.id}" /></td>
									<td id="center"><c:out value="${list.name}" /></td>
									<td id="center" style="text-decoration: none;"><c:out
											value="${list.mobile}" /></td>
									<td id="center">탈퇴</td>
									<td id="center"><a href="/blackReturn?id=${list.id}"><button
												type="button" onclick="blackCancle();">살리기</button></a></td>
								</tr>
							</c:if>
							<c:if test="${list.leave == 2}">
								<tr style="background-color: gray;">
									<td id="title" style="text-decoration: none;"><c:out
											value="${list.id}" /></td>
									<td id="center"><c:out value="${list.name}" /></td>
									<td id="center" style="text-decoration: none;"><c:out
											value="${list.mobile}" /> </td>
											<td id="center">블랙</td>
									<td id="center"><a href="/blackReturn?id=${list.id}"><button
												type="button" onclick="blackCancle();">되돌리기</button></a></td>
								</tr>
							</c:if>
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
	<script>
		//블랙버튼 누르면 경고창 띄우기
		function blackMember() {
			window.confirm("블랙처리하시겠습니까?")
		}

		//되돌리기버튼 누르면 경고창 띄우기
		function blackCancle() {
			window.confirm("되돌리시겠습니까?")
		}
	</script>
</body>
</html>