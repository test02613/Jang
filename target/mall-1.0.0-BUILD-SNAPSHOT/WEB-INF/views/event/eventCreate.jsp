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
<body>

	<center>
		<h1>${detail.eventnum}</h1>
		<a href="/logout">Log-out</a>
		<hr>
		<form id="eventCreate_form" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<!-- <tr>
               <td bgcolor="orange">글번호</td>
               <td align="left"><input type="number" name="eventnum" /></td>
            </tr> -->
				<c:if test="${detail.eventnum == null}">
					<tr>
						<td bgcolor="orange" width="70">제목</td>
						<td align="left"><input type="text" name="eventtitle" /></td>
					</tr>
					<tr>
						<td bgcolor="orange">내용</td>
						<td align="left"><textarea name="eventcontent" cols="40"
								rows="10"></textarea></td>
					</tr>
				</c:if>
				<c:if test="${detail.eventnum != null}">
					<tr>
						<td bgcolor="orange" width="70">제목</td>
						<td align="left"><input type="text" name="eventtitle"
							value="${detail.eventtitle}" /></td>
					</tr>
					<tr>
						<td bgcolor="orange">내용</td>
						<td align="left"><textarea name="eventcontent" cols="40"
								rows="10">${detail.eventcontent}</textarea></td>
					</tr>
				</c:if>
			</table>
			<c:if test="${detail.eventnum == null}">
				<input type="button" class="eventCreate_button" value="등록하기">
			</c:if>
			<c:if test="${detail.eventnum != null}">
				<input type="button" class="eventUpdate_button" value="수정하기">
			</c:if>
		</form>
		<hr>
		<a href="/event">글 목록 가기</a>
	</center>
	<script>
 $(document).ready(function() {
         // 새글 등록 버튼
         $(".eventCreate_button").click(function() {
            $("#eventCreate_form").attr("action", "/eventCreateAction");
            $("#eventCreate_form").submit();

         })
      })
      
 $(document).ready(function() {
         // 수정 버튼
         $(".eventUpdate_button").click(function() {
            $("#eventCreate_form").attr("action", "/eventUpdateAction?num=${detail.eventnum}");
            $("#eventCreate_form").submit();

         })
      })
</script>
</body>
</html>