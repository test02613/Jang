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
	<form name=mypointUpdate id="mypointUpdate" method="post"
		action="mypointUpdateAction">
		보유 포인트 : ${member.point}
		<input type="text" name="point" value="${member.point}"
			style="width: 100px;"> <input type="submit" name="order_pay"
			value="결제진행" onclick="fn_order_pay(); return false;">
	</form>
	<script>

		//주문완료, 회원 포인트 차감
		function fn_order_pay() {
			var f = document.mypointUpdate;
			var a = document.getElementById("ORDER_TOTAL_PAY_PRICE").value
			var b = document.getElementById("POINT_TOTAL").value
			if {
				$.ajax({
					type : "get",
					url : "/mypointUp",
					data : {
						getpoint : b
					},
					async : false, //전역 변수 보내기
					dataType : "json",
					success : function(result) {
						code = result;

						/* console.log("확인 : " + result); */
						if (result) {
							/*  alert("완료"+code);  
							return code; */
						} else {
							/* alert("전송된 값 없음"+result);   */
						}
					},
					error : function() {
						/*  alert("에러 발생"+result);  */
					}

				});//아작스 끝
				f.submit();
			}
		}
		
	</script>
</body>
</html>