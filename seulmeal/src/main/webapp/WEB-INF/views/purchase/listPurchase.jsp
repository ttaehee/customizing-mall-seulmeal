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

	<style>
	
	h2{
		text-align: left; 
	}

	h2:after {
		content: "";
		display: block;
		width: 170px;
		border-bottom: 1px solid #bcbcbc;
		margin: 20px 0px;
		padding:0px 10px 0px 10px;
	}
	
	 body { background: #fff; }
		.table-hover {
	  	width: 100%;
 		border-top: 1px solid #444444;
 		border-collapse: collapse;
	}  
	
	th, td {
	  border-bottom: 1px solid #444444;
	  padding: 10px;
	}
		
		
		
	</style>


	 <br/>
	 <div class="container">
	 		
	 <h2>구매내역 조회</h2>
	 <div class="col-md-6 text-right">
	    <form class="form-inline" name="detailForm">
	     <input type="hidden" name="userId" value="${user.userId}"/>
		 <div class="form-group">
			 <button class="btn btn-primary status" style="margin-right:10px;" onclick="location.href='/purchase/getListPurchase'">전체</button>
			 <button class="btn btn-primary status" style="margin-right:10px;" name="searchCondition" value="0">오늘</button>
			 <button class="btn btn-primary status" style="margin-right:10px;" name="searchCondition" value="1">1주일</button>
			 <button class="btn btn-primary status" style="margin-right:10px;" name="searchCondition" value="2">1개월</button>
			 <button class="btn btn-primary status" style="margin-right:10px;" name="searchCondition" value="3">3개월</button>
		  </div>
		  
		  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
		  <input type="hidden" id="currentPage" name="currentPage" value=""/>
		  
		</form>
   	</div><br/>
			
	
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
      </div>
      
	<script>
      
      function fncGetListPurchase(currentPage) {
  		$("#currentPage").val(currentPage)
  		$("form").attr("method" , "POST").attr("action" , "/purchase/getListPurchase").submit();
  	  }
  	

  	 $(function() {
  		  
  		 $(".status").on("click" , function() {

  			fncGetListPurchase(1);
  			});
  	 });
  	 
  	 
  	setRowspan(num) {	//num 병합을 원하는 열
  	  var mergeItem = "";	//병합구분값
  	  var mergeCount = 0;	//병합 수
  	  var mergeRowNum = 0;	//병합들어갈 row

  	  $('tr','#table1').each(function(row){  // #테이블ID값
  	    if(row > 0 ){
  	      var item = $(':eq(' + num +')',$(this)).html();
  	      if(mergeItem != item  ) {
  	        mergeCount = 1;
  	        mergeItem = item ;
  	        mergeRowNum = row;
  	      }else{
  	        mergeCount = mergeCount + 1;
  	        $("tr:eq("+mergeRowNum+") > td:eq("+num+")").attr("rowspan",mergeCount);
  	        $('td:eq('+num+')',$(this)).hide();	//병합될 값들 숨김처리
  	      }
  	    }
  	  })
  	}
      
	</script>

<jsp:include page="../layer/footer.jsp"></jsp:include>	

</body>
</html>