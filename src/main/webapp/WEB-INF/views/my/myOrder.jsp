<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="order" items="${order}" varStatus="index">
		<%-- <c:out value="${order.ordernum }" />
		<c:out value="${order.ordercost }" /> --%>
		 <table>
            <colgroup>
            <col width="20" />
            <col width="*" />
            <col width="10%" />
            <col width="13%" />
            <col width="13%" />
         </colgroup>
              <thead>
                <tr>
                  <th colspan="2" style="text-align:center">상품명/옵션</th>
                  <th></th>
                  <th style="text-align:center">주문금액</th>
                </tr>
              </thead>
              <tbody>
              
                  <tr>
                           <td>
                              <img src='' width="70px" height="70px">
                           </td>
                     <td  style="text-align:center">
                          <a href="">${order.itemattrvo.itemname}/${order.itemattrvo.itemcolor}</a> <br>
                          
                       </td>
                      <td style="text-align:center">
                        <input type="hidden" name="itemcode"  value="${order.itemattrvo.itemcode}" style="width:60px; text-align:right; border:none;" readonly>
                     </td>
                     <td style="text-align:center">
                        <input type="text" name="ordercost" value="${order.ordercost}" style="width:60px; text-align:right; border:none;" readonly>원
                     </td>
                  </tr>
              </tbody>
            </table>
		

	</c:forEach>
</body>
</html>