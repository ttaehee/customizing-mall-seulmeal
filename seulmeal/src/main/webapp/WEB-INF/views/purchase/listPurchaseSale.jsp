<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)	
		//alert(  "function호출됨"  );
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	 }
	
	 $(function() {
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(1)" ).on("click" , function() {
				 self.location ="/purchase/getPurchase?tranNo="+$( this ).data("value");
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(1)" ).css("color" , "red");
			
		});	
	
	$(function() {
		 
			 $( ".glyphicon.glyphicon-ok" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					 var tranNo = $(this).next().val();
					
						$.ajax( {
									url : "/purchase/json/getPurchase/"+tranNo ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										
										//Debug...
										//console.log("JSONData : \n" + JSONData);
	
										var displayValue = "<h7>"
																	+"물품번호 : "+JSONData.purchaseProd.prodNo+"<br/>"
																	+"구매자아이디 : "+JSONData.buyer.userId+"<br/>"
																	+"구매방법 : "+JSONData.paymentOption+"<br/>"
																	+"구매자이름 : "+JSONData.receiverName+"<br/>"
																	+"구매자연락처 : "+JSONData.receiverPhone+"<br/>"
																	+"구매자주소 : "+JSONData.divyAddr+"<br/>"
																	+"구매자요청사항 : "+JSONData.divyRequest+"<br/>"
																	+"배송희망일 : "+JSONData.divyDate+"<br/>"
																	+"</h7>";
	
										$("h7").remove();
										$( "#"+tranNo+"" ).append(displayValue);
									}
						});
				 });
		
		$("h7").css("color" , "red");
							
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
	});		

    </script>
</head>

<body>

	<jsp:include page="../layer/header.jsp"></jsp:include>
	
	<div class="container">

		<div class="page-header text-info">
			<h3>구매 목록조회</h3>
		</div>
		
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm"> 		  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
	        <td class="ct_list_b" width="100">No</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">회원ID</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">회원명</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">전화번호</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">배송현황</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">간략정보</td>
		  </tr>
        </thead>
       
		<tbody>
	
			<c:set var="i" value="0" />
			<c:forEach var="purchase" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr class="ct_list_pop">
					<td align="center" data-value="${purchase.tranNo}">${ i }</td>
					<td></td>
					<td align="left">${user.userId}</td>
					<td></td>
					<td align="left">${user.userName}</td>
					<td></td>
					<td align="left">${purchase.receiverPhone}</td>		
					<td></td>
			
					<td align="left" data-value="${purchase.tranNo}">현재
			
						<c:choose>
						    <c:when test="${empty purchase.tranCode}">
						    <a>판매중</a>
						    </c:when>
						    <c:when test="${purchase.tranCode eq '2'}">
						    <a>구매완료</a>
						    </c:when>
						    <c:when test="${purchase.tranCode eq '3'}">
						    <a>배송중</a>
						    </c:when>
						    <c:when test="${purchase.tranCode eq '4'}">
						    <a>배송완료</a>
						    </c:when>
						    
						</c:choose>

					상태 입니다.	
						<c:if test="${purchase.tranCode eq '3'}">
						    <a href="/purchase/updateTranCode?menu=search&tranCode=4&prodNo=${purchase.purchaseProd.prodNo}">물건도착</a>
						</c:if>
					</td>
		
					<td align="left">
						
					</td>
					<td align="left">
			  	       <i class="glyphicon glyphicon-ok" id="${purchase.tranNo}"></i>
			  	       <input type="hidden" value="${purchase.tranNo}">
			        </td>
				</tr>
			</c:forEach>
        
        </tbody>
      
      </table>
 	</div>
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>