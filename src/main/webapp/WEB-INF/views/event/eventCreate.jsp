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
/* 이미지 업로드 버튼 */
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
/* 등록버튼 가운데정렬 */
.regist_button_wrap {
	text-align: center;
}
/* upload 버튼 */
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
/* input 영역 */
.imginput {
	width: 250px;
	height: 25px;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	font-size: 20px;
	margin-bottom: 10px;
	text-align: center;
}
/* 글자 속성 */
#eventtext {
	font-size: 25px;
	text-align: center;
}
/* 파일 선택 */
#file {
	font-size: 20px;
	text-align: center;
}
</style>
<body>
	<div id="wrapper">
		<c:if test="${detail.eventnum == null}">
			<div id="subjecet">이벤트 게시글 작성</div>
		</c:if>
		<c:if test="${detail.eventnum != null}">
			<div id="subjecet">이벤트 게시글 수정</div>
		</c:if>
		<center>
			<hr>
			<form id="eventCreate_form" method="post">
				<br>
				<table id="createform">
					<!-- 등록 -->
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
						<tr>
							<td id="eventtext" class="uploadDiv">이미지 업로드</td>
							<td><input class="imginput" type="file" id="input_img"
								name="uploadFile" style="height: 50px; width: 400px;" multiple />
								<button class="uploadbutton" type="button" id="uploadBtn">Upload</button>
								<div class="img_wrap"></div></td>
						</tr>
						<tr>
							<td id="eventtext">이미지 등록</td>
							<td><input class="imginput" type="text" id="eventDetailImg"
								name="eventdetailimg" style="height: 35px; width: 500px;"
								value="" readonly></td>
						</tr>
					</c:if>

					<!-- 수정 -->
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
						<tr>
							<td id="eventtext" class="uploadDiv">이미지 업로드</td>
							<td><input class="imginput" type="file" id="input_img"
								name="uploadFile" style="height: 50px; width: 400px;" multiple />
								<button class="uploadbutton" type="button" id="uploadBtn">Upload</button>
								<div class="img_wrap"></div></td>
						</tr>
						<tr>
							<td id="eventtext">이미지 등록</td>
							<td><input class="imginput" type="text" id="eventDetailImg"
								name="eventdetailimg" style="height: 35px; width: 500px;"
								value="${detail.eventdetailimg}" readonly></td>
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
			<br> <br> <br>
			<div style="text-align: center;">
				<a href="/event"><button id="insertbutton">글 목록 가기</button></a>
			</div>
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

		$(document)
			.ready(
			function() {
					// 수정 버튼
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
			//------------- 이미지 미리보기 시작 ------------------
			$("#input_img").on("change", handleImgFileSelect);

			//e : change 이벤트 객체
			// change 이벤트 설정하면  e는 이벤트가 된다. handleImgFileSelect에 파라미터 주면 e가 이벤트가 아니라 그냥 파라미터가 됨.
			function handleImgFileSelect(e) {

				console.log("이벤트: " + JSON.stringify(e));
				//e.target : 파일객체
				//e.target.files : 파일객체 안의 파일들
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);

				//f : 파일 객체
				filesArr
						.forEach(function(f) {
							//미리보기는 이미지만 가능함
							if (!f.type.match("image.*")) {
								alert("이미지만 가능합니다");
								return;
							}

							// 파일객체 복사
							sel_file.push(f);

							//파일을 읽어주는 객체 생성
							var reader = new FileReader();
							reader.onload = function(e) {
								//forEach 반복 하면서 img 객체 생성
								var img_html = "<img src=\"" + e.target.result + "\" />";
								$(".img_wrap").append(img_html);
							}
							reader.readAsDataURL(f);
						});
			}

			//------------- 이미지 미리보기 끝 ------------------

			//첨부파일의 확장자가 exe, sh, zip, alz 경우 업로드를 제한
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			//최대 5MB까지만 업로드 가능
			var maxSize = 5242880; //5MB
			//확장자, 크기 체크
			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				//체크 통과
				return true;
			}

			//Upload 버튼 클릭 시 수행
			$("#uploadBtn").on(
					"click",
					function(e) {
						//FormData : 가상의 <form> 태그
						//Ajax를 이용하는 파일 업로드는 FormData를 이용
						var formData = new FormData();
						//<input type="file" 요소
						var inputFile = $("input[name='uploadFile']");
						//<input type="file" 요소 내의 이미지들

						console.log("inputFile[0]:::::::::::::");
						var files = inputFile[0].files;

						console.log("files : " + files);

						for (var i = 0; i < files.length; i++) {
							console.log(files[i]);
							//확장자, 크기 체크
							//function checkExtension(fileName, fileSize){
							if (!checkExtension(files[i].name, files[i].size)) {//!true라면 실패
								return false;
							}

							formData.append("uploadFile", files[i]);
						}

						//카드가 없을 경우
						//processData,contentType은 반드시 false여야 전송됨
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