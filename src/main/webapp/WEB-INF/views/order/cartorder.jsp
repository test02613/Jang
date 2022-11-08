<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/resources/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/common.js" charset="utf-8"></script>
<!-- 주소검색 API(카카오) -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<style>
/* 전체 랩 */
#wrapper {
	width: 1200px;
	margin: auto;
	margin-top: 30px;
}
/* 페이지 상단 타이틀 : "장바구니" */
.subject {
	text-align: center;
	font-weight: bold;
	height: 100px;
	color: #24292F;
	font-size: 40px;
	height: 100px;
} /* 테이블 속성 */
#ordertable {
	height: 100px;
	color: #24292F;
	font-size: 15px;
	width: 1200px;
}
/* 결제,삭제 버튼 */
.cbutton {
	width: 90px;
	height: 45px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
/* 사용 버튼 */
.pointusebutton {
	width: 50px;
	height: 30px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
/* 우편번호 찾기 버튼 */
.inbutton {
	width: 110px;
	height: 30px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
/* 결제하기 버튼 */
.orderbutton {
	width: 160px;
	height: 45px;
	background-color: #24292F;
	font-size: 15px;
	color: white;
	text-align: center;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin-bottom: 20px;
}
/* 중앙정렬 */
.center {
	text-align: center;
}
/* td */
.centerff {
	text-align: center;
	font-size: 17px;
}
/* 오른쪽 정렬 */
.right {
	text-align: right;
}
/* 폰트 사이즈 조정 */
#fontsize {
	font-size: 17px;
}

.fontsize2 {
	font-size: 17px;
	text-align: center;
}
</style>
</head>
<body onload="fn_allPrice()">
	<div id="wrapper">
		<div class="subject">주문서 작성</div>

		<!-- tables -->
		<form name="orderWrite" id="orderWrite" method="post"
			action="cartOrderAction">
			<div class="table-responsive">

				<table class="table table-striped">

					<thead class="table-dark">
						<tr>
							<th class="fontsize2">이미지</th>
							<th class="fontsize2">상품명</th>
							<th class="fontsize2">컬러</th>
							<th class="fontsize2">주문금액</th>
						</tr>
					</thead>
					<c:forEach var="list" items="${list}">
						<tbody>
							<tr>
								<td class="fontsize2"><img src="${list.itemimg}"
									width="100px" height="100px"></td>
								<td class="fontsize2" style="width: 80px;"><a href="">${list.itemname}</a>
									<br></td>
								<td class="fontsize2" style="text-align: center"><input
									type="text" value="${list.itemoption}"
									style="width: 80px; border-radius: 10px; text-align: center; border: none;"
									readonly> <input type="hidden" name="itemcode"
									value="${list.itemcode}"
									style="width: 80px; text-align: center; border: none;" readonly>
								</td>
								<td class="fontsize2" style="text-align: center"><input
									type="text" name="ordercost" value="${list.itemcost}"
									style="width: 100px; text-align: center; border-radius: 10px; border: none;"
									readonly>원</td>
							</tr>

						</tbody>
					</c:forEach>

				</table>
			</div>
			<br> <br>
			<div class="table-responsive">
				<table id="ordertable" class="table table-striped"
					style="width: 1000px">
					<colgroup>
						<col width="11%" />
						<col width="*%" />
						<col width="*%" />
						<col width="*%" />
						<col width="*%" />
					</colgroup>
					<tr>
						<td class="fontsize2">주문금액</td>
						<td style="text-align: left"><input type="text"
							name="ORDER_TOTAL_ORDER_PRICE" id="ORDER_TOTAL_ORDER_PRICE"
							class="fontsize2" value=""
							style="width: 100px; text-align: center; border-radius: 10px; border: none;" readonly>원</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="fontsize2">포인트</td>
						<td colspan="3"><input type="text" name="ORDER_USE_POINT"
							class="fontsize2" id="ORDER_USE_POINT" value="0"
							style="width: 100px; text-align: center; border-radius: 10px; border: none;"
							readonly> P &nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
							class="pointusebutton" value="사용" onclick="fn_price()">
							(포인트 <input type="text" class="fontsize2" name="POINT_TOTAL"
							id="POINT_TOTAL" value="${member.point}"
							style="width: 100px; text-align: center; border-radius: 10px; border: none;"
							readonly> P)</td>
						<!-- 없으면 가격표시 동작 안함 -->
						<td><input type="hidden" id="ORDER_FEE" name="ORDER_FEE"></td>
					</tr>
				</table>
			</div>

			<br> <br>
			<div class="table-responsive">
				<p>
					<b id="fontsize">받으시는분(상품받으실분)</b> &nbsp;
				</p>
				<table class="table table-striped">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<td id="fontsize">이름</td>
							<td style="text-align: left"><input type="hidden" name="id"
								value="${member.id}" style="width: 100px;"> <input
								class="fontsize2" type="text" name="name" id="ORDER_NAME"
								value="${member.name}"
								style="width: 100px; border-radius: 10px; border: none;"></td>
						</tr>
						<tr>
							<td id="fontsize">휴대폰번호</td>
							<td style="text-align: left"><input type="text"
								class="fontsize2" name="mobile" id="ORDER_PHONE"
								value="${member.mobile}"
								style="width: 120px; border-radius: 10px; border: none;"></td>
						</tr>
						<tr>
							<td id="fontsize" rowspan="3">주소</td>
							<td style="text-align: left"><input type="text"
								class="fontsize2" name="postcode" id="ORDER_ZIPCODE"
								value="${member.postcode}"
								style="width: 100px; border-radius: 10px; border: none;">
								<button type="button" id="findAddrBtn" class="inbutton"
									onclick="findAddr()">우편번호 찾기</button></td>
						</tr>
						<tr>
							<td style="text-align: left"><input type="text"
								class="fontsize2" name="address" id="ORDER_ADDR1"
								value="${member.address}"
								style="width: 400px; border-radius: 10px; border: none;"></td>
						</tr>
						<tr>
							<td style="text-align: left"><input type="text"
								class="fontsize2" name="addressdetail" id="ORDER_ADDR2"
								value="${member.addressDetail}"
								style="width: 400px; border-radius: 10px; border: none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br> <br>

			<div class="table-responsive">
				<p>
					<b id="fontsize">결제선택</b>
				</p>
				<table id="ordertable" class="table table-striped">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
						<tr>
							<td class="fontsize2">총 결제금액</td>
							<td style="text-align: left" class="fontsize2"><input
								type="text" name="itemcost" id="ORDER_TOTAL_PAY_PRICE"
								class="fontsize2" value="${item.itemcost }"
								style="width: 100px; border-radius: 10px; border: none;"
								readonly>원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<div style="text-align: center" class="fontsize2">
				<input type="checkbox" name="orderChk" id="orderChk">
				(필수)결제서비스 약관에 동의하며, 원활한 배송을 위한 개인정보 제공에 동의합니다. <br> <br> <input
					type="button" class="orderbutton" name="all_order" value="장바구니"
					onClick="location.href='/cartOrderAction"> <input
					type="submit" class="orderbutton" name="order_pay" value="결제진행"
					onclick="fn_order_pay(); return false;">
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
   //기본 주문금액 계산
   function fn_allPrice() {
      var array1 = document.getElementsByName("ordercost");

      var len = array1.length;
      var hap = 0;
      for (var i = 0; i < len; i++) {
         var sell = array1[i].value;
         var pri = Number(sell);
         hap = Number(hap) + Number(pri); //주문금액 총합 구하기
         
      }
      var fee = document.getElementById("ORDER_FEE").value;
      var pay = Number(hap) + Number(fee);

      document.getElementById("ORDER_TOTAL_ORDER_PRICE").value = hap; //총주문금액 
      document.getElementById("ORDER_TOTAL_PAY_PRICE").value = pay; //(최초,할인들어가기전)최종결제금액
      document.getElementById("pay_price1").value = pay; //결제예정금액(바꿔야됨)

   }
   
   var all_price = document.getElementById("all_price");
   var cost = document.getElementsByName("ordercost").value;
   console.log(cost); 
   
   //포인트 사용
   function fn_price() {
      document.getElementById("ORDER_USE_POINT").value = document.getElementById("ORDER_TOTAL_ORDER_PRICE").value; //상품가격
      document.getElementById("POINT_TOTAL").value = ${member.point}-document.getElementById("ORDER_TOTAL_ORDER_PRICE").value; //포인트-상품가격 차감 금액
      document.getElementById("ORDER_TOTAL_PAY_PRICE").value = document.getElementById("ORDER_USE_POINT").value -document.getElementById("ORDER_TOTAL_ORDER_PRICE").value;//결제할 금액
      
      }

   //주문완료
   function fn_order_pay() {
      var f = document.orderWrite;
      var a = document.getElementById("ORDER_TOTAL_PAY_PRICE").value
      var b = document.getElementById("POINT_TOTAL").value
      if (a > 0) {
         alert("포인트 사용하세요")
      } else {
         $.ajax({
            type : "get",
            url : "/pointUp",
            data : {
               getpoint : b
            },
            async : false,//전역 변수 보내기
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
               /*  alert("에러 발생"+result);  */
            }
         });//아작스 끝
         /* f.submit(); */
         if (window.confirm("구매하시겠습니까?")) {
            location.href = "/order?code="+code;
            }

      }
   }

   //주소 찾기
   function findAddr() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                  // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var roadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 참고 항목 변수

                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                     extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== '' && data.apartment === 'Y') {
                     extraRoadAddr += (extraRoadAddr !== '' ? ', '
                           + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraRoadAddr !== '') {
                     extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('ORDER_ZIPCODE').value = data.zonecode;
                  document.getElementById("ORDER_ADDR1").value = roadAddr
                        + data.jibunAddress;
                  // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                  if (roadAddr !== '') {
                     document.getElementById("ORDER_ADDR2").value = extraRoadAddr;
                  } else {
                     document.getElementById("ORDER_ADDR2").value = '';
                  }
               }
            }).open();
   }
</script>
</html>