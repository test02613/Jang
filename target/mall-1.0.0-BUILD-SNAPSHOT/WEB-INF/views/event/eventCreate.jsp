<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<title>새글등록</title>
</head>
<style>
/* 전체 랩 */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}
/* 페이지 상단 타이틀 : "이벤트 게시글 작성" */
#subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 35px;
	height: 100px;
}
/* 테이블 속성 */
#createform {
	text-align: center;
	height: 100px;
	color: black;
	font-size: 25px;
	height: 100px;
}
/* 제목 input 영역 */
.tinput {
	width: 500px;
	height: 30px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* 내용 input 영역 */
.cinput {
	width: 500px;
	height: 200px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* 제목, 내용 */
.sub_title {
	font-size: 25px;
	text-align: center;
	margin-top: 5px;
	margin-bottom: 5px;
}
/* 등록 버튼 */
#insertbutton {
	width: 130px;
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
/* 등록버튼 가운데정렬 */
.regist_button_wrap {
	text-align: center;
}
</style>
<body>
	<div id="wrapper">
	<c:if test="${detail.eventnum == null}">
		<div id="subjecet">이벤트 게시글 작성</div></c:if>
			<c:if test="${detail.eventnum != null}">
		<div id="subjecet">이벤트 게시글 수정</div></c:if>
		<center>
			<hr>
			<form id="eventCreate_form" method="post">
				<br>
				<table id="createform">
					<c:if test="${detail.eventnum == null}">
						<tr>
							<td class="sub_title">제목</td>
							<td><input class="tinput" type="text" name="eventtitle" /></td>
						</tr>
						<tr>
							<td class="sub_title">내용</td>
							<td><textarea class="cinput" name="eventcontent" cols="40"
									rows="10"></textarea></td>
						</tr>
					</c:if>
					<c:if test="${detail.eventnum != null}">
						<tr>
							<td class="sub_title">제목</td>
							<td align="left"><input class="tinput" type="text"
								name="eventtitle" value="${detail.eventtitle}" /></td>
						</tr>
						<tr>
							<td class="sub_title">내용</td>
							<td><textarea class="cinput" name="eventcontent" cols="40"
									rows="10">${detail.eventcontent}</textarea></td>
						</tr>
					</c:if>
				</table>
				<c:if test="${detail.eventnum == null}">
					<input type="button" id="insertbutton" class="eventCreate_button"
						value="등록하기">
				</c:if>
				<c:if test="${detail.eventnum != null}">
					<input type="button" id="insertbutton" class="eventUpdate_button"
						value="수정하기">
				</c:if>
			</form>
			<hr>
			<div style="text-align: right;">
			<a href="/event"><button id="insertbutton">글 목록 가기</button></a></div>
		</center>
	</div>
	<script>
		$(document).ready(function() {
			// 새글 등록 버튼
			$(".eventCreate_button").click(function() {
				$("#eventCreate_form").attr("action", "/eventCreateAction");
				$("#eventCreate_form").submit();

			})
		})

		$(document).ready(function() {
			// 수정 버튼
			$(".eventUpdate_button")
				.click(
				function() {
				$("#eventCreate_form").attr("action","/eventUpdateAction?num=${detail.eventnum}");
				$("#eventCreate_form").submit();
				})
			})
	</script>
</body>
</html>