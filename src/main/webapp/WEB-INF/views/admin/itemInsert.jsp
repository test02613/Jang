<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- c태그 사용 -->
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
<title>새글등록</title>
</head>
<body>
      <form id="itemInsert_form" method="post">
	      itemnum<input type="text" name="itemnum" /><br>
	      itemname<input type="text" name="itemname" /><br>
	      itemcat2<input type="text" name="itemcat2" /><br>
	      itemcat1<input type="text" name="itemcat1" />	<br><br>
	        <input type="button" class="itemInsert_button" value="상품 등록 버튼">
      </form>
      <!-- <form id="eventCreate_form" method="post">
	      itemnum<input type="text" name="itemnum" /><br>
	      itemcode<input type="text" name="itemcode" /><br>
	      itemcost<input type="text" name="itemcost" /><br>
	      itemstock<input type="text" name="itemstock" /><br>
	      itemname<input type="text" name="itemname" /><br>
	      itemcolor<input type="text" name="itemcolor" /><br>
	      itemgb<input type="text" name="itemgb" />
  <input type="button" class="itemattrInsert_button" value="상품상세 등록 버튼">
	</form>	 -->
<script>
 $(document).ready(function() {
         // 상품 등록 버튼
         $(".itemInsert_button").click(function() {
            $("#itemInsert_form").attr("action", "/itemInsertAction");
            $("#itemInsert_form").submit();

         })
      })
  /* $(document).ready(function() {
         // 상품상세 등록 버튼
         $(".itemattrInsert_button").click(function() {
            $("#itemInsert_form").attr("action", "itemattrInsertAction");
            $("#itemInsert_form").submit();

         })
      })  */
</script>
</body>
</html>