<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 중앙정렬 */
.center {
	text-align: center;
}
/* 검색버튼 */
.right {
	margin-left: 600px;
	text-align: right;
	align-content: right;
}
/* 검색버튼 */
.searchbutton {
	width: 90px;
	height: 45px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
</style>
<body>
	<div class="wrapper">
		<div id="header_wrap">

			<div id="top_menu_area">

				<div id="top_menu_left">
					<ul>
						<li><a
							href="https://map.naver.com/v5/search/%EB%8D%94%EC%A1%B0%EC%9D%80%EC%BB%B4%ED%93%A8%ED%84%B0%ED%95%99%EC%9B%90/place/38506774?c=14140460.0143748,4508287.6229117,15,0,0,0,dh&placePath=%3Fentry%253Dbmp">매장안내</a></li>
						<li><a href="/event">이벤트</a></li>
					</ul>
				</div>
				<div id="top_menu_right">
					<ul>
						<li><c:choose>
								<c:when test="${admin eq 0}">${name} 님</c:when>
								<c:when test="${admin eq 1}">관리자</c:when>
							</c:choose> <%-- <p>${name} 님</p><!--controller 함수name --> --%> <%-- <c:if test="${name != "1"}">
								<a href="/logout">${name} 님</a> --%> <c:if
								test="${name == null}">
								<a href="/login">로그인</a>
							</c:if></li>
						<li><c:if test="${name != null}">
								<a href="/logout">로그아웃</a>
							</c:if> <c:if test="${name == null}">
								<a href="/join">회원가입</a>
							</c:if></li>
						<li><c:choose>
								<c:when test="${admin eq 0}">
									<a href="/mymain">마이페이지</a>
								</c:when>
								<c:when test="${admin eq 1}">
									<a href="/adminMain">관리자페이지</a>
								</c:when>
							</c:choose> <c:if test="${name == null}">
								<a href="/login">마이페이지</a>
							</c:if></li>
						<li><c:if test="${name != null}">
								<a href="/cart">장바구니</a>
							</c:if> <c:if test="${name == null}">
								<a href="/cart">장바구니</a>
							</c:if></li>
					</ul>
				</div>
			</div>
			<div id="logo_area">
				<div id="logo">
					<a href="main"> <img width="310" height="110" class="center"
						src="../resources/img/apluslogo.png" />
					</a>
				</div>
			</div>
				<form action="${ pageContext.servletContext.contextPath }/"
					method="post" style="display: flex; width: 350px;">
					<input class="right" id="search" name="searchValue"
						type="search" placeholder="상품 이름 검색" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
		</div>
	</div>
</body>
</html>