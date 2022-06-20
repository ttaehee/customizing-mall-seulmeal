<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>판매 목록</title>

</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	
	<div class="container">
		<h2>판매내역 목록</h2><br/>
		 <table class="table table-hover" style="width: 1000px;">
	 
	        <thead>
	          <tr>
	            <th align="center">NO</th>
	            <th align="center">구매번호</th>
	            <th align="center">구매일자</th>
	            <th align="center">유저ID</th>
	             <th align="center">상품명</th>
	            <th align="center">상품금액</th>
	            <th align="center">결제금액</th>
	            <th align="center">배송관리</th>
	          </tr>
	        </thead>
	
			<tbody style="font-size:15px">
				<c:set var="total" value="0" />
				<c:set var="i" value="0" />
				<c:forEach var="sale" items="${saleList}">
					<c:set var="i" value="${i+1}" />
					<tr class="ct_list_pop">
						  <td align="left">${i}</td>
						  <td align="left">${sale.purchaseNo}</td>
						  <td align="left">${sale.regDate}</td>
						   <td align="left">${sale.user.userId}</td>
						  <td align="left">
						  <c:set var="cpdPrice" value="0" />
						  <c:forEach var="cpd" items="${sale.customProduct}">
						  		${cpd.product.name}<br/>
						  <c:set var="cpdPrice" value="${cpdPrice+cpd.price}" />
						  </c:forEach>
						  </td> 
						  <td align="left">${cpdPrice}</td>
						  <td align="left">${sale.price}</td>
						  <td>
						  
						  	<c:choose>
								<c:when test="${sale.purchaseStatus eq '1'}"><button type="button" class="btn btn-outline-primary btn-sm" onClick="fncPurchaseStatus()">배송하기</button></c:when>
								<c:when test="${sale.purchaseStatus eq '2'}">&ensp;배송중</c:when>
								<c:when test="${sale.purchaseStatus eq '3'}">&ensp;배송완료</c:when>
								<c:when test="${sale.purchaseStatus eq '4'}">&ensp;구매확정</c:when>
							</c:choose><br/>
						  </td>
					  </tr>  
				  </c:forEach>
	        </tbody>
	      </table><br/>
	 </div>
	 
	 <!-- 페이징처리 -->
	<div class="container">
		<div class="row" style="justify-content : center;">
			<nav aria-label="...">
			  <ul class="pagination">
			  	<c:forEach var="i" begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}">
			  		<li class="page-item"><a class="page-link" href="/purchase/getListSale/${i}">${i}</a></li>
			  	</c:forEach>
			  </ul>
			</nav>
		</div>
	</div>	

		
<script type="text/javascript">
	
	function fncPurchaseStatus(){
		$.ajax({
			url:"/purchase/api/updatePurchaseCode/"+customProductNo+"/"+count,
			method:"GET",  
	        headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	        },
	        dataType : "json",
	        success : function(data){	
	        	
	        }
    	});	
	}
	
</script>

</body>
</html>