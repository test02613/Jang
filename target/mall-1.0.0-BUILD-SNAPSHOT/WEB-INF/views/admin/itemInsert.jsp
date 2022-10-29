<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
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
/* 글자 속성 */
#itemtext {
	font-size: 25px;
	text-align: center;
}
/* 파일 선택 */
#file {
	font-size: 20px;
	text-align: center;
}
/* 테이블 */
.itemtable {
	margin-left: auto;
	margin-right: auto;
	font-size: 25px;
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
/* 페이지 상단 타이틀 : "상품등록" */
.subject {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
}
/* upload 버튼 */
#uploadbutton {
	width: 100px;
	height: 30px;
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
/* 목록에 마우스 가져다대면 회색으로 처리함 */
#reviewlist:hover {
	background-color: lightgray;
}
/* 관리자페이지로 가기 */
.adminbutton {
	width: 200px;
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
/* 중앙정렬 */
.center {
	text-align: center;
}

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
	<form id="item_regist_form" method="post">
		<div id="wrapper">
			<c:if test="${item.itemnum == null }">
				<div class="subject">상품등록</div>
			</c:if>
			<c:if test="${item.itemnum != null }">
				<div class="subject">상품수정</div>
			</c:if>
			<hr>
			<br>
			<div class="boardWrite">
				<table class="itemtable">

					<tbody>
						<c:if test="${item.itemnum == null }">
							<tr>
								<td id="itemtext">상품번호</td>
								<td><input id="itemnum" name="itemnum" class="input"
									value="" type="text" />
							</tr>
							<tr>
								<td id="itemtext">상품명</td>
								<td><input id="itemname" name="itemname" class="input"
									value="" type="text" />
							</tr>
							<tr id="category">
								<td id="itemtext">카테고리1</td>
								<td><select id="itemcategory" name="itemcat1"
									class="selectbox">
										<option value="" selected="selected">카테고리를 선택 해주세요.</option>
										<option value="1">MAC</option>
										<option value="2">iPad</option>
										<option value="3">iPhone</option>
										<option value="4">Apple Watch</option>
										<option value="5">AirPods</option>
										<option value="6">Accessory</option>
								</select></td>
							</tr>
							<tr id="category">
								<td id="itemtext">카테고리2</td>
								<td><select id="itemcategory" name="itemcat2"
									class="selectbox">
										<option value="${item.itemcat2 }" selected="selected">카테고리를
											선택 해주세요.</option>
										<option value="11">iMAC</option>
										<option value="12">MacBook Pro</option>
										<option value="13">MacBook Air</option>
										<option value="21">iPad Pro</option>
										<option value="22">iPad Air</option>
										<option value="23">iPad</option>
										<option value="24">iPad mini</option>
										<option value="31">iPhone14</option>
										<option value="32">iPhone13</option>
										<option value="33">iPhoneSE</option>
										<option value="34">iPhone12</option>
										<option value="41">Apple Watch Ultra</option>
										<option value="42">Apple Watch 8</option>
										<option value="43">Apple Watch SE</option>
										<option value="44">Apple Watch Hermes</option>
										<option value="51">AirPods2</option>
										<option value="52">AirPods3</option>
										<option value="53">AirPods Pro2</option>
										<option value="54">AirPods Max</option>
										<option value="61">case</option>
										<option value="62">cable</option>
										<option value="63">MacSafe</option>
										<option value="64">AirTag</option>
								</select></td>
							</tr>
							<tr>
								<td id="itemtext" class="uploadDiv">썸네일 이미지 업로드</td>
								<td><input class="input" type="file" id="input_img"
									name="uploadFile" style="height: 50px; width: 270px;" multiple />

									<button id="uploadbutton" type="button" id="uploadBtn">Upload</button>
									<div class="img_wrap"></div></td>
							</tr>
							<tr>
								<td id="itemtext">썸네일 이미지 등록</td>
								<td><input class="input" type="text" id="itemImg"
									name="itemimg" style="height: 30px;" value="" readonly></td>
							<tr>
								<td id="itemtext">상세 이미지 등록</td>
								<td><input class="input" type="text" id="itemDetailImg"
									name="itemdetailimg" style="height: 30px;" value="" readonly></td>
							</tr>
						</c:if>
						<c:if test="${item.itemnum != null }">
							<tr>
								<td id="itemtext">상품번호</td>
								<td><input class="input" id="itemnum" name="itemnum"
									class="inputTypeText" value="${item.itemnum }" type="text"
									readonly />
							</tr>
							<tr>
								<td id="itemtext">상품명</td>
								<td><input class="input" id="itemname" name="itemname"
									class="inputTypeText" value="${item.itemname }" type="text" />
							</tr>
							<tr id="category">
								<td id="itemtext">카테고리1</td>
								<td><select class="selectbox" id="itemcategory"
									name="itemcat1">
										<option value="${item.itemcat1 }" selected="selected">카테고리를
											선택 해주세요.</option>
										<option value="1">MAC</option>
										<option value="2">iPad</option>
										<option value="3">iPhone</option>
										<option value="4">Apple Watch</option>
										<option value="5">AirPods</option>
										<option value="6">Accessory</option>
								</select></td>
							</tr>
							<tr id="category">
								<td id="itemtext">카테고리2</td>
								<td><select id="itemcategory" name="itemcat2"
									class="selectbox">
										<option value="${item.itemcat2 }" selected="selected">카테고리를
											선택 해주세요.</option>
										<option value="11">iMAC</option>
										<option value="12">MacBook Pro</option>
										<option value="13">MacBook Air</option>
										<option value="21">iPad Pro</option>
										<option value="22">iPad Air</option>
										<option value="23">iPad</option>
										<option value="24">iPad mini</option>
										<option value="31">iPhone14</option>
										<option value="32">iPhone13</option>
										<option value="33">iPhoneSE</option>
										<option value="34">iPhone12</option>
										<option value="41">Apple Watch Ultra</option>
										<option value="42">Apple Watch 8</option>
										<option value="43">Apple Watch SE</option>
										<option value="44">Apple Watch Hermes</option>
										<option value="51">AirPods2</option>
										<option value="52">AirPods3</option>
										<option value="53">AirPods Pro2</option>
										<option value="54">AirPods Max</option>
										<option value="61">case</option>
										<option value="62">cable</option>
										<option value="63">MacSafe</option>
										<option value="64">AirTag</option>
								</select></td>
							</tr>
							<tr>
								<td id="itemtext" class="uploadDiv">썸네일 이미지 업로드</td>
								<td><input class="input" type="file" id="input_img"
									name="uploadFile" style="height: 50px; width: 270px;" multiple />

									<button id="uploadbutton" type="button" id="uploadBtn">Upload</button>
									<div class="img_wrap"></div></td>
							</tr>
							<tr>
								<td id="itemtext">썸네일 이미지 등록</td>
								<td><input class="input" type="text" id="itemImg"
									name="itemimg" style="height: 30px;" value="${item.itemimg }"
									readonly></td>
							<tr>
								<td id="itemtext">상세 이미지 등록</td>
								<td><input class="input" type="text" id="itemDetailImg"
									name="itemdetailimg" style="height: 30px;"
									value="${item.itemdetailimg }" readonly></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<br>

			<hr>
			<div class="regist_button_wrap">
				<c:if test="${item.itemnum == null }">
					<input type="button" id="insertbutton" class="regist_button"
						value="상품 등록하기">
				</c:if>
				<c:if test="${item.itemnum != null }">
					<input type="button" id="insertbutton" class="update_button"
						value="상품 수정하기">
				</c:if>
			</div>
		</div>
	</form>


	<script type="text/javascript">
		$(document).ready(function() {
			// 상품등록 버튼
			$(".regist_button").click(function() {
				$("#item_regist_form").attr("action", "/itemRegistAction");
				$("#item_regist_form").submit();

			})
		})
		var num = document.getElementById("itemnum").value;
		$(document).ready(
				function() {
					// 상품등록 버튼
					$(".update_button").click(
							function() {
								$("#item_regist_form").attr("action",
										"/itemUpdateAction?num=" + num);
								$("#item_regist_form").submit();

							})
				})

		var sel_file = [];

		$(function() {
			//------------- 이미지 미리보기 시작 ------------------
			$("#input_img").on("change", handleImgFileSelect);

			//e : change 이벤트 객체
			// change 이벤트 설정하면  e는 이벤트가 된다. handleImgFileSelect에 파라미터 주면 e가 이벤트가 아니라 그냥 파라미터가 됨.
			function handleImgFileSelect(e) {

				console.log("여길봐라: " + JSON.stringify(e));
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
			$("#uploadBtn")
					.on(
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
									if (!checkExtension(files[i].name,
											files[i].size)) {//!true라면 실패
										return false;
									}

									formData.append("uploadFile", files[i]);
								}

								//없어?카드가?또?
								//processData,contentType은 반드시 false여야 전송됨
								$
										.ajax({
											url : '/uploadAjaxAction',
											processData : false,
											contentType : false,
											data : formData,
											type : 'POST',
											dataType : 'json',
											async : false,
											success : function(result) {

												var data = JSON
														.stringify(result);
												console
														.log("result1 : "
																+ data);
												console.log(typeof 'data');
												var data2 = JSON.parse(data);
												console.log("result2 : "
														+ data2);
												console.log(typeof 'data2');

												var filename = data2[0].fileName;
												var uuid = data2[0].uuid;
												var uploadpath = data2[0].uploadPath;
												var uploadpath2 = uploadpath
														.slice(-28);
												console.log("uploadpath2: "
														+ uploadpath2);

												var itemImg = uploadpath2
														+ "\\s_" + uuid + "-"
														+ filename;
												var itemDetailImg = uploadpath2
														+ "\\" + uuid + "-"
														+ filename;
												console.log("filename: "
														+ filename);
												console.log("uuid: " + uuid);
												console.log("uploadpath: "
														+ uploadpath2);

												$('input[name=itemimg]').attr(
														'value', itemImg);
												$('input[name=itemdetailimg]')
														.attr('value',
																itemDetailImg);

											}
										});

							});
		});
	</script>
</body>
</html>