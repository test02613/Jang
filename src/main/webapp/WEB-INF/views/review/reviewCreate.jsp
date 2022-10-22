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
<body>
	<center>
		<h1>주문번호 ${order}번의 리뷰</h1>
		<form id="reviewCreate_form" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td><c:if test="${list.reviewnum == null}">
						<input type="hidden" id=ordernum name="ordernum" value="${order}">
						<input type="hidden" name="itemnum" value="${item}"></td>
				</tr>
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input type="text" name="reviewtitle" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="reviewcontent" cols="40"
							rows="10"></textarea></td>
				</tr>
				</c:if>
				<c:if test="${list.reviewnum!=null}">
					<tr>
						<td bgcolor="orange" width="70">제목</td>
						<td align="left"><input type="text" id=ordernum
							name="reviewtitle" value="${list.reviewtitle}" /></td>
					</tr>
					<tr>
						<td bgcolor="orange">내용</td>
						<td align="left"><textarea name="reviewcontent" cols="40"
								rows="10">${list.reviewcontent}</textarea></td>
					</tr>
				</c:if>
			</table>
			<c:if test="${list.reviewnum==null}">
				<input type="button" class="reviewCreate_button" value="등록하기">
			</c:if>
			<c:if test="${list.reviewnum!=null }">
				<input type="button" class="reviewCreate_button" value="수정하기">
			</c:if>
	</center>
	</form>
	<script>
var a = document.getElementById("ordernum").value

$(document).ready(function() {
    // 새글 등록 버튼
    $(".reviewCreate_button").click(function() {
       $("#reviewCreate_form").attr("action", "/reviewCreateAction");
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
$(document).ready(function() {
    // 새글 등록 버튼
    $(".reviewCreate_button").click(function() {
       $("#reviewCreate_form").attr("action", '${path}/reviewUpdateAction?num=${list.reviewnum}');
       $("#reviewCreate_form").submit();

    })
 }) 
</script>
</body>
</html>