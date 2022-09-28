<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="resources/css/header.css"> -->
</head>
<body>
	<div class="wrapper">
		<div id="header_wrap">

			<div id="top_menu_area">

				<div id="top_menu_left">
					<ul>
						<li><a href="/main">홈</a></li>
						
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
								<a href="/join">마이페이지</a>
							</c:if> <c:if test="${name == null}">
								<a href="#">마이페이지</a>
							</c:if></li>
						<li><c:if test="${name != null}">
								<a href="/join">장바구니</a>
							</c:if> <c:if test="${name == null}">
								<a href="#">장바구니</a>
							</c:if></li>
					</ul>
					<%-- <c:set var="memberId" value="${SESSION_NO }" />
			<c:choose>
				<c:when test="${memberId eq null}">
					<td><a href="/login">로그인</a></td> <td> | </td>
					<td><a href="/join">회원가입</a></td> <td> | </td>
					<td><a href="/stu/loginForm.do">마이페이지</a></td> <td> | </td>
					<td><a href="/stu/event/list.do">이벤트</a></td> <td> | </td>
				</c:when>
				<c:otherwise>
					<td>Hi, ${SESSION_NAME }님!</td> <td> | </td>
					<td><a href="#" onClick="/logout">로그아웃</a></td> <td> | </td>
					<td><a href="/stu/myOrderList.do">마이페이지</a></td> <td> | </td>
					<td><a href="/stu/basket/basketList.do">장바구니</a></td> <td> | </td>
					<td><a href="/stu/event/list.do">이벤트</a></td> <td> | </td>
				</c:otherwise>
			</c:choose> --%>
				</div>
			</div>
			<div id="logo_area">
				<div id="logo">
				</div>
					<img src="../resources/img/logo.png" />
			</div>
			<div id="nav">
				<ul>
					<li id="dropdown">
						<div id="dropdown-menu">Mac</div>
						<div id="dropdown-content">
							<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
						</div>
					</li>
					<li id="dropdown">
						<div id="dropdown-menu">iPad</div>
						<div id="dropdown-content">
							<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
						</div>
					</li>
					<li id="dropdown">
						<div id="dropdown-menu">iPhone</div>
						<div id="dropdown-content">
							<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
						</div>
					</li>
					<li id="dropdown">
						<div id="dropdown-menu">Watch</div>
						<div id="dropdown-content">
							<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
						</div>
					</li>
					<li id="dropdown">
						<div id="dropdown-menu">AirPod</div>
						<div id="dropdown-content">
							<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
						</div>
					</li>
					<li id="dropdown">
						<div id="dropdown-menu">Accsessory</div>
						<div id="dropdown-content">
							<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
						</div>
					</li>
					<li id="dropdown">
						<div id="event"><a href="/event">이벤트</a></div>
						
					</li>
					
				</ul>
			</div>


		</div>
	</div>
</body>
</html>