<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>구매내역 목록</title>

</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	 
	 <br/>
	 <h2>구매내역 조회</h2>
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
			<c:set var="price" value="0" />
			<c:forEach var="purchase" items="${purchaseList}">
			<c:forEach var="cpd" items="${purchase.customProduct}">
			<tr class="ct_list_pop">
			      <td align="left"><a href="/purchase/getPurchase/${purchase.purchaseNo}">${purchase.regDate}[${purchase.purchaseNo}]</a></td>
				  <td align="left" data-value="${cpd.product.productNo}" title="Click : 상품확인" >${cpd.product.thumbnail}</td>
				  <td align="left">${cpd.count}</td>
				  <td align="left">${cpd.product.name}</td>
				  <td align="left">
				  <c:forEach var="pp" items="${cpd.plusParts}">
				  	+ ${pp.parts.name}, ${pp.gram}g, <fmt:formatNumber type="number" maxFractionDigits="0"  value="${pp.parts.price*pp.gram/10}" />원 <br/>
				  	</c:forEach>
				  <c:forEach var="mp" items="${cpd.minusParts}">
				  	- ${mp.minusName} <br/>
				  	</c:forEach> 
				  	 </td>
				  <td align="left">${cpd.price*cpd.count}</td>
				  <c:set var="price" value="${price+cpd.price*cpd.count}" />
		 	  
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
			  </c:forEach>
        </tbody>
      </table>

<jsp:include page="../layer/footer.jsp"></jsp:include>	

</body>
</html>