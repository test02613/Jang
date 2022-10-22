<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>my주문상태</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/resources/css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/resources/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

<script src="/resources/js/common.js" charset="utf-8"></script>

 <script>
 $(document).ready(function(){
		/* alert('동작함'); */
	});

 
function order_change(mem_no, order_no){
	var mem_no = mem_no;
	var order_no = order_no;
	alert(mem_no+"/"+order_no);
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/order_as_form.do' />");
	comSubmit.addParam("mem_no", mem_no);
	comSubmit.addParam("order_no", order_no);
	comSubmit.submit();
}
 
	
function order_cancle(mem_no, order_no){
	alert("취소확인동작");
	var mem_no = mem_no;
	var order_no = order_no;
	
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/order_cancle.do' />");
	comSubmit.addParam("mem_no", mem_no);
	comSubmit.addParam("order_no", order_no);
	comSubmit.submit();
}
 
function order_ok(mem_no, order_no){
	alert("수취확인동작");
	var mem_no = mem_no;
	var order_no = order_no;
	
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	
	if(confirm("수취확인 후 교환/환분/AS문의는 고객 게시판을 이용해 주시기 바랍니다.")){
	$.ajax({
		url: "/stu/order_ok.do",
		data : {"mem_no": mem_no, "order_no": order_no},
		type: "post",
		async:false,
		success : function(data){
		alert("수취확인이 완료되었습니다.");
		location.href = "/stu/orderList.do";
		}
	})
	}else{
	return;
	}
}

function order_qna(mem_no, order_no){
	var mem_no = mem_no;
	var order_no = order_no;
	alert("수취확인 후 교환/환불/AS는 상품문의 게시판에서 신청하셔야 합니다.");
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/board/qnaBoard.do' />");
	comSubmit.addParam("member_no", mem_no);
	comSubmit.addParam("order_no", order_no);
	comSubmit.submit();
}

</script>

<style>

a {
  text-decoration: none;
  color: #666;
  text-decoration:none
}

h1 {
    text-align: center;
    padding: 50px 0;
    font-weight: normal;
    font-size: 2em;
    letter-spacing: 10px;
}  

/* #orderList {
	width : 800px;
	position: relative;
	top : -600px;
	left: 320px;

} */


</style>
 
</head>
<body>
<div class="container">

	<div id="orderList">
	<div class="row" align="center">
        <div>
          <h2>주문 내역</h2>
          <p>배송추적은 '수취확인' 상태부터 가능합니다.</p>
          <p>수취확인 후에는 반품/교환이 어렵습니다. 기한내 신청 바랍니다.</p>
        </div>
	</div>
	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="20%" />
			<col width="45%" />
			<col width="15%" />
			<col width="10%" />
			<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">주문날짜<br />주문번호</th>
					<th scope="col">구매상품명</th>
					<th scope="col">주문 금액</th>
					<th scope="col">배송현황</th>
					<th scope="col">신청</th>
				</tr>
			</thead>
	
			<tbody>

					
			
					<c:forEach var="order" items="${order}" varStatus="index">					
						<tr>
							<td>${order.orderdate }<br /> / ${order.ordernum }</td>
							<td>${order.itemattrvo.itemname }</td>
							<td>${order.ordercost }</td>
							<td></td>
							<td></td>
							</tr>
							</c:forEach>
		</tbody>

		</table>
		</div>
	</div>
</div>	

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>
