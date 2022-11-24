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
/* �̹��� ���ε� ��ư */
#uploadbutton {
	width: 100px;
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
/* upload ��ư */
.uploadbutton {
	width: 100px;
	height: 40px;
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
/* input ���� */
.input {
	width: 250px;
	height: 25px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* input ���� */
.imginput {
	width: 250px;
	height: 25px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* ���� �Ӽ� */
#eventtext {
	font-size: 25px;
	text-align: center;
}
/* ���� ���� */
#file {
	font-size: 20px;
	text-align: center;
}
</style>
<body>
	<div id="wrapper">
		<c:if test="${detail.eventnum == null}">
			<div id="subjecet">�̺�Ʈ �Խñ� �ۼ�</div>
		</c:if>
		<c:if test="${detail.eventnum != null}">
			<div id="subjecet">�̺�Ʈ �Խñ� ����</div>
		</c:if>
		<center>
			<hr>
			<form id="eventCreate_form" method="post">
				<br>
				<table id="createform">
					<!-- ��� -->
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
						<tr>
							<td id="eventtext" class="uploadDiv">�̹��� ���ε�</td>
							<td><input class="imginput" type="file" id="input_img"
								name="uploadFile" style="height: 50px; width: 400px;" multiple />
								<button class="uploadbutton" type="button" id="uploadBtn">Upload</button>
								<div class="img_wrap"></div></td>
						</tr>
						<tr>
							<td id="eventtext">�̹��� ���</td>
							<td><input class="imginput" type="text" id="eventDetailImg"
								name="eventdetailimg" style="height: 35px; width: 500px;"
								value="" readonly></td>
						</tr>
					</c:if>

					<!-- ���� -->
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
						<tr>
							<td id="eventtext" class="uploadDiv">�̹��� ���ε�</td>
							<td><input class="imginput" type="file" id="input_img"
								name="uploadFile" style="height: 50px; width: 400px;" multiple />
								<button class="uploadbutton" type="button" id="uploadBtn">Upload</button>
								<div class="img_wrap"></div></td>
						</tr>
						<tr>
							<td id="eventtext">�̹��� ���</td>
							<td><input class="imginput" type="text" id="eventDetailImg"
								name="eventdetailimg" style="height: 35px; width: 500px;"
								value="${detail.eventdetailimg}" readonly></td>
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
			<br> <br> <br>
			<div style="text-align: center;">
				<a href="/event"><button id="insertbutton">�� ��� ����</button></a>
			</div>
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

		$(document)
			.ready(
			function() {
					// ���� ��ư
					$(".eventUpdate_button")
							.click(
									function() {
										$("#eventCreate_form")
												.attr("action",
														"/eventUpdateAction?num=${detail.eventnum}");
										$("#eventCreate_form").submit();
									})
						})

		var sel_file = [];

		$(function() {
			//------------- �̹��� �̸����� ���� ------------------
			$("#input_img").on("change", handleImgFileSelect);

			//e : change �̺�Ʈ ��ü
			// change �̺�Ʈ �����ϸ�  e�� �̺�Ʈ�� �ȴ�. handleImgFileSelect�� �Ķ���� �ָ� e�� �̺�Ʈ�� �ƴ϶� �׳� �Ķ���Ͱ� ��.
			function handleImgFileSelect(e) {

				console.log("�̺�Ʈ: " + JSON.stringify(e));
				//e.target : ���ϰ�ü
				//e.target.files : ���ϰ�ü ���� ���ϵ�
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);

				//f : ���� ��ü
				filesArr
						.forEach(function(f) {
							//�̸������ �̹����� ������
							if (!f.type.match("image.*")) {
								alert("�̹����� �����մϴ�");
								return;
							}

							// ���ϰ�ü ����
							sel_file.push(f);

							//������ �о��ִ� ��ü ����
							var reader = new FileReader();
							reader.onload = function(e) {
								//forEach �ݺ� �ϸ鼭 img ��ü ����
								var img_html = "<img src=\"" + e.target.result + "\" />";
								$(".img_wrap").append(img_html);
							}
							reader.readAsDataURL(f);
						});
			}

			//------------- �̹��� �̸����� �� ------------------

			//÷�������� Ȯ���ڰ� exe, sh, zip, alz ��� ���ε带 ����
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			//�ִ� 5MB������ ���ε� ����
			var maxSize = 5242880; //5MB
			//Ȯ����, ũ�� üũ
			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("���� ������ �ʰ�");
					return false;
				}

				if (regex.test(fileName)) {
					alert("�ش� ������ ������ ���ε��� �� �����ϴ�.");
					return false;
				}
				//üũ ���
				return true;
			}

			//Upload ��ư Ŭ�� �� ����
			$("#uploadBtn").on(
					"click",
					function(e) {
						//FormData : ������ <form> �±�
						//Ajax�� �̿��ϴ� ���� ���ε�� FormData�� �̿�
						var formData = new FormData();
						//<input type="file" ���
						var inputFile = $("input[name='uploadFile']");
						//<input type="file" ��� ���� �̹�����

						console.log("inputFile[0]:::::::::::::");
						var files = inputFile[0].files;

						console.log("files : " + files);

						for (var i = 0; i < files.length; i++) {
							console.log(files[i]);
							//Ȯ����, ũ�� üũ
							//function checkExtension(fileName, fileSize){
							if (!checkExtension(files[i].name, files[i].size)) {//!true��� ����
								return false;
							}

							formData.append("uploadFile", files[i]);
						}

						//ī�尡 ���� ���
						//processData,contentType�� �ݵ�� false���� ���۵�
						$.ajax({
							url : '/uploadAjaxAction2',
							processData : false,
							contentType : false,
							data : formData,
							type : 'POST',
							dataType : 'json',
							async : false,
							success : function(result) {

								var data = JSON.stringify(result);
								console.log("result1 : " + data);
								console.log(typeof 'data');
								var data2 = JSON.parse(data);
								console.log("result2 : " + data2);
								console.log(typeof 'data2');

								var filename = data2[0].fileName;
								var uuid = data2[0].uuid;
								var uploadpath = data2[0].uploadPath;
								var uploadpath2 = uploadpath.slice(-29);
								console.log("uploadpath2: " + uploadpath2);

								var eventDetailImg = uploadpath2 + "\\" + uuid
										+ "-" + filename;
								console.log("filename: " + filename);
								console.log("uuid: " + uuid);
								console.log("uploadpath: " + uploadpath2);

								$('input[name=eventdetailimg]').attr('value',
										eventDetailImg);

							}
						});

					});
		});
	</script>
</body>
</html>