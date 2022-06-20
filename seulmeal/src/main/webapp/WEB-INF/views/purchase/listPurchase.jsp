<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		width: 220px;
		border-bottom: 2px solid #FF4500;
		margin: 10px 0px;
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
	
	img{
			width: 150px;
			height: 150px;
		}
	
	</style>


	 <br/>
	 <div class="container">
	 
	 <br/>
	 <h2>구매내역 조회</h2><br/>
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
			
	
	 <table class="table table-hover" id="list" style="width: 1000px;">
 
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
			      <td align="left">
			      	<a href="/purchase/getPurchase/${purchase.purchaseNo}">${purchase.regDate}[${purchase.purchaseNo}]</a><br/>
			      		<c:if test="${purchase.purchaseStatus eq '3'}">
			      			<button type="button" class="btn btn-outline-primary btn-sm" data-value="${purchase.purchaseNo}" onClick="fncPurchaseStatus(this)">구매확정하기</button>
			      		</c:if>
			      </td>
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
			  </c:forEach>
        </tbody>
      </table>
      </div>
      
<script>
    
	//getListPurchase submit
      function fncGetListPurchase(currentPage) {
  		$("#currentPage").val(currentPage)
  		$("form").attr("method" , "POST").attr("action" , "/purchase/getListPurchase").submit();
  	  }
  	
	//기간별 구매내역리스트
  	 $(function() {
  		  
  		 $(".status").on("click" , function() {

  			fncGetListPurchase(1);
  			});
  	 });
  	 
  	//구매확정버튼 
	function fncPurchaseStatus(ths){
		
		const purchaseNo=$(ths).data('value');	
		
		$.ajax({
			url:"/purchase/api/updatePurchaseCode",
			method:"POST",  
			data:JSON.stringify({
				purchaseNo : purchaseNo,
				purchaseStatus: "4"
			}),
	        headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	        },
	        dataType : "json",
	        success : function(data){	
	        	$(ths).closest('tr').find('td:eq(6)').text('구매확정');
	        	$(ths).remove();
	        }
    	});	
	}
  	
	//테이블 셀병함
	$.fn.rowspan = function(colIdx, isStats) {       
	    return this.each(function(){      
	        var that;     
	        $('tr', this).each(function(row) {      
	            $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
	                 
	                if ($(this).html() == $(that).html()
	                    && (!isStats 
	                            || isStats && $(this).prev().html() == $(that).prev().html()
	                            )
	                    ) {            
	                    rowspan = $(that).attr("rowspan") || 1;
	                    rowspan = Number(rowspan)+1;
	 
	                    $(that).attr("rowspan",rowspan);               
         
	                    $(this).hide();
	                     
	                } else {            
	                    that = this;         
	                }          
	                that = (that == null) ? this : that;      
	            });     
	        });    
	    });  
	}; 
	
	$('#list').rowspan(0);
  	 

      
</script>

<jsp:include page="../layer/footer.jsp"></jsp:include>	

</body>
</html>