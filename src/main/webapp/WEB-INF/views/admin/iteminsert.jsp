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
			<c:if test="${item.itemnum == null }">
				<tr>
					<td>번호</td>
					<td align="left"><input type="text" id = "itemnum" name="itemnum" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td align="left"><input type="text" name="itemname" /></td>
				</tr>
				<tr>
					<td>카테고리 대분류</td>
					<td align="left"><input type="text" name="itemcat1" /></td>
				</tr>
				<tr>
					<td>카테고리 소분류</td>
					<td align="left"><input type="text" name="itemcat2" /></td>
				</tr>
				<tr>
					<td>이미지 경로</td>
					<td align="left"><input type="text" name="itemimg" /></td>
				</tr>
				<tr>
					<td>디테일 이미지 경로</td>
					<td align="left"><input type="text" name="itemdetailimg" /></td>
				</tr>
			</c:if>
			<c:if test="${item.itemnum != null }">
				<tr>
					<td>번호</td>
					<td align="left"><input type="text" id = "itemnum" name="itemnum" value="${item.itemnum }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td align="left"><input type="text" name="itemname"  value="${item.itemname }" /></td>
				</tr>
				<tr>
					<td>카테고리 대분류</td>
					<td align="left"><input type="text" name="itemcat1"  value="${item.itemcat1 }"/></td>
				</tr>
				<tr>
					<td>카테고리 소분류</td>
					<td align="left"><input type="text" name="itemcat2"  value="${item.itemcat2 }"/></td>
				</tr>
				<tr>
					<td>이미지 경로</td>
					<td align="left"><input type="text" name="itemimg"  value="${item.itemimg }"/></td>
				</tr>
				<tr>
					<td>디테일 이미지 경로</td>
					<td align="left"><input type="text" name="itemdetailimg"  value="${item.itemdetailimg }"/></td>
				</tr>
			</c:if>
		</table>
		<c:if test="${item.itemnum == null }"><input type="button" class="insert_button" value="등록"></c:if>
		<c:if test="${item.itemnum != null }"><input type="button" class="update_button" value="등록"></c:if>

	</form>
	<script>
	var num = document.getElementById("itemnum").value;
		$(document).ready(function() {

			$(".insert_button").click(function() {
				$("#update").attr("action", "/iteminsertAction");
				$("#update").submit();

			})
		})
		$(document).ready(function() {

			$(".update_button").click(function() {
				$("#update").attr("action", "/itemupdateAction?num="+num);
				$("#update").submit();

			})
		})
	</script>
</body>
</html>