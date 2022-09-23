<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>APLUS MALL</title>
<!-- <link rel="stylesheet" href="resources/css/main.css"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" 
crossorigin="anonymous">
</head>
<body>
   <div class="wrapper">

      <!-- 슬라이드 이미지 -->
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
               <img src="https://www.apple.com/v/iphone-14/a/images/overview/hero/hero_iphone_14_logo__dsjqlhotvrma_large.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
               <img src="https://www.apple.com/v/iphone-14/a/images/overview/hero/hero_iphone_14_logo__dsjqlhotvrma_large.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
               <img src="https://www.apple.com/v/iphone-14/a/images/overview/hero/hero_iphone_14_logo__dsjqlhotvrma_large.png" class="d-block w-100" alt="...">
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
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>