<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세조회</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- css body 적용 -->
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>-->
	
<style>	
	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	body {
		font-family: 'GmarketSansMedium';
	}
	
	h2{
		text-align: center;
	}
    .star {
        position: relative;
        font-size: 2rem;
        color: #ddd;
    }
    
    .star input {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        opacity: 0;
        cursor: pointer;
    }
    
    .star span {
        width: 0;
        position: absolute; 
        left: 0;
        color: red;
        overflow: hidden;
        pointer-events: none;
    }
    
    .inputBtn{
    }
    .inputBtnE{
    	text-align: center;
    	border: 1px solid #ddd;
		box-shadow: 0.5px 0.5px gray;
		cursor: pointer;
    }
    
    .inputBtn:hover{
    	color:red;
    }
    
    
    textarea{
        width: 100%;
        height: 500px;
        resize: none;
        -webkit-border-radius: 5px;
	    -moz-border-radius: 5px;
	    border-radius: 5px;
    }
    
    .img-thumbnail{
    	margin : 10px;
    	width : 100%;
    	height: 550px;
    	margin : auto;
    	vertical-align:middle;
    }
    
    .box-line{
    	border: 1px solid #ddd;
    	padding : 20px;
    	max-height: 500px;
    	min-height: 500px;
    }
    .col-md-6{
    	/*border: 1px solid #ddd;*/
    	padding : 10px;
    }
    .btn{
    	&+&{
    		margin:20px;
    	}
    }
    
    .card-bottom{
    	position: absolute;
    	bottom: 0;
    	width:100%;
    }
    
</style>

</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layer/header.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->
	<div class="container">
		<div class="row">
	  		<div class="col-md-6" style="height:700px">
	  			<c:if test="${!empty product.name}">
	  				<img src="../images/uploadFiles/${product.name}" alt="..." class="img-thumbnail" onerror="this.src='http://folo.co.kr/img/gm_noimage.png'">
	  			</c:if>
	  			<c:if test="${empty product.name}">
	  				<img src="http://folo.co.kr/img/gm_noimage.png" alt="..." class="img-thumbnail">
	  			</c:if>
				<div class="card-bottom" style="position: absolute; bottom: 0;">
					<h3>평점 :
						<c:if test="${!empty product.averageRating}">
							${product.averageRating}
						</c:if>
						<c:if test="${empty product.averageRating}">
							평가 없음
						</c:if>
					</h3>
				</div>
	  		</div>
			<div class="col-md-6" style="height:700px">
				<div style="text-align:center;"><h1 style="font-size:50px;">${product.name}</h1></div>
				<div style="display:flex; justify-content: space-between;">
					<div></div>
					<h2>${product.price } 원</h2>
				</div>
				<div class="box-line">
					<div style="display:flex; justify-content: space-between;">
						<h4>${user.userId} 님을 위한 혜택</h4>
						<input id="coupon" type="hidden" name="coupon" value="" />
						<button class="btn btn-primary couponBtn" >쿠폰 받기</button>
					</div>
					<hr/>
					<div>
						<div style="display:flex; justify-content: space-between;">
							<h5>최대 할인가</h5>
							<h4 style="color:red;">${product.price }원</h4>
						</div>
						<div style="display:flex; justify-content: space-between;">
							<h5>등록 일자</h5>
							<h4>${product.regDate}</h4>
						</div>
						<div style="border: 1px solid #dce0e3; padding:10px; background-color: #f7f8fa; max-height:250px;">
							<h4>간단 설명</h4>
							<h5>${product.subContent}</h5>
							<h4>들어간 재료</h4>
							<c:forEach var="parts" items="${product.parts}">
								<h5>${parts.name}</h5>
							</c:forEach>							
						</div>
					</div>
					<br/>
				</div>
				<!-- -->
				
				<div class="col-md-12">
					<div class="row">
							<div style="margin-top:10px; width: 100%;">
								<c:if test="${product.stock !=0}"> 
									<button class="btn btn-primary" style="width:100%;">구매하기</button>	
								</c:if>
								<c:if test="${product.stock ==0}">
									<button class="btn btn-primary" disabled="disabled">구매하기</button>	
								</c:if>
							</div>
						<div style="margin-top:10px; width: 100%;">
							<div style="display:flex; justify-content: space-between; margin-top: 10px">
								<button class="btn btn-primary" style="width:32%;">문의하기</button>
								<button class="btn btn-primary" style="width:32%;">장바구니</button>
								<button class="btn btn-primary" style="width:32%;">관련상품</button>
							</div>
						</div>
				</div> 
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	const fncCoupon = (()=>{
	    const num = [];
		    for(let i=1; i<100; i++){
		        num.push(i);
		    }
		    const result = [];
		    
		    for(let i=0; i<1; i++){
		        const index= Math.floor(Math.random()*(num.length-i));
		        if(num[index]<11 && 1<num[index]){
		            result.push("1");
		            break;
		        }
		        if(num[index]<16 && 11<num[index]){
		            result.push("2");
		            break;
		        }
		        result.push("0");
		        //num.splice(index,1);
		    }
		    let display;
				switch(result[0]) {
				case "1" : display ="10%할인권";
					break;
				case "2" : display ="20%할인권";
					break;
				default : display = "꽝";
			}
	    	alert(display);
	    	$('.couponBtn').attr("disabled","disabled");
		    $.ajax(
		    	{
		    		url : "/coupon/json/addCoupon",
		    		method : "GET",
		    		data : {
		    			salePercent : result[0],
		    			eventNum : "1"
		    		},
		    		dataType : "json",
		    		success : function(data, status) {
		    			
		    		}
		    	}		
		    )		    
	})    
	
	function fncCart(){
		const userId = "${user.userId}"
		const productNo = "${product.productNo}"
		$.getJSON("/cart/json/addCart",{
					userId : userId,
					productNo : productNo
				},
				(data,status)=>{
					if(status =='success'){
						$(".btn-primary:contains('장바구니')").attr("disabled","disabled");
						alert("추가완료")						
					}
				}
		)
	}
	
	$(function() {
		 // 구매 버튼
		 $(".btn-primary:contains('구매')").on("click", function(){
			 self.location = "/purchase/addPurchase?productNo=${product.productNo}";
		 })
		 
		 // 쿠폰버튼
		 $(".btn-primary:contains('쿠폰')").on("click", function(){
			 fncCoupon();
		 })
		 
		 // 쿠폰버튼
		 $(".btn-primary:contains('장바구니')").on("click", function(){
			 fncCart();
		 })
	});
</script>
</body>
</html>