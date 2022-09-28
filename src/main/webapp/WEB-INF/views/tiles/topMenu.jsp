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
						<li><c:if test="${name != null}">
								<a href="/logout">${name} 님</a><!--controller 함수name -->
							</c:if> <c:if test="${name == null}">
								<a href="/login">로그인</a>
							</c:if></li>
						<li><c:if test="${name != null}">
								<a href="/logout">로그아웃</a>
							</c:if> <c:if test="${name == null}">
								<a href="/join">회원가입</a>
							</c:if></li>
						<li><c:if test="${name != null}">
								<a href="#">마이페이지</a>
							</c:if> <c:if test="${name == null}">
								<a href="/login">마이페이지</a>
							</c:if></li>
						<li><c:if test="${name != null}">
								<a href="#">장바구니</a>
							</c:if> <c:if test="${name == null}">
								<a href="/login">장바구니</a>
							</c:if></li>
					</ul>
				</div>
			</div>
			
			

		</div>
	</div>
</body>
</html>