<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<center>
		<div id="wrapper">
			<c:if test="${list.reviewnum == null}">
				<div id="subjecet">주문번호 ${order}번의 리뷰 작성</div>
			</c:if>
			<c:if test="${list.reviewnum != null}">
				<div id="subjecet">주문번호 ${list.ordernum}번의 리뷰 수정</div>
			</c:if>
			<hr>
			<br>
			<form id="reviewCreate_form" method="post">
				<table id="createform">
					<center>
					
						<!-- 글쓰기 -->
						<c:if test="${list.reviewnum == null}">
							<tr>
								<td><input type="hidden" id=ordernum name="ordernum"
									value="${order}"> <input type="hidden" name="itemnum"
									value="${item}"></td>
							</tr>
							<tr>
								<td class="sub_title">제목</td>
								<td><input class="tinput" type="text" name="reviewtitle" /></td>
							</tr>
							<tr>
								<td class="sub_title">내용</td>
								<td><textarea class="cinput" name="reviewcontent" cols="40"
										rows="10"></textarea></td>
							</tr>
						</c:if>

						<!-- 수정 -->
						<c:if test="${list.reviewnum!=null}">
							<tr>
								<td class="sub_title">제목</td>
								<td><input class="tinput" type="text" id=ordernum
									name="reviewtitle" value="${list.reviewtitle}" /></td>
							</tr>
							<tr>
								<td>내용</td>
								<td align="left"><textarea class="cinput"
										name="reviewcontent" cols="40" rows="10">${list.reviewcontent}</textarea></td>
							</tr>
						</c:if>
				</table>
				<c:if test="${list.reviewnum==null}">
					<input type="button" id="insertbutton" class="reviewCreate_button"
						value="등록하기">
				</c:if>
				<c:if test="${list.reviewnum!=null }">
					<input type="button" id="insertbutton" class="reviewUpdate_button"
						value="수정하기">
				</c:if>
				<hr>
			</form>
				<div style="text-align: right;">
				<a href="/myreview"><button id="insertbutton">글 목록 가기</button></a></div>
		</div>
	</center>
	<script>

		$(document).ready(
		function() {
		// 수정 버튼
		$(".reviewUpdate_button").click(
			function() {
				$("#reviewCreate_form")
						.attr("action",
								'${path}/reviewUpdateAction?num=${list.reviewnum}');
				$("#reviewCreate_form")
						.submit();

				})
		})
	</script>
	<script>
		var a = document.getElementById("ordernum").value

		$(document).ready(function() {
			// 등록 버튼
			$(".reviewCreate_button").click(function() {
				$("#reviewCreate_form").attr("action", "/reviewCreateAction");
				//alert(a); 
				$.ajax({
					type : "GET",
					url : "/reviewUp",
					data : {
						num : a
					},
					async : false,//전역 변수 보내기
					dataType : "json",

					success : function(result) {
						code = result;

						console.log("확인 : " + result);
						if (result) {

							return code;
						} else {

						}
					},
					error : function() {

					}

				});//아작스 끝
				$("#reviewCreate_form").submit();

			})
		})
	</script>
</body>
</html>