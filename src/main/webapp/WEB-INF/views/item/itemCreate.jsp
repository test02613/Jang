<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <form id="itemCreate_form" method="post">
<!-- <div class="inputArea">   
   <label>1차 분류</label>
   <select class="category1">
    <option value="">전체</option>
   </select>

   <label>2차 분류</label>
   <select class="category2" name="cateCode">
    <option value="">전체</option>
   </select>
</div> -->
<div class="inputArea">
   <label for="itemnum">상품번호</label>
   <input type="text" id="itemnum" name="itemnum" />
</div>
<div class="inputArea">
   <label for="itemcode">상품코드</label>
   <input type="text" id="itemcode" name="itemcode" />
</div>
<div class="inputArea">
   <label for="itemcost">상품가격</label>
   <input type="text" id="itemcost" name="itemcost" />
</div>
<div class="inputArea">
   <label for="itemstock">상품수량</label>
   <input type="text" id="itemstock" name="itemstock" />
</div>
<div class="inputArea">
   <label for="itemname">상품명</label>
   <input type="text" id="itemname" name="itemname" />
</div>


<div class="inputArea">
   <label for="itemcolor">상품컬러</label>
   <textarea rows="5" cols="50" id="itemcolor" name="itemcolor"></textarea>
</div>

<div class="inputArea">
   <label for="itemgb">메모리</label>
   <textarea rows="5" cols="50" id="itemgb" name="itemgb"></textarea>
</div>

 <button type="button" class="itemCreate_button" value="등록하기">등록하기</button>
</form>

<script>
 $(document).ready(function() {
         // 등록 버튼
         $(".itemCreate_button").click(function() {
            $("#itemCreate_form").attr("action", "/itemCreateAction");
            $("#itemCreate_form").submit();

         })
      })
</script>
</body>
</html>