<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
<style>

#wrapper {
   width: 1000px;
   margin: auto;
   margin-top: 30px;
   border-radius : 10px ;
}
#title{
text-align:center;
align-content: center;
}
td:hover{
text-decoration: underline;

}

h1{
text-align:center;
}
#button{
text-align:center;
}
</style>
</head>
<body>

<form id="itemselect" method="post">
   <!-- 게시판 부트스트랩 -->
   <div class="wrapper">
      <div id="wrapper">
      <h1>주문관리</h1>
      <select name="order_num" id="order_num" class='order_num' style="width: 200px; height: 30px;">
                     <option value="">== 주문 번호 ==</option>
                     <c:forEach items="${orderlist}" var="orderlist">
                     <option value="${orderlist.ordernum}">${orderlist.ordernum}</option>
                     </c:forEach>
            </select>
            <select name="order_state" id="order_state"
                     class='order_state' style="width: 200px; height: 30px;">
                        <option value="">== 주문 상태 변경 ==</option>
                              <option value="결제 완료">결제 완료</option>
                              <option value="배송중">배송중</option>
                              <option value="배송완료">배송완료</option>

                  </select>
                  <button id = "change" class ="change" >변경</button>
         <table class="table" >
            <thead class="table-dark">
               <tr >
                  <th id="title" width="100" scope="col">주문 번호</th>
                  <th id="title"   scope="col">상품명/옵션명</th>
                  <th id="title" width="100"scope="col">아이디</th>
                  <th id="title" width="100"scope="col">이름</th>
                  <th id="title" width="100"scope="col">주문 상태</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${orderlist}" var="orderlist">
                  <tr onClick="location.href='/orderAdmin?num=${orderlist.ordernum}'"style="cursor:pointer;">
                     <td id="title"  style="text-decoration: none;">${orderlist.ordernum}</td>
                     <td  ><c:out   value="${orderlist.itemattrvo.itemname}/${orderlist.itemattrvo.itemcolor}" /></td>
                     <td style="text-decoration: none;"><c:out  value="${orderlist.id}" /></td>
                     <td style="text-decoration: none;"><c:out   value="${orderlist.name}" /></td>
                     <td style="text-decoration: none;"><c:out   value="${orderlist.state}" /></td>
                  </tr>
               </c:forEach>
               
               
            </tbody>
         </table>
         </div>
      </div>
      </form>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"></script>
      
</body>
 <script type="text/javascript">
$(document).ready(function() {order_num
$("#change").on("click", function() { // 구매 버튼
   $.ajax({
      type : "post",
      url : "/state_selcted",
      data : {state:$("#order_state option:selected").val(),
            num:$("#order_num option:selected").val()},
      dataType : "json",
      success : function(result) {
         var a = result;
         if (result) {
            /* alert("완료"+a);  */
         } else {
              /* alert("전송된 값 없음"+result);   */
         }
      },
      error : function() {
          /* alert("에러 발생"+result);  */
      }

   });//아작스 끝
   
});
})
</script> 
</html>
