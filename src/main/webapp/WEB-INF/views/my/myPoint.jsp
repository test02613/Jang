<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<body>
<form id="update" method="post">
<table>
 				<tr>
					<td >충전 액수</td>
					<td align="left"><input type="text" name="point" />잔여 포인트 : ${member.point}</td>
				</tr>
				
</table>
				 <input type="button" class="update_button" value="충전">
				
</form>
<script>
$(document).ready(function() {
        
         $(".update_button").click(function() {
            $("#update").attr("action", "/mypointUpdateAction");
            $("#update").submit();

         })
      })
</script>
</body>
</html>