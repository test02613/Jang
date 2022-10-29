<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<style>
/* 전체 랩 */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}
/* 페이지 상단 타이틀 : "상품옵션 수정,등록" */
.subject {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
}

.center {
	text-align: center;
}
/* 테이블 */
.attrtable {
	margin-left: auto;
	margin-right: auto;
	font-size: 25px;
}
/* 상품등록,수정 버튼 */
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
/*상품등록,수정 버튼 가운데정렬 */
.regist_button_wrap {
	text-align: center;
}
/* input 영역 */
.input {
	width: 250px;
	height: 25px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* 셀렉트박스 */
.selectbox {
	width: 250px;
	height: 25px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 15px;
	margin-bottom: 10px;
	text-align: center;
}
</style>
<body>
	<form id="update" method="post">
		<div id="wrapper">
			<c:if test="${num == 1}">
				<div class="subject">상품옵션 등록</div>
			</c:if>
			<c:if test="${num == 2}">
				<div class="subject">상품옵션 수정</div>
			</c:if>
			<hr>
			<br>
			<table class="attrtable">
				<c:if test="${num == 1}">
					<tr>
						<td class="center">상품번호</td>
						<td align="left"><input class="input" type="text"
							name="itemnum" value="${item.itemnum }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="center">상품이름</td>
						<td align="left"><input class="input" type="text"
							name="itemname" value="${item.itemname }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="center">상품코드</td>
						<td align="left"><input class="input" type="text"
							id="itemcode" name="itemcode" /></td>
					</tr>
					<tr>
						<td class="center">색/용량</td>
						<td align="left"><input class="input" type="text"
							name="itemcolor" /></td>
					</tr>
					<tr>
						<td class="center">가격</td>
						<td align="left"><input class="input" type="text"
							name="itemcost" /></td>
					</tr>
					<tr>
						<td class="center">재고</td>
						<td align="left"><input class="input" type="text"
							name="itemstock" /></td>
					</tr>
				</c:if>
				<c:if test="${num == 2}">
					<tr>
						<td class="center">상품번호</td>
						<td align="left"><input class="input" type="text"
							name="itemnum" value="${item.itemnum }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="center">상품이름</td>
						<td align="left"><input class="input" type="text"
							name="itemname" value="${item.itemname }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="center">상품코드</td>
						<td align="left"><input class="input" type="text"
							id="itemcode" name="itemcode" value="${item.itemcode }"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="center">색/용량</td>
						<td align="left"><input class="input" type="text"
							name="itemcolor" value="${item.itemcolor }" /></td>
					</tr>
					<tr>
						<td class="center">가격</td>
						<td align="left"><input class="input" type="text"
							name="itemcost" value="${item.itemcost }" /></td>
					</tr>
					<tr>
						<td class="center">재고</td>
						<td align="left"><input class="input" type="text"
							name="itemstock" value="${item.itemstock }" /></td>
					</tr>
				</c:if>

			</table>
			<br>

			<hr>
			<div class="regist_button_wrap">
				<c:if test="${num == 1}">
					<input type="button" class="insert_button" id="insertbutton"
						value="등록">

				</c:if>
				<c:if test="${num == 2}">
					<input type="button" class="update_button" id="insertbutton"
						value="수정">

				</c:if>
			</div>
		</div>
	</form>
	<script>
		var itemcode = document.getElementById("itemcode").value;
		$(document).ready(function() {

			$(".insert_button").click(function() {
				$("#update").attr("action", "/attrInsertAction");
				$("#update").submit();

			})
		})
		$(document).ready(
				function() {

					$(".update_button").click(
							function() {
								$("#update").attr("action",
										"/attrUpdateAction?num=" + itemcode);
								$("#update").submit();

							})
				})
	</script>
</body>
</html>