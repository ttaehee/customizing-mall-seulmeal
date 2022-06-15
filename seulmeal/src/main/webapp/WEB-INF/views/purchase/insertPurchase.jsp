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

<style>


	input{
	   width:300px;
	   height:50px;
	   border-top:none;
	   border-left:none;
	   border-right:none;
	   border-bottom:2px solid black;
	}
	
	*{
    list-style: none;
    margin: 0;
    padding: 0;
    font-size: 14px;
    box-sizing: border-box;
	}
	
	/* common */
	body{
	    padding: 30px;
	}
	.hide{
	    display: none;
	}
	.show{
	    display: block;
	}
	
	/* 셀렉트 영역 스타일 */
	.select{
	    position: relative;
	    padding: 5px 10px;
	    width: 300px;
	    height: 30px;


	    border-bottom: 2px solid black;
	    background-color: white;
	    background-image: url("https://img.icons8.com/material-rounded/24/000000/expand-arrow.png");
	    background-repeat: no-repeat;
	    background-position: 96% center;
	    cursor: pointer;
	}
	
	/* 옵션 영역 스타일 */
	.select ul{
	    position: absolute;
	    top: 30px;
	    left: 0;
	    width: 100%;
	    border:none;
	    border-radius: 5px;
	    background-color: white;
	    cursor: pointer;
	}
	.select ul li{
	    padding: 10px;
	    background: white;
	    border-radius: 5px;
	}
	.select ul li:hover{
		color: white;
	    background-color: black;
	}
	/* 아이콘 스타일 */
	i{
	    vertical-align: bottom;
	    margin-right: 5px;
	}
	i img{
	    width: 20px;
	}


</style>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<form class="cc" method="post">
	<div class="continer" style="width: 80rem; justify-content: center; display: flex;">
	
		<table class="table table-hover" >
	 
	        <thead>
	          <tr>
	            <th align="center">NO</th>
	            <th align="center">이미지</th>
	            <th align="center">상품명</th>
	            <th align="center">옵션</th>
	             <th align="center">수량</th>
	            <th align="center">합계</th>
	            <th align="center"></th>
	          </tr>
	        </thead>
	
			<tbody style="font-size:15px">
				<c:set var="total" value="0" />
				<c:set var="customprice" value="0" />
				<c:set var="i" value="0" />
				<c:forEach var="cpd" items="${customProductList}">
					<c:set var="i" value="${i+1}" />
					<c:set var="customprice" value="${cpd.price}" />
					<tr class="ct_list_pop">
						  <td align="left">${i}</td>
						  <td align="left" data-value="${cpd.product.productNo}" title="Click : 상품확인" >${cpd.product.thumbnail}</td>
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
						  	<button type='button' class="btn btn-outline-primary btn-sm minus" onclick="fnCalCount('minus',this);">-</button>
						  	&ensp; <span id ="count" name="count"> ${cpd.count} </span> &ensp;
						  	<button type='button' class="btn btn-outline-primary btn-sm plus" onclick="fnCalCount('plus',this);">+</button> 
						  </td>
						  <td align="left">
						  <span id="customprice" name="price">${cpd.price*cpd.count}</span>원</td>
						  <td align="left">
						  	<button type="button" class="btn btn-outline-primary change" onclick="window.location.href='/purchase/updateCustomProduct/' + ${cpd.customProductNo}">수정</button>
						  	<button type="button" class="btn btn-outline-primary delete" onclick="window.location.href='/purchase/deleteCustomProduct/' + ${cpd.customProductNo}">x</button>
						  </td>
						  <c:set var="total" value="${total+cpd.price*cpd.count}" />
						  
					  </tr>  
				  </c:forEach>
	        </tbody>
	      </table><br/>
	 </div>
	
	
	<div class="continer" style="justify-content: center; display: flex;">
	<div class="card" style="width: 100rem; border-radius: 10px; border: none;">
		<div class="card-body">
		    <h6 class="card-title"></h6>
		    <h8 class="card-subtitle mb-2 text-muted"></h8>
		    <p class="card-text">
				<div class="container" >
					<label class="placeholder-text" for="fname" id="placeholder-fname">
					   <div class="text">구매자</div>
					</label>
					<div>
					<input type="text" id="userId" name="userId" value="${user.userId}" readonly/><br/>
					</div><br/>
					<label class="placeholder-text" for="fname" id="placeholder-fname">
					   <div class="text">받으시는분</div>
					</label>
					<div>
					<input type="text" id="name" name="name" value="${user.userName}"></input><br/>
					</div><br/>
					<label class="placeholder-text" for="fname" id="placeholder-fname">
					   <div class="text">주소</div>
					</label>
					<div>
					<input type="text" id="address" name="address" " value="${user.address}"></input><br/>
					</div><br/>
					<label class="placeholder-text" for="fname" id="placeholder-fname">
					   <div class="text">휴대전화</div>
					</label>
					<div>
					<input type="text" id="phone" name="phone" value="${user.phone}"></input><br/>
					</div><br/>
					<label class="placeholder-text" for="fname" id="placeholder-fname">
					   <div class="text">이메일</div>
					</label>
					<div>
					<input type="text" id="email" name="email" value="${user.email}"></input><br/>
					</div><br/>
					<label class="placeholder-text" for="fname" id="placeholder-fname">
					   <div class="text">배송메시지</div>
					</label>
					<div>
					<input type="text" id="message" name="message"></input><br/>
					</div><br/>
					<label class="placeholder-text" for="fname" id="placeholder-fname">
					   <div class="text">가격</div>
					</label>
					<div>
					<input type="text" id="price" name="price" value="100" readonly></input><br/>
					</div><br/>
					<label class="placeholder-text" for="fname" id="placeholder-fname">
					   <div class="text">결제방법</div>
					</label>
					<div>
					
						
						<div class="select" data-role="selectBox">
						  <span date-value="optValue" class="selected-option"><!-- 선택된 옵션 값이 출력되는 부분 --></span>

						  <ul class="hide">
						    <li>
						    	<i><img src="https://img.icons8.com/material-outlined/24/000000/apple.png" alt="카드결제"/></i>카드결제
						    </li>
						    <li>
						    	<i><img src="https://img.icons8.com/windows/32/000000/banana.png" alt="포인트결제"/></i>포인트결제
						    </li>
						  </ul>
						</div>
					</div>
			</p>
			<br/>
			<button class="btn btn-primary" id="order" style="margin-left:200px; font-size:18px; border:1px black; background-color:white;" onClick="iamport()">결제하기</button>
		</div>
	</div>
	</div>
		
	</div>
	</form>
	
	
	<script type="text/javascript">
	
	const body = document.querySelector('body');
	const select = document.querySelector(`[data-role="selectBox"]`);
	const values = select.querySelector(`[date-value="optValue"]`);
	const option = select.querySelector('ul');
	const opts = option.querySelectorAll('li');

	/* 셀렉트영역 클릭 시 옵션 숨기기, 보이기 */
	function selects(e){
	    e.stopPropagation();
	    option.setAttribute('style',`top:${select.offsetHeight}px`)
	    if(option.classList.contains('hide')){
	        option.classList.remove('hide');
	        option.classList.add('show');
	    }else{
	        option.classList.add('hide');
	        option.classList.remove('show');
	    }
	    selectOpt();
	}

	/* 옵션선택 */
	function selectOpt(){
	    opts.forEach(opt=>{
	        const innerValue = opt.innerHTML;
	        function changeValue(){
	            values.innerHTML = innerValue;
	        }
	        opt.addEventListener('click',changeValue)
	    });
	}

	/* 렌더링 시 옵션의 첫번째 항목 기본 선택 */
	function selectFirst(){
	    const firstValue = opts[0].innerHTML;
	    values.innerHTML = `${firstValue}`
	}

	/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
	function hideSelect(){
	    if(option.classList.contains('show')){
	        option.classList.add('hide');
	        option.classList.remove('show');
	    }
	}

	selectFirst();
	select.addEventListener('click',selects);
	body.addEventListener('click',hideSelect);
	
	
	
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