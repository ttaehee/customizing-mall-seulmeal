<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>구매 상세</title>

</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>

	<h2>구매정보</h2>
	구매번호 : ${purchase.purchaseNo} <br/>
	구매일자 : ${purchase.regDate} <br/>
	구매자이름 : ${purchase.name} <br/>
	구매자 휴대전화 : ${purchase.phone} <br/>
	구매처리상태 : 
		<c:choose>
			<c:when test="${purchase.purchaseStatus eq '0'}">상품준비중</c:when>
			<c:when test="${purchase.purchaseStatus eq '1'}">배송중</c:when>
			<c:when test="${purchase.purchaseStatus eq '2'}">배송완료</c:when>
			<c:when test="${purchase.purchaseStatus eq '3'}">구매확정</c:when>
		</c:choose><br/>
	적립 포인트 :  <br/><br/>
	
	<h2>결제정보</h2>
	총 구매금액 : 100 <br/>
	포인트사용 :  0 <br/>
	총 결제금액 : ${purchase.amount} <br/>
	결제방법 : 
		<c:choose>
			<c:when test="${purchase.paymentCondition eq '0'}">카드결제</c:when>
			<c:when test="${purchase.paymentCondition eq '1'}">포인트결제</c:when>
			<c:when test="${purchase.paymentCondition eq '2'}">포인트결제 + 카드결제</c:when>
		</c:choose><br/><br/>
		<div>${purchase }</div>
	 <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">구매일자[구매번호]</th>
            <th align="center">이미지</th>
            <th align="center">수량</th>
            <th align="center" >상품명</th>
            <th align="center" >옵션</th>
            <th align="center">상품구매금액</th>
            <th align="center">구매처리상태</th>
          </tr>
        </thead>
       
		<tbody>
			<c:forEach var="cpd" items="${purchase.customProduct}">
			<tr class="ct_list_pop">
			    <td align="left">${purchase.regDate}(${purchase.purchaseNo})</td>
				  <td align="left" data-value="${cpd.product.productNo}" title="Click : 상품확인" >${cpd.product.thumbnail}</td>
				  <td align="left">${cpd.count}</td>
				  <td align="left">${cpd.product.name}</td>
				  <td align="left">
				  <c:forEach var="pp" items="${cpd.plusParts}">
				  	+ ${pp.parts.name}, ${pp.parts.price}, ${pp.gram}<br/>
				  	</c:forEach>
				  <c:forEach var="mp" items="${cpd.minusParts}">
				  	- ${mp.minusName}
				  	</c:forEach> 
				  	 </td>
				  <td align="left">${cpd.price}</td>
		 	  
		 	  
		 	  <td align="left">
				<c:choose>
					<c:when test="${purchase.purchaseStatus eq '0'}">상품준비중</c:when>
					<c:when test="${purchase.purchaseStatus eq '1'}">배송중</c:when>
					<c:when test="${purchase.purchaseStatus eq '2'}">배송완료</c:when>
					<c:when test="${purchase.purchaseStatus eq '3'}">구매확정</c:when>
				</c:choose><br/>
				</td>
		
			  </tr>  
			  </c:forEach> 
        </tbody>
      
      </table>
	
	<h2>배송정보</h2>
	받으시는분 : ${purchase.name} <br/>
	주소 : ${purchase.address} <br/>
	휴대전화 : ${purchase.phone} <br/>
	배송메시지 : ${purchase.message} <br/>
	
	<button id="ok">확인</button>

<jsp:include page="../layer/footer.jsp"></jsp:include>	
</body>
</html>