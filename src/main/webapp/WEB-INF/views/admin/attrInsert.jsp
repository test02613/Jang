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
<body>
	<form id="update" method="post">
		<table>
			<c:if test="${num == 1}">
				<tr>
					<td>번호</td>
					<td align="left"><input type="text" name="itemnum"
						value="${item.itemnum }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td align="left"><input type="text" name="itemname"
						value="${item.itemname }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>아이템 코드</td>
					<td align="left"><input type="text" id="itemcode"
						name="itemcode" /></td>
				</tr>
				<tr>
					<td>색/용량</td>
					<td align="left"><input type="text" name="itemcolor" /></td>
				</tr>
				<tr>
					<td>가격</td>
					<td align="left"><input type="text" name="itemcost" /></td>
				</tr>
				<tr>
					<td>잔고</td>
					<td align="left"><input type="text" name="itemstock" /></td>
				</tr>
			</c:if>
			<c:if test="${num == 2}">
				<tr>
					<td>번호</td>
					<td align="left"><input type="text" name="itemnum"
						value="${item.itemnum }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td align="left"><input type="text" name="itemname"
						value="${item.itemname }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>아이템 코드</td>
					<td align="left"><input type="text" id="itemcode"
						name="itemcode" value="${item.itemcode }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>색/용량</td>
					<td align="left"><input type="text" name="itemcolor"
						value="${item.itemcolor }" /></td>
				</tr>
				<tr>
					<td>가격</td>
					<td align="left"><input type="text" name="itemcost"
						value="${item.itemcost }" /></td>
				</tr>
				<tr>
					<td>잔고</td>
					<td align="left"><input type="text" name="itemstock"
						value="${item.itemstock }" /></td>
				</tr>
			</c:if>

		</table>
		<c:if test="${num == 1}">
			<input type="button" class="insert_button" value="등록">
		</c:if>
		<c:if test="${num == 2}">
			<input type="button" class="update_button" value="1등록">
		</c:if>

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