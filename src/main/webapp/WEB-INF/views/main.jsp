<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>APLUS MALL</title>
<link rel="stylesheet" href="resources/css/main.css">
<script>

</script>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="wrapper">
	<!-- 내용 -->
		<div class="content_area">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="true">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="..." class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="..." class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="..." class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!-- 푸터 -->
	<div class="footer_area">
		<h1>footer area</h1>
	</div>
</div>
</body>
</html>