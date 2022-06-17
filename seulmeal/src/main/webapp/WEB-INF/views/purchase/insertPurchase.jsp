<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>구매 등록</title>

</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>

<style>

	input{
	   width:300px;
	   height:50px;
	   border-top:none;
	   border-left:none;
	   border-right:none;
	   border-bottom:2px solid #FF4500;
	}
	
	input[type="checkbox"]{
        display: none;
      }
      
    input[type="checkbox"] + label{
        display: inline-block;
        width: 20px;
        height: 20px;
        border:3px solid #FF4500;
        position: absolute;
        font-size: 14px;
      }
	input[type="checkbox"]:checked + label::after{
        content:'v';
        font-size: 16px;
        width: 20px;
        height: 20px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
      }


	h2:after {
		content: "";
		display: block;
		width: 100px;
		border-bottom: 2px solid #969696;
		margin: 20px 0px;
		padding:0px 10px 0px 10px;
	}

</style>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<form class="cc">
	 <div class="container">
	  <div class="row">
		 <div class="col-xs-4" style="padding: 100px 0px 0px 40px;">
		 	<h2>구매</h2>
		 </div>
		 <div class="col-xs-4">
		 	<div style="border:1px solid; padding:1px 0px 0px 12px; margin:20px; width:600px; margin-top:80px; border-radius: 3px; border-color: #969696;">
		 			<div class="row">
						 <div class="col-xs-4" style="padding: 7px 0px 0px 0px;">
						 	<div style="border:1px solid; padding:10px; margin:20px; width:85px; border-radius: 4px; border-color: #969696;">
		 						<div text-align="center">혜택정보</div>
		 					</div>
		 				</div>
		 				<div class="col-xs-8" style="padding: 15px 0px 0px 0px;">
		 					<div align="center">${user.userName}님의 회원등급은 [
		 						<c:choose>
									<c:when test="${user.grade eq '0'}">슬밀프랜드</c:when>
									<c:when test="${user.grade eq '1'}">슬밀패밀리</c:when>
									<c:when test="${user.grade eq '2'}">슬밀히어로</c:when>
									<c:when test="${user.grade eq '3'}">슬밀마스터</c:when>
								 </c:choose> 
								 ]입니다.</div>
		 					<hr style="border:1px solid; width:400px; bottom:15px; border-color: #FF4500;"/>
		 					<div align="center" style="padding: 0px 0px 0px 30px;">가용포인트 : ${user.totalPoint} P</div>
		 				</div>				
		 			</div>
		 	</div>
		 </div>
		 <div class="col-xs-4">
			 <br/><br/>
		 	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-receipt-cutoff" viewBox="0 0 16 16" style="padding: 50px 0px 0px 0px;">
			  <path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/>
			  <path d="M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z"/>
			</svg>
		 </div>
		</div><br/>
	
		<table class="table table-hover" style="border-color: #FF4500; width:900px;">
	 
	        <thead>
	          <tr>
	            <th align="center">NO</th>
	            <th align="center">이미지</th>
	            <th align="center">상품명</th>
	            <th align="center">옵션</th>
	             <th align="center">수량</th>
	            <th align="center">합계</th>
	          </tr>
	        </thead>
	        
	       <c:choose>
	       	 <c:when test="${cartStatus eq '0'}">
	
				<tbody style="font-size:15px">
						<tr class="ct_list_pop">
							  <td align="left">1</td>
							  <td align="left" data-value="${customProduct.product.productNo}" title="Click : 상품확인" >${customProduct.product.thumbnail}</td>
							  <td align="left">${customProduct.product.name}</td>
							  <td align="left">
							  <c:forEach var="pp" items="${customProduct.plusParts}">
							  	+ ${pp.parts.name}, ${pp.gram}g, <fmt:formatNumber type="number" maxFractionDigits="0"  value="${pp.parts.price*pp.gram/10}" />원 <br/>
							  	</c:forEach>
							  <c:forEach var="mp" items="${customProduct.minusParts}">
							  	- ${mp.minusName} <br/>
							  	</c:forEach> 
							  	 </td>
							  <td align="left">
							  	<span id ="count" name="count"> ${customProduct.count} </span>
							  </td>
							  <td align="left">
							  <span id="customprice" name="price">${customProduct.price*cpd.count}</span>원</td>
							  <td align="left">
							  	<button type="button" class="btn btn-outline-primary change" onclick="window.location.href='/purchase/updateCustomProduct/' + ${customProduct.customProductNo}">수정</button>
							  </td>
							  <c:set var="sum" value="${customProduct.price*customProduct.count}" />
						  </tr>  

				  
				</c:when>
			
				<c:when test="${cartStatus eq '1'}">
	
				<tbody style="font-size:15px">
				<c:set var="sum" value="0" />
				<c:set var="customprice" value="0" />
				<c:set var="i" value="0" />
				<c:forEach var="cpd" items="${customProductList}">
					<c:set var="i" value="${i+1}" />
					<c:set var="customprice" value="${cpd.price}" />
					<tr class="ct_list_pop">
						  <td align="left">${i}</td>
						  <td align="left" data-no="${cpd.product.productNo}" title="Click : 상품확인" >${cpd.product.thumbnail}</td>
						  <td align="left">${cpd.product.name}</td>
						  <td align="left">
						  <c:forEach var="pp" items="${cpd.plusParts}">
						  	+ ${pp.parts.name}, ${pp.gram}g, <fmt:formatNumber type="number" maxFractionDigits="0"  value="${pp.parts.price*pp.gram/10}" />원 <br/>
						  	</c:forEach>
						  <c:forEach var="mp" items="${cpd.minusParts}">
						  	- ${mp.minusName} <br/>
						  	</c:forEach> 
						  	 </td>
						  <td align="left">
						  	<span id ="count" name="count"> ${cpd.count} </span> 
						  </td>
						  <td align="left">
						  <span id="customprice" name="price">${cpd.price*cpd.count}</span>원</td>
						  <c:set var="sum" value="${sum+cpd.price*cpd.count}" />
						  
					  </tr>  
				  </c:forEach>
	        </tbody>
	        </c:when>
	        </c:choose>
	      </table><br/>
	 </div>
	
	<div class="container">
	<div class="row">
	<div class="col-xs-6">
	 
	<div class="card" style=" border-radius: 10px; width:470px; min-height: 670px;">
		<div class="card-body">
		    <h6 class="card-title">배송정보</h6>
		    <h8 class="card-subtitle mb-2 text-muted"></h8>
		    <p class="card-text">
				<div class="container" >
					<input type="hidden" id="userId" name="userId" value="${user.userId}"/><br/>
					<label class="placeholder-text">
					   <div class="text">받으시는분</div>
					</label>
					<div>
					<input type="text" id="name" name="name" value="${user.userName}" placeholder="받으시는분"></input><br/>
					</div><br/>
					<label class="placeholder-text">
					   <div class="text">주소</div>
					</label>
					<div>
					<input type="text" id="address" name="address" " value="${user.address}" placeholder="주소"></input><br/>
					</div><br/>
					<label class="placeholder-text">
					   <div class="text">휴대전화</div>
					</label>
					<div>
					<input type="text" id="phone" name="phone" value="${user.phone}" placeholder="휴대전화"></input><br/>
					</div><br/>
					<label class="placeholder-text">
					   <div class="text">이메일</div>
					</label>
					<div>
					<input type="text" id="email" name="email" value="${user.email}" placeholder="이메일"></input><br/>
					</div><br/>
					<label class="placeholder-text">
					   <div class="text">배송메시지</div>
					</label>
					<div>
					<input type="text" id="message" name="message" placeholder="배송메시지"></input><br/>
					</div>
			</p>
		</div>
	</div>
	</div>
	</div>
			
			<div class="col-xs-2">
				<div class="card" style="border:none; color:white;">
					슬밀슬
				</div><br/>
			
			
			</div>
	
			<div class="col-xs-3">
				<div class="card" style="border-radius: 10px; width: 370px;">
					<div class="card-body">
					    <h6 class="card-title">결제수단</h6>
					    <h8 class="card-subtitle mb-2 text-muted"></h8>
					    <p class="card-text">
					    	<div>
					    		<input type="checkbox" id="pay1" name="paymentCondition" value="0" />신용카드&ensp;&ensp;&ensp;
					    		<label for="pay1"></label><br/>
					    		<input type="checkbox" id="pay2" name="paymentCondition" value="1"/>네이버페이&ensp;
					    		<label for="pay2"></label><br/>
					    		<input type="checkbox" id="pay3" name="paymentCondition" value="2"/>카카오페이&ensp;
					    		<label for="pay3"></label>
					    	</div><br/>

							<div class="header" id="head">
								<!-- 아코디언-->
								
								<div>
									<a class="bg_links" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapse"> 포인트사용(보유 ${user.totalPoint}P) </a>
								</div>	
					
							</div>
					
							<!-- 아코디언 바디 -->
							<div class="container" style="margin-top: 20px;">
								<div id="accordion">
									<div class="card">
									
									
									
										<div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
											<div class="card-body">
												<input type="text" id="usepoint" name="usepoint" value="" placeholder="사용할 포인트" style="width:150px;"></input> P<br/><br/>
												(100P 단위로 사용가능)<br/><br/>
												<input type="password" id="password" name="password" value="" placeholder="비밀번호" style="width:150px;"></input>
												<button type="button" class="btn btn-outline-primary" id="confirm" style="font-size:18px;" onClick="fnCalTotal()">확인</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							
													
						</p>
					</div>
				</div><br/>
				
				<div class="card" style="border-radius: 10px; min-height: 80px; width: 370px;">
					<div class="card-body">
					    <h6 class="card-title">최종결제금액</h6>
					    <h8 class="card-subtitle mb-2 text-muted"></h8>
					    <p class="card-text">
							<div style="text-align: right;">KRW&ensp;&ensp;<span id="total" style="font-size: 20px;">${sum}</span>&ensp;</div>
							<button type="button" class="pay" id="pay" style="background-color:#FFF; border-radius:5px; border-color:#FF4500; font-size:22px; width: 320px" onClick="iamport()">결제하기</button>		
						</p>
						<div id="pluspoint">
							적립예정 포인트 : <fmt:parseNumber var= "pluspoint" pattern="#,###" value="${sum*0.05}"/>P
						</div>
	
					</div>
				</div><br/>
				
			</div>
		</div>
	</div><br/><br/>

	</form>
	
	
	<script type="text/javascript">

	function fnCalTotal(){
		const usepoint = parseInt($('#usepoint').val());
		const password = $('#password').val();
		console.log(password);
		console.log(password);
		const sum = parseInt($('#total').text());
		const total = sum-usepoint;
		
		if(total<0){
			alert("결제금액보다 적은 포인트를 입력하세요.");
			$('#usepoint').val('');
			return;
		}
		
			$.ajax({
				url: "/purchase/api/confirmPassword",
				method : "POST",
		        data:JSON.stringify({
		        	password : password,
		        	totalPoint : usepoint
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
		        success : function(data){	
		        	console.log(data);
		        	if(data.success==='true'){
		        		alert("포인트적용완료");
		        		$("#total").text(total);
		        		
		        		$('#confirm').attr("disabled","disabled");
		        		
		        	}else if(data.success==='pt'){
		        		alert("보유포인트 내에서 입력하세요.");
		        		$('#usepoint').val('');
		        		$('#password').val('');
		    			return;
		    			
		        	}else if(data.success==='pw'){
		        		alert("비밀번호를 다시 입력하세요.");
		        		$('#usepoint').val('');
		        		$('#password').val('');
		        		return;
		        		
		        	}else{
		        		alert("다시 시도해주세요.");
		        		$('#usepoint').val('');
		        		$('#password').val('');
		        		return;
		        	}
		        }
	    	});		
	}
		
	
	function iamport(){
		
		const userId = $('#userId').val();
		const name = $('#name').val();
		const address = $('#address').val();
		const phone = $('#phone').val();
		const email = $('#email').val();
		const message = $('#message').val();
		const price = $('#total').val();
		const paymentCondition = 0;
		const usePoint = $('#usepoint').val();
		const plusPoint = $('#pluspoint').val();
		
		
		//const point = $('#usepoint').val();
		//const customProductNo = $('#customProductNo').val();
		
		$.ajax({
			url:"/purchase/api/insertPurchase",
			method:"POST",
			data:JSON.stringify({
				name : name,
				address : address,
				phone : phone,
				email : email,
				message : message,
				price : price,
				paymentCondition : paymentCondition,
				usePoint : usePoint,
				plusPoint : plusPoint
				//customProductNo : customProductNo 리스트로...
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			dataType : "json",
			success : function(data){

				IMP.init('imp83644059'); 
				IMP.request_pay(
				    { 
		 		  	pay_method: data.paymentCondition,
		  		  	merchant_uid: data.purchaseNo,
		  		  	name: "상품",
		  		  	amount: data.price,
		   		 	buyer_email: data.email,
		   			buyer_name: data.name,
		  			buyer_tel: data.phone,
		  		  	buyer_addr: data.address,
		   		 	buyer_postcode: "01181"
					}, function(rsp) {
						console.log(rsp);
						if(rsp.success){
							var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num;
			  		      	
			  		      	 $.ajax({
			  		  			url:"api/verifyIamport",
			  		  			method:"POST",
			  		  			data:JSON.stringify({
			  		  				imp_uid : rsp.imp_uid,
			  		  				purchaseNo : rsp.merchant_uid,
			  		  				amount : rsp.paid_amount
			  		  			}),
			  		  			headers : {
			  		  				"Accept" : "application/json",
			  		  				"Content-Type" : "application/json"
			  		  			},
			  		  			dataType : "json",
			  		  			success : function(data){
			  		  				console.log(data);
			  		  				window.location.href='/purchase/getPurchase/' + data.purchase.purchaseNo;
			  		  			}
			  		      	 })
						}else{
							var msg = '결제에 실패하였습니다.';
					         msg += '에러내용 : ' + rsp.error_msg;
	
						}
					alert(msg);
				})
			}
		})
	}
	</script>
	
<jsp:include page="../layer/footer.jsp"></jsp:include>	
</body>
</html>