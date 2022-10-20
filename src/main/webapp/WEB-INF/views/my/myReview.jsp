<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event.jsp</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
   crossorigin="anonymous">

<style>
#wrapper {
   width: 1000px;
   margin: auto;
   margin-top: 30px;
}

/* 이벤트 타이틀 */
#contents {
   height : 100px;
   color : #24292F;
   font-size : 40px;
   margin-top : 20px;
   text-align: center;
}

/* 게시판 상단 타이틀 */
#title {
   text-align: center;
   align-content: center;
}

/* 목록에 마우스 가져다대면 회색으로 처리함 */
#myreview:hover {
   background-color : lightgray;
}
/* 게시글번호, 작성일자 가운데정렬 */
#center{
   text-align: center;
}

button {
   text-align: center;
   align-content: left;
}


</style>
</head>
<body>
   <!-- 게시판 부트스트랩 -->
   <div class="wrapper">
      <div id="wrapper"><!-- wrapper를 클래스랑 아이디 다 쓰는 이유는 무엇? -->
         <div id="contents">리뷰 관리</div>
         <table class="table">
            <!-- 게시판 상단 메뉴 -->
            <thead class="table-dark">
               <tr>
                  <th scope="col" class="col-2" id="title">번호</th>
                  <th scope="col" class="col-7" id="title">제목</th>
                  <th scope="col" class="col-3" id="title">작성일</th>
               </tr>
            </thead>
            <!-- 게시글 목록 -->
            <tbody>
               <%--<c:forEach var="변수이름" items="반복할 객체명" begin="시작값" end="마지막값" step="증가값" varStatus="Status">--%>
               <c:forEach items="${myreview}" var="myreview" varStatus="Status">
                  <tr onClick="location.href='${path}/eventDetail?num=${myreview.reviewnum}'"  style="cursor:pointer;" id="myreview">
                     <td id="center"><c:out value="${myreview.reviewnum}" /></td>
                     <td><c:out value="${myreview.reviewtitle}" /></td>
                     <td id="center"><c:out value="${myreview.reviewdate}" /></td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
         <!-- 글쓰기 버튼 -->
			<div id="button">
	<a href="/reviewCreate"><button>글쓰기</button></a>
	</div>
   </div>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"></script>
    
</body>
</html>