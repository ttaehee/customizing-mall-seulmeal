<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>구매 등록</title>

</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	구매자 : <input type="text" id="userId" name="userId" value="${user.userId}" readonly></input><br/>
	받으시는분 : <input type="text" id="name" name="name" value="${user.userName}"></input><br/>
	주소 : <input type="text" id="address" name="address" " value="${user.address}"></input><br/>
	휴대전화 : <input type="text" id="phone" name="phone" value="${user.phone}"></input><br/>
	이메일 : <input type="text" id="email" name="email" value="${user.email}"></input><br/>
	배송메시지 : <input type="text" id="message" name="message"></input><br/>
	가격 : <input type="text" id="price" name="price" value="100" readonly></input><br/>
	결제방법 : <select id=paymentCondition name="paymentCondition">
					<option value="1">카드결제</option>		
					<option value="2">포인트결제</option>		
			</select><br/>

	<button onclick="iamport()">결제하기</button>
	
	<script type="text/javascript">
	
	function iamport(){
		
		const userId = $('#userId').val();
		const name = $('#name').val();
		const address = $('#address').val();
		const phone = $('#phone').val();
		const email = $('#email').val();
		const message = $('#message').val();
		const price = $('#price').val();
		const paymentCondition = $('#paymentCondition').val();
		//const point = $('#point').val();
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
				paymentCondition : paymentCondition
				//point : point,
				//customProductNo : customProductNo
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