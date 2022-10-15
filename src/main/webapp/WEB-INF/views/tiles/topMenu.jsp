<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div id="header_wrap">

			<div id="top_menu_area">

				<div id="top_menu_left">
					<ul>

						<li><a href="#">매장안내</a></li>
						<li><a href="/event">이벤트</a></li>

					</ul>
				</div>
				<div id="top_menu_right">
					<ul>
						<li><c:choose>
								<c:when test="${admin eq 0}">${name} 님</c:when>
								<c:when test="${admin eq 1}">관리자</c:when>
							</c:choose> <%-- <p>${name} 님</p><!--controller 함수name --> --%> <%-- <c:if test="${name != "1"}">
								<a href="/logout">${name} 님</a> --%> 
								<c:if test="${name == null}">
								<a href="/login">로그인</a>
							</c:if></li>
						<li><c:if test="${name != null}">
								<a href="/logout">로그아웃</a>
							</c:if> <c:if test="${name == null}">
								<a href="/join">회원가입</a>
							</c:if></li>
						<li><c:choose>
								<c:when test="${admin eq 0}">
									<a href="#">마이페이지</a>
								</c:when>
								<c:when test="${admin eq 1}">
									<a href="#">관리자페이지</a>
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
					<a href="main">
					<img src="../resources/img/logo.png" />
					</a>
				</div>
			</div>

		</div>
	</div>
</body>
</html>