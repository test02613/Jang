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
<body>
	<form id="item_regist_form" method="post">
		<div class="wrap">
			<h3>상품등록정보</h3>

			<div class="boardWrite">
				<table border="1" summary="">

					<tbody>
						<tr>
							<th scope="row">상품번호</th>
							<td><input id="itemnum" name="itemnum" class="inputTypeText"
								value="" type="text" />
						</tr>
						<tr>
							<th scope="row">상품명</th>
							<td><input id="itemname" name="itemname"
								class="inputTypeText" value="" type="text" />
						</tr>
						<tr id="category">
							<th>카테고리1</th>
							<td><select id="itemcategory" name="itemcat1">
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
							<th>카테고리2</th>
							<td><select id="itemcategory" name="itemcat2">
									<option value="" selected="selected">카테고리를 선택 해주세요.</option>
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
							<th scope="row" class="uploadDiv">썸네일 이미지 업로드</th>
							<td><input type="file" id="input_img" name="uploadFile"
								style="height: 30px;" multiple />

								<button type="button" id="uploadBtn">Upload</button>
								<div class="img_wrap"></div></td>
						</tr>
						<tr>
							<th scope="row">썸네일 이미지 등록</th>
							<td><input type="text" id="itemImg" name="itemimg"
								style="height: 30px;" value="" readonly></td>
						<tr>
							<th scope="row">상세 이미지 등록</th>
							<td><input type="text" id="itemDetailImg"
								name="itemdetailimg" style="height: 30px;" value="" readonly></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="regist_button_wrap">
				<input type="button" class="regist_button" value="상품 등록하기">
			</div>
		</div>
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			// 상품등록 버튼
			$(".regist_button").click(function() {
				$("#item_regist_form").attr("action", "/itemInsertAction");
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

												/* var a = "C:\Users\hss61\Desktop\Java\works\teamproject\APLUS_Mall\src\main\webapp\resources\itemImg";
												var b = "/resources/itemImg";
												a = b; */

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