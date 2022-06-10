<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
<script type="text/javascript">
function insertPoint() {
    const price = document.querySelector(".price").value;
    $.ajax({
        url:"/purchase/api/insertPurchase",
        method:"POST",
        data:JSON.stringify({
            price :price,
            status: 1,
        }),
        headers : {
            "Accept" : "application/json",
            "Content-Type" : "application/json"
        },
        dataType : "json",
        success : function(data){


            IMP.init('imp31272612'); // 콘솔에서 확인
            IMP.request_pay({
                pg : 'kcp',
                pay_method : 'card',
                merchant_uid : data.no,
                name : '포인트 충전' , //결제창에서 보여질 이름
                amount : data.price, //실제 결제되는 가격
                buyer_email : 'iamport@siot.do',
                buyer_name : data.member.name,
                buyer_tel : data.member.phone,
                buyer_addr : data.member.address,
                buyer_postcode : '123-456'
            }, function(rsp) {
                console.log(rsp);
                if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    $.ajax({
                        url:"/purchase/api/confirm",
                        method:"POST",
                        data:JSON.stringify({
                            imp_uid :rsp.imp_uid,
                            no :rsp.merchant_uid,
                            amount:rsp.paid_amount
                        }),
                        headers : {
                            "Accept" : "application/json",
                            "Content-Type" : "application/json"
                        },
                        dataType : "json",
                        success : function(data){
                        	
                            console.log(data);
                            if(data.success === "true"){
                            	
                            	const form = document.createElement('form');
                                form.method="post";
                                form.action="/point/insertPoint";
                                
                                const point = document.createElement('input');
                                const no = document.createElement('input');
                                
                                point.setAttribute("name","point");
                                point.setAttribute("value",data.purchase.amount);
                                
                                no.setAttribute("name","no");
                                no.setAttribute("value",data.purchase.no);

                                form.appendChild(point);
                                form.appendChild(no);
                                
                                document.body.appendChild(form);

                                form.submit();	
                            	
                            }
                            
                        }
                        
                    })
                    
                } else {
                     var msg = '결제에 실패하였습니다.';
                     msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
            
            
        }
        
    })
}

function iamport(){
	//가맹점 식별코드
	IMP.init('imp31272612'); // 콘솔에서 확인
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid : 06,
	    name : '상품1' , //결제창에서 보여질 이름
	    amount : 100, //실제 결제되는 가격
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '나다',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울 강남구 도곡동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	        $.ajax({
	        	url:"/product/cofirm",
	        	method:"POST",
	        	data:JSON.stringify({
	        		imp_uid :rsp.imp_uid,
		        	merchat_uid :rsp.merchant_uid,
		        	amount:rsp.paid_amount
	        	}),
	        	headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				success : function(data){
					console.log(data)
				}
	        	
	        })
	        
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
</script>
<input class="price" name="price" />
<button onclick="insertPoint()">Test</button>
</body>
</html>