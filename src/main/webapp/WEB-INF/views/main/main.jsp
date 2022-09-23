<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>APLUS MALL</title>
<link rel="stylesheet" href="resources/css/main2.css">

</head>
<script>
var slideIndex = 0; //slide index

//HTML 로드가 끝난 후 동작
window.onload=function(){
showSlides(slideIndex);

// Auto Move Slide
var sec = 3000;
setInterval(function(){
 slideIndex++;
 showSlides(slideIndex);

}, sec);
}


//Next/previous controls
function moveSlides(n) {
slideIndex = slideIndex + n
showSlides(slideIndex);
}

//Thumbnail image controls
function currentSlide(n) {
slideIndex = n;
showSlides(slideIndex);
}

function showSlides(n) {

var slides = document.getElementsByClassName("mySlides");
var dots = document.getElementsByClassName("dot");
var size = slides.length;

if ((n+1) > size) {
 slideIndex = 0; n = 0;
}else if (n < 0) {
 slideIndex = (size-1);
 n = (size-1);
}

for (i = 0; i < slides.length; i++) {
   slides[i].style.display = "none";
}
for (i = 0; i < dots.length; i++) {
   dots[i].className = dots[i].className.replace(" active", "");
}

slides[n].style.display = "block";
dots[n].className += " active";
}
	
</script>
<body>

	<div class="wrapper">
		<div class="slideshow-container">

      <!-- Full-width images with number and caption text -->
      <div class="mySlides fade">
        <div class="numbertext">1 / 6</div>
        <img src="../resources/img/twitter.png" width="100%"height="200px">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">2 / 6</div>
        <img src="../resources/img/face.png" width="100%"height="200px">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">3 / 6</div>
        <img src="../resources/img/logo.png" width="100%"height="200px">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">4 / 6</div>
        <img src="../resources/img/logo1.png" width="100%"height="200px">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">5 / 6</div>
        <img src="../resources/img/insta.png" width="100%"height="200px">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">6 / 6</div>
        <img src="../resources/img/twitter.png" width="100%"height="200px">
        <div class="text">ACNE STUDIO</div>
      </div>

      <!-- Next and previous buttons -->
      <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
      <a class="next" onclick="moveSlides(1)">&#10095;</a>
    </div>
    <br/>

    <!-- The dots/circles -->
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(0)"></span>
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
      <span class="dot" onclick="currentSlide(4)"></span>
      <span class="dot" onclick="currentSlide(5)"></span>
    </div>
	</div>
</body>
</html>