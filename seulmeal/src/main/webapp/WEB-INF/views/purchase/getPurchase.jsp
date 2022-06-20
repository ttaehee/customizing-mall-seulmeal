<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>구매 상세</title>

</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>

	<style>

		img{
			width: 200px;
			height: 200px;
		}
		
		.card{
			width: 300px;
			text-align: center;
		}
		
		p {
		    margin:20px 0px;
		}
		
		h5:after {
	       content: "";
			display: block;
			width: 70px;
			border-bottom: 1px solid #bcbcbc;
			margin-top: 10px;
			margin: 20px 0px;
			padding:0px 10px 0px 10px;
		}
		 
	</style>
	 
	 <div class="container">
	 <h2>구매상품 정보</h2>

		    <div class="container">
		        <c:set var="price" value="0" />
				<c:forEach var="cpd" items="${purchase.customProduct}">
		          <p></p>
		          <div class="card">
		            <div class="card-header" style="background-color: #FF4500; color: #FFF;">
		              ${cpd.product.name}
		            </div>
		            <div>
		            <img src='/resources/attachments/${cpd.product.thumbnail}'>
		              <p class="card-text">
			              <c:forEach var="pp" items="${cpd.plusParts}">
						  	+ ${pp.parts.name}, ${pp.gram}g, <fmt:formatNumber type="number" maxFractionDigits="0"  value="${pp.parts.price*pp.gram/10}" />원 <br/>
						  </c:forEach>
						  <c:forEach var="mp" items="${cpd.minusParts}">
						  	- ${mp.minusName} <br/>
						  </c:forEach> 
					  </p>
		              <span class="btn btn-primary">${cpd.price*cpd.count}</span>원
		              <c:set var="price" value="${price+cpd.price*cpd.count}" />
		            </div>
		          </div>
		        </c:forEach>
		    </div>
	</div>
	
	<div class="container">

	 <table class="table table-hover" style="width: 1000px;">
 
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
			<c:forEach var="cpd" items="${purchase.customProduct}">
			<tr class="ct_list_pop">
			      <td align="left">${purchase.regDate}[${purchase.purchaseNo}]</td>
				  <td align="left" data-value="${cpd.product.productNo}" title="Click : 상품확인" ><img src='/resources/attachments/${cpd.product.thumbnail}'></td>
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
					<c:when test="${purchase.purchaseStatus eq '1'}">상품준비중</c:when>
					<c:when test="${purchase.purchaseStatus eq '2'}">배송중</c:when>
					<c:when test="${purchase.purchaseStatus eq '3'}">배송완료</c:when>
					<c:when test="${purchase.purchaseStatus eq '4'}">구매확정</c:when>
				</c:choose><br/>
				</td>
		
			  </tr>  
			  </c:forEach> 
        </tbody>
      </table>
    </div>
     
    <div class="container">
    
	<h5>구매정보</h5>
	<div>구매번호 : ${purchase.purchaseNo} </div>
	<div>구매일자 : ${purchase.regDate} </div>
	<div>구매자이름 : ${user.userName} </div>
	<div>구매자 휴대전화 : ${user.phone} </div>
	<div>구매처리상태 : 
		<c:choose>
			<c:when test="${purchase.purchaseStatus eq '1'}">상품준비중</c:when>
			<c:when test="${purchase.purchaseStatus eq '2'}">배송중</c:when>
			<c:when test="${purchase.purchaseStatus eq '3'}">배송완료</c:when>
			<c:when test="${purchase.purchaseStatus eq '4'}">구매확정</c:when>
		</c:choose><br/>
	적립 포인트 :
		<c:choose>
			<c:when test="${user.grade eq '0'}"> <fmt:formatNumber type="number" maxFractionDigits="0"  value="${price*0.005}" />P<br/>
			(${user.userName}님은 슬밀프랜드 등급으로 구매금액의 0.5%가 적립됩니다)</c:when>
			<c:when test="${user.grade eq '1'}"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${price*0.01}" />P<br/>
			(${user.userName}님은 슬밀패밀리 등급으로 구매금액의 1%가 적립됩니다)</c:when>
			<c:when test="${user.grade eq '2'}"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${price*0.03}" />P<br/>
			(${user.userName}님은 슬밀히어로 등급으로 구매금액의 3%가 적립됩니다)</c:when>
			<c:when test="${user.grade eq '3'}"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${price*0.05}" />P<br/>
			(${user.userName}님은 슬밀마스터 등급으로 구매금액의 5%가 적립됩니다)</c:when>
		</c:choose><br/>
	 <br/><br/>
	
	<h5>결제정보</h5>
	<c:out value="총 구매금액 : ${price}원"></c:out> <br/>
	포인트사용 :  ${price-purchase.amount}P<br/>
	총 결제금액 : ${purchase.amount}원 <br/>
	결제방법 : 
		<c:choose>
			<c:when test="${purchase.paymentCondition eq '0'}">카드결제</c:when>
			<c:when test="${purchase.paymentCondition eq '1'}">포인트결제</c:when>
			<c:when test="${purchase.paymentCondition eq '2'}">포인트결제 + 카드결제</c:when>
		</c:choose><br/><br/>
	
	<h5>배송정보</h5>
	받으시는분 : ${purchase.name} <br/>
	주소 : ${purchase.address} <br/>
	휴대전화 : ${purchase.phone} <br/>
	배송메시지 : ${purchase.message} <br/><br/>
	
	<button type="button" style="background-color:#FFF; border-radius:5px; background-color:#FFF; font-size:16px; width: 80px" onClick="history.back(-1)">확인</button>
	</div>
	</div>

<jsp:include page="../layer/footer.jsp"></jsp:include>	
</body>
</html>