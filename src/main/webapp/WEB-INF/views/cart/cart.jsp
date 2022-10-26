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
#list:hover {
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
         <div id="contents">장바구니</div>
         <table class="table">
            <!-- 게시판 상단 메뉴 -->
            <thead class="table-dark">
               <tr>
                  <th scope="col" class="col-2" id="title">상품</th>
                  <th scope="col" class="col-2" id="title">가격</th>
 
               </tr>
            </thead>
            <!-- 게시글 목록 -->
            <tbody>
               <%--<c:forEach var="변수이름" items="반복할 객체명" begin="시작값" end="마지막값" step="증가값" varStatus="Status">--%>
               <c:forEach items="${cartlist}" var="cartlist" varStatus="Status">
                  <tr onClick="location.href='${path}/itemDetail?num=${item.itemcode}'"  style="cursor:pointer;" id="list">
                      <td id="center"><img src='' width="70px" height="70px"><c:out value="${item.itemname}" /></td>
                      <td id="center"><c:out value="${item.itemcost}" />원</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
         
			<div id="button">
	<a href="/#"><button>구매하기</button></a>
	</div>

   </div>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"></script>
</body>
</html>