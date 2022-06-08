<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>아임포트</title>

	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body>

<script type="text/javascript">
function iamport(){
	
	const userId = document.getElementById("userId").value();
	const name = document.getElementById("userName").value();
	const address = document.getElementById("address").value();
	const phone = document.getElementById("phone").value();
	const message = document.getElementById("message").value();
	const price = document.getElementById("price").value();
	const point = document.getElementById("usePoint").value();
	const customProductNo = document.getElementByName("customProductNo").value();
	
	$.ajax({
		url:"/purchase/api/insertPurchase",
		method="POST",
		data:JSON.stringify({
			userId : userId,
			name : name,
			address : address,
			phone : phone,
			message : message,
			price : price,
			point : point,
			customProductNo : customProductNo
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
	 		  	pay_method: data.paymentCondition
	  		  	merchant_uid: data.purchaseNo,
	  		  	name: data.name,
	  		  	amount: data.price,
	   		 	buyer_email: "gildong@gmail.com",
	   			buyer_name: data.userId,
	  			buyer_tel: "010-1111-1111",
	  		  	buyer_addr: data.address,
	   		 	buyer_postcode: "01181",
	   
				console.log(rsp);
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
	  		      	
	  		      	 $.ajax({
	  		  			url:"purchase/api/verifyIamport",
	  		  			method="POST",
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
<button onclick="iamport()">결제하기</button>
</body>
</html>