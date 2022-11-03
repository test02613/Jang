<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c�±� ��� -->
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<title>���۵��</title>
</head>
<style>
/* ��ü �� */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}
/* ������ ��� Ÿ��Ʋ : "�̺�Ʈ �Խñ� �ۼ�" */
#subjecet {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 35px;
	height: 100px;
}
/* ���̺� �Ӽ� */
#createform {
	text-align: center;
	height: 100px;
	color: black;
	font-size: 25px;
	height: 100px;
}
/* ���� input ���� */
.tinput {
	width: 500px;
	height: 30px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* ���� input ���� */
.cinput {
	width: 500px;
	height: 200px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* ����, ���� */
.sub_title {
	font-size: 25px;
	text-align: center;
	margin-top: 5px;
	margin-bottom: 5px;
}
/* ��� ��ư */
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
/* ��Ϲ�ư ������� */
.regist_button_wrap {
	text-align: center;
}
</style>
<body>
	<div id="wrapper">
	<c:if test="${detail.eventnum == null}">
		<div id="subjecet">�̺�Ʈ �Խñ� �ۼ�</div></c:if>
			<c:if test="${detail.eventnum != null}">
		<div id="subjecet">�̺�Ʈ �Խñ� ����</div></c:if>
		<center>
			<hr>
			<form id="eventCreate_form" method="post">
				<br>
				<table id="createform">
					<c:if test="${detail.eventnum == null}">
						<tr>
							<td class="sub_title">����</td>
							<td><input class="tinput" type="text" name="eventtitle" /></td>
						</tr>
						<tr>
							<td class="sub_title">����</td>
							<td><textarea class="cinput" name="eventcontent" cols="40"
									rows="10"></textarea></td>
						</tr>
					</c:if>
					<c:if test="${detail.eventnum != null}">
						<tr>
							<td class="sub_title">����</td>
							<td align="left"><input class="tinput" type="text"
								name="eventtitle" value="${detail.eventtitle}" /></td>
						</tr>
						<tr>
							<td class="sub_title">����</td>
							<td><textarea class="cinput" name="eventcontent" cols="40"
									rows="10">${detail.eventcontent}</textarea></td>
						</tr>
					</c:if>
				</table>
				<c:if test="${detail.eventnum == null}">
					<input type="button" id="insertbutton" class="eventCreate_button"
						value="����ϱ�">
				</c:if>
				<c:if test="${detail.eventnum != null}">
					<input type="button" id="insertbutton" class="eventUpdate_button"
						value="�����ϱ�">
				</c:if>
			</form>
			<hr>
			<div style="text-align: right;">
			<a href="/event"><button id="insertbutton">�� ��� ����</button></a></div>
		</center>
	</div>
	<script>
		$(document).ready(function() {
			// ���� ��� ��ư
			$(".eventCreate_button").click(function() {
				$("#eventCreate_form").attr("action", "/eventCreateAction");
				$("#eventCreate_form").submit();

			})
		})

		$(document).ready(function() {
			// ���� ��ư
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