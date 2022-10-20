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

<style>
a {
	text-decoration: none;
	color: #666;
	text-decoration: none
}

h1 {
	text-align: center;
	padding: 50px 0;
	font-weight: normal;
	font-size: 2em;
	letter-spacing: 10px;
}
</style>

<script type="text/javascript">

//기본 주문금액 계산
function fn_allPrice(){
   
   var array1 = document.getElementsByName("goods_sell_price");
   var array2 = document.getElementsByName("basket_goods_amount");
   var array3 = document.getElementsByName("ORDER_DETAIL_PRICE");
   var array4 = document.getElementsByName("ORDER_DISCOUNT_APPLY");
   
   var len = array2.length;
   var hap = 0;
   for (var i=0; i<len; i++){
      var sell = array1[i].value;
      var amt = array2[i].value;
      var pri = Number(sell)*Number(amt); //각 상품별 주문금액
      hap = Number(hap)+Number(pri); //주문금액 총합 구하기
      array3[i].value = pri;   
      array4[i].value = pri;   
   }
   var fee = document.getElementById("ORDER_FEE").value;
   pay = Number(hap)+Number(fee);
   
   document.getElementById("ORDER_TOTAL_ORDER_PRICE").value = hap; //총주문금액
   document.getElementById("ORDER_TOTAL_PAY_PRICE").value = pay; //(최초,할인들어가기전)최종결제금액
   document.getElementById("pay_price1").value = pay; //결제예정금액(바꿔야됨)
   
   var array7 = document.getElementsByName("member_grade");
   var grade = array7[0].value;
   var val = 0;
   if("NOMAL" == grade){
      val=0.03;
   }else if("GOLD" == grade){
      val=0.05;
   }else{
      val=0.1;
   }
   var point = Number(hap)*Number(val); //등급별 적립율
   document.getElementById("ORDER_SAVE_POINT").value = point; //할인과 상관없이 주문금액별 적립
}

//주문자정보와 동일
function fn_chkinfo(){
   var chk = document.getElementById("chkinfo").checked;
   if(chk==true){
      document.getElementById("ORDER_NAME").value = "${map.MEMBER_NAME}";
      document.getElementById("ORDER_PHONE").value = "${map.MEMBER_PHONE}";
      document.getElementById("ORDER_ZIPCODE").value = "${map.MEMBER_ZIPCODE}";
      document.getElementById("ORDER_ADDR1").value = "${map.MEMBER_ADDR1}";
      document.getElementById("ORDER_ADDR2").value = "${map.MEMBER_ADDR2}";
   }else if(chk==false){
      document.getElementById("ORDER_NAME").value = "";
      document.getElementById("ORDER_PHONE").value = "";
      document.getElementById("ORDER_ZIPCODE").value = "";
      document.getElementById("ORDER_ADDR1").value = "";
      document.getElementById("ORDER_ADDR2").value = "";
   }
}

//쿠폰, 포인트 사용
function fn_price(){ 
   document.getElementById("ORDER_USE_POINT").value = "${item.itemcost}"; //상품가격
   document.getElementById("POINT_TOTAL").value = ${member.point}-${item.itemcost}; //포인트-상품가격 차감 금액
   document.getElementById("ORDER_TOTAL_PAY_PRICE").value = document.getElementById("ORDER_USE_POINT").value-${item.itemcost};//결제할 금액
}

//주문완료, 회원 포인트 차감
function fn_order_pay(){
   var f = document.orderWrite;
   var a=document.getElementById("ORDER_TOTAL_PAY_PRICE").value
   var b = document.getElementById("POINT_TOTAL").value		
   if(a>0){
      alert("포인트 사용하세요")
   } else {
	   $.ajax({
		 	type : "get",
		 	url : "/pointUp",
		 	data : {getpoint : b},
		 	async : false, //전역 변수 보내기
		 	dataType : "json",
		 	success : function(result){
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

//주소 찾기
function findAddr() {
   new daum.Postcode( {
      oncomplete : function(data) {
         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
         // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var roadAddr = data.roadAddress; // 도로명 주소 변수
         var extraRoadAddr = ''; // 참고 항목 변수

         // 법정동명이 있을 경우 추가한다. (법정리는 제외)
         // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
         if (data.bname !== ''
               && /[동|로|가]$/g.test(data.bname)) {
            extraRoadAddr += data.bname;
         }
         // 건물명이 있고, 공동주택일 경우 추가한다.
         if (data.buildingName !== ''
               && data.apartment === 'Y') {
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


</head>

<body onload="fn_allPrice()">
	<div class="container">

		<div
			style="width: 1140px; height: 50px; margin: 10px; padding: 12px; border: 1px solid #dcdcdc">
			<table>
				<tr>
					<td style="text-align: center; font-size: 17px; font-weight: bold;">주문작성/결제</td>
				</tr>
			</table>
		</div>

		<!-- tables -->
		<form id="commonForm" name="commonForm"></form>
		<form name="orderWrite" id="orderWrite" method="post"
			action="/orderAction">
			<%-- <!-- goods정보 -->
         <input type="hidden" name="list" value="${list }">
         <!-- coupon정보 -->
         <input type="hidden" name="list2" value="${list2 }">
         <!-- member정보 -->
         <input type="hidden" name="map" value="${map }"> --%>
			<div class="table-responsive">
				<p>
					<b>주문작성/결제</b>
				</p>
				<table class="table table-striped">
					<colgroup>
						<col width="20" />
						<col width="*" />
						<col width="10%" />
						<col width="13%" />
						<col width="13%" />
					</colgroup>
					<thead>
						<tr>
							<th colspan="2" style="text-align: center">상품명/옵션</th>
							<th style="text-align: center">주문금액</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td><img src='' width="70px" height="70px"></td>
							<td><a href="">${item.itemname}</a> <br></td>
							<td style="text-align: center"><input type="text"
								value="${item.itemcolor}"
								style="width: 60px; text-align: right; border: none;" readonly>
								<input type="hidden" name="itemcode" value="${item.itemcode}"
								style="width: 60px; text-align: right; border: none;" readonly>
							</td>
							<td style="text-align: center"><input type="text"
								name="ordercost" value="${item.itemcost}"
								style="width: 60px; text-align: right; border: none;" readonly>원
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<br>

			<div class="table-responsive">
				<table class="table table-striped" style="width: 1140px">
					<colgroup>
						<col width="11%" />
						<col width="22%" />
						<col width="11%" />
						<col width="22%" />
						<col width="12%" />
						<col width="22%" />
					</colgroup>
					<tr>
						<td>주문금액</td>
						<td style="text-align: right"><input type="text"
							name="ORDER_TOTAL_ORDER_PRICE" value="${item.itemcost}"
							style="width: 100px; text-align: right; border: none;" readonly>원
						</td>
					</tr>
					<tr rowspan="3">
						<td></td>
						<td></td>
					</tr>
					<tr rowspan="3">
						<td>포인트</td>
						<td colspan="3"><input type="text" name="ORDER_USE_POINT"
							id="ORDER_USE_POINT" value="0"
							style="width: 100px; text-align: right" readonly> P
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="사용"
							onclick="fn_price()"> (포인트 <input type="text"
							name="POINT_TOTAL" id="POINT_TOTAL" value="${member.point}"
							style="width: 100px; text-align: right; border: none;" readonly>
							P)</td>
					</tr>
					<tr rowspan="3">
						<td>선결제배송비</td>
						<td colspan="3"><input type="text" id="ORDER_FEE"
							name="ORDER_FEE" value="3000"
							style="width: 100px; text-align: right; border: none;" readonly>원
						</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>

			<br>
			<br>
			<div class="table-responsive">
				<p>
					<b>받으시는분(상품받으실분)</b> &nbsp;
				</p>
				<table class="table table-striped">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<td>이름</td>
							<td style="text-align: left"><input type="text" name="name"
								id="ORDER_NAME" value="${member.name}" style="width: 100px;">
							</td>
						</tr>
						<tr>
							<td>휴대폰번호</td>
							<td style="text-align: left"><input type="text"
								name="mobile" id="ORDER_PHONE" value="${member.mobile}"
								style="width: 120px;"></td>
						</tr>
						<tr>
							<td rowspan="3">주소</td>
							<td style="text-align: left"><input type="text"
								name="postcode" id="ORDER_ZIPCODE" value="${member.postcode}"
								style="width: 80px;">
								<button type="button" id="findAddrBtn" onclick="findAddr()">우편번호
									찾기</button></td>
						</tr>
						<tr>
							<td style="text-align: left"><input type="text"
								name="address" id="ORDER_ADDR1" value="${member.address}"
								style="width: 400px;"></td>
						</tr>
						<tr>
							<td style="text-align: left"><input type="text"
								name="addressdetail" id="ORDER_ADDR2"
								value="${member.addressDetail}" style="width: 400px;">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<br>

			<div class="table-responsive">
				<p>
					<b>결제선택</b>
				</p>
				<table class="table table-striped">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
						<tr>
							<td>총 결제금액</td>
							<td style="text-align: left"><input type="text"
								name="itemcost" id="ORDER_TOTAL_PAY_PRICE"
								value="${item.itemcost }" style="width: 100px;" readonly>원
							</td>
						</tr>
						<tr>
						</tr>
						<tr>
						</tr>
						<tr>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<div style="text-align: center">
				<input type="checkbox" name="orderChk" id="orderChk">
				(필수)결제서비스 약관에 동의하며, 원활한 배송을 위한 개인정보 제공에 동의합니다. <br> <br> 
				<input type="button" name="all_order" value="장바구니"
					onClick="location.href='/cart'"> 
				<input type="submit" name="order_pay" value="결제진행"
					onclick="fn_order_pay(); return false;">
			</div>

		</form>
</body>
</html>