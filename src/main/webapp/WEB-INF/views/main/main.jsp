<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> --%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>APLUS MALL</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
/* 이미지 모서리 둥글게 */
#slideradius {
	border-radius: 10px;
}
</style>

</head>

<body>
	<div class="wrapper">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>
		<script>
			$('.carousel').carousel({
				interval : 4000
			//기본 4초
			})
		</script>


		<div id="image_slide_wrapper">
			<div class="carousel slide" data-ride="carousel">
				<div id="demo" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<!-- 슬라이드 쇼 -->
						<div class="carousel-item active">
							<!--가로-->
							<a href="/eventDetail?num=14"> <img id="slideradius"
								class="d-block w-100"
								src="../resources/img/slide3.png?auto=compress&cs=tinysrgb&h=650&w=940"
								alt="First slide"></a>
							<div class="carousel-caption d-none d-md-block"></div>
						</div>
						<div class="carousel-item">
							<a href="/eventDetail?num=14"> <img id="slideradius"
								class="d-block w-100"
								src="../resources/img/slide2.png?auto=compress&cs=tinysrgb&h=650&w=940"
								alt="Second slide"></a>
						</div>
						<div class="carousel-item">
							<a href="/eventDetail?num=14"> <img id="slideradius"
								class="d-block w-100"
								src="../resources/img/slide.png?auto=compress&cs=tinysrgb&h=650&w=940"
								alt="Third slide"></a>
						</div>
						<!-- / 슬라이드 쇼 끝 -->

						<!-- 왼쪽 오른쪽 화살표 버튼 -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<!-- <span>Previous</span> -->
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<!-- <span>Next</span> -->
						</a>
						<!-- / 화살표 버튼 끝 -->

						<!-- 인디케이터 -->
						<ul class="carousel-indicators">
							<!--0번부터시작-->
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 인디케이터 끝 -->
		<!-- 이미지 슬라이드 끝 -->

		<!-- 상품 바로가기 이미지 -->
		<div id="boot_imgradius2">
			<div id="image_click_mainwrapper">
				<a href="http://localhost:8181/itemListL?cat=1"> <img
					class="bd-placeholder-img rounded float-end" width="460"
					height="340" src="../resources/img/banner2.png" role="img" />
				</a> <a href="http://localhost:8181/itemListL?cat=2"> <img
					class="bd-placeholder-img rounded float-end" width="460"
					height="340" src="../resources/img/banner.png" role="img" />
				</a> <a href="http://localhost:8181/itemListL?cat=6"> <img
					class="bd-placeholder-img rounded float-end" width="460"
					height="340" src="../resources/img/banner3.png" role="img" />
				</a>

			</div>
		</div>
		<!-- 상품 바로가기 이미지 끝 -->

	</div>
</body>
</html>