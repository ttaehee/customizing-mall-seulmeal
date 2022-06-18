<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>구매 상세</title>

</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>

	<style>
		
		h2{
			text-align: center; 
		}

		h2:after {
			content: "";
			display: block;
			width: 300px;
			border-bottom: 1px solid #bcbcbc;
			margin: 20px auto;
		}
		
		h5:after {
	        content: "";
	        display: block;
	        width: 100px;
	        border-bottom: 1px solid #bcbcbc;
	        margin: 20px 0px;
		}
		
		.close {
		  display:inline-block;
		  padding:2px 5px;
		  font-weight: 700;
		  text-shadow: 0 1px 0 #fff;
		  font-size: 1rem;
		}
		
		.close:hover {
		  border: 0;
		  cursor:pointer;
		  opacity: .75;
		}
		
		.card {
	        margin: 0 auto; 
	        float: none;
	        margin-bottom: 10px; 
		}		
		
	</style>
	
	<form class="cc" name="insertCustom" method="post">
		<input type="hidden" name="productNo" value="${product.productNo}"/>
		<div class="container">
		<h2>커스터마이징 : ${product.name}</h2> 
		
		<!-- <div class="row" style="justify-content: center; display: flex;"> -->
		
			<div class="card" style="width: 40rem; padding: 0px 0px 0px 50px; border-radius: 10px;">
			  <div class="card-body">
			    <h6 class="card-title" id="price">${product.price}원</h5>
			    <h8 class="card-subtitle mb-2 text-muted">!! 재료 추가,제외를 원하지 않는 분은 설정을 그대로 진행해주세요 !!</h8>
			  </div>
			</div>
		    
			<div class="card" style="width: 40rem; padding: 0px 0px 0px 50px; border-radius: 10px;">
			  <div class="card-body">
			    <h6 class="card-title">제품구성</h6>
			    <h6 class="card-subtitle mb-2 text-muted"></h6>
			    <p class="card-text"><c:forEach var="parts" items="${partsList}">
					<div class="container productparts">${parts.name} &emsp;&emsp; 
					<button type="button" class="btn btn-outline-primary execpt" style="margin-right:10px;" data-partsNo="${parts.productPartsNo}" data-partsName="${parts.name}">제외하기</button>
					</div>
					</c:forEach>
				</p>
			  </div>
			</div>
			
			<div class="card" id="insertcard" style="width: 40rem; padding: 0px 0px 0px 50px; border-radius: 10px;">
				<div class="card-body">
				    <h6 class="card-title">추가재료</h6>
				    <h8 class="card-subtitle mb-2 text-muted">*추가를 원하는 재료는 검색 후 추가해주세요 (한번 추가당 10g)*</h8>
				    <p class="card-text">
						<div class="container">
							재료 검색 : 
								<div style="display:flex;">	
									<div class="form-outline">
										<input name="searchKeyword" type="search" class="form-control search" value="" />
									</div>		  
									<button type="button" class="btn btn-primary partSearch" onclick="search()">
										<i class="bi bi-search"></i>
									</button>
								</div>
						</div>
						<div class="container">
							<div class="plusparts"></div>
						</div>
					</p>
				  </div>
			</div>	  

		  		<div class="card" style="width: 40rem; padding: 0px 0px 0px 50px; border-radius: 10px;">
					<div class="card-body">
					    <h6 class="card-title"></h6>
					    <h8 class="card-subtitle mb-2 text-muted"></h8>
					    <p class="card-text">
							<div>커스터마이징상품 금액 :&ensp;<span id="total">${product.price}</span>원</div><br/>
	
					
							<div>커스터마이징상품 수량 :<span id="count">
								<button type='button' class="btn btn-outline-primary btn-sm minus" onclick="fnCalCount('minus',this);">-</button>
						        &ensp; <span id="customProductCount" class="count" name="count">1</span> &ensp; 
						        <button type='button' class="btn btn-outline-primary btn-sm plus" onclick="fnCalCount('plus',this);">+</button></span>
						    </div>
						</p>
	
					</div>
				</div><br/>

		<div class="container">
				<div class="container" style="display: flex; justify-content: center;">
					<button type="button" class="btn btn-primary status" style="margin-right:10px;" name=cartStatus value="0" onClick="fncInsertCustomProduct(this)">바로 구매하기</button>
					<button type="button" class="btn btn-primary status" style="margin-right:10px;" name=cartStatus value="1" onClick="fncInsertCustomProduct(this)">장바구니 담기</button>
					 <button type="button" class="btn btn-primary" onclick="history.back(-1)">취&nbsp;소</button>
				</div><br/><br/>	
		</div>
	</form>
	

		
	<script type="text/javascript">
	
	const minusNo = [];
	const minusName = [];

	function fncInsertCustomProduct(ths) {
		
		alert("제외한 재료 : "+minusName)
		const count = $("#customProductCount").text();
		const customprice= $("#total").text();
		const cartStatus = $(ths).val();
		
		$(".cc").append(`<input name ="count" value="\${count}">`);
		$(".cc").append(`<input name ="minusNoA" value="\${minusNo}">`);
		$(".cc").append(`<input name ="minusNameA" value="\${minusName}">`);
		$(".cc").append(`<input name ="price" value="\${customprice}">`);
		$(".cc").append(`<input name ="cartStatus" value="\${cartStatus}">`);
		$(".cc").attr("method" , "POST").attr("action" , "/purchase/insertCustomProduct").submit();
	 }

	
	$(function() {
	    $('.execpt').on('click', function() {
	        const partsNo = $(this).attr('data-partsNo');	        
	        minusNo.push(partsNo);
	        	       	        
	        const partsName = $(this).attr('data-partsName'); 
	        minusName.push(partsName)
	        
	        alert(partsName+" 제외되었습니다.");
	        console.log("minusNo : "+minusNo)
	        
	        $(this).attr("disabled","disabled");
	    })
	});
	
	function search(){
		var word = $(".search").val();
		console.log(word);
		
		if(word == null || word.length<1){
			alert("추가할 재료이름을 입력하세요.");
		}
	}
	
	
	function fnCalGram(type, ths){
		var stat = $(ths).closest("div").find("span[name='gram']").text();
		var num = parseInt(stat,10);		
		let calprice = parseInt($(ths).closest("div").find("span[name='partsprice']").text());

		if(type=='minus'){
			num-=10;
			if(num<10){
				alert('더이상 줄일수 없습니다.');
				return;
			}

			$(ths).closest("div").find("span[name='gram']").text(num);
			
            const minus = parseInt($("#total").text()) - calprice;
            $("#total").text(minus);
		}else{
			num+=10;
			$(ths).closest("div").find("span[name='gram']").text(num);

            const plus = parseInt($("#total").text()) + calprice;
            $("#total").text(plus);
		}
		const pgram = parseInt($(ths).closest("div").find("span[name='gram']").text());
		console.log(pgram)
		const ppgram = $(ths).closest("div").find("input[name='plusGram']").val(10);
		const pprice = $(ths).closest("div").find("input[name='plusPrice']").val();
		console.log($(ths).closest("div").find("input[name='plusGram']"))
		
		console.log($(ths).closest("div").find("span[name='gram']").text());
	}
	
	
	function fnCalCount(type, ths){
		var statcount = $(ths).parents("div").find("span[name='count']").text();
		var number = parseInt(statcount,10);
		let calprice = parseInt($("#total").text());

		if(type=='minus'){
			number--;
			if(number<1){
				alert('더이상 줄일수 없습니다.');
				return;
			}
			$(ths).parents("div").find("span[name='count']").text(number);

		}else{
			number++;
			$(ths).parents("div").find("span[name='count']").text(number);
		}
	}
	
	
	 $(function(){
		$(".partSearch").on("click",()=>{
			fncEnter();
		})
	})
	
	function fncEnter(){
		 $.ajax({
				url:"/product/api/getPartsName/"+$(".search").val(),
				method:"GET",
		        headers : {
		            "Accept" : "application/json",
		            "Content-Type" : "application/json"
		        },
		        dataType : "json",
		        success : function(data){	        	
		        	console.log(data);

		        	const parts = "<div class='searchparts'> <input type='hidden' class='partsNo' name='partsNo' value='"+data.partsNo+"' /> <input type='hidden' class='partsName' name='partsName' value='"+data.name+"' />"
		        	+"<input type='hidden' class='price' name='plusprice' value='"+data.price+"' />"
		            +"<br/><div class='parts' data-parts='"+data.partsNo+"'>"+ data.name + "<button type='button' class='btn btn-primary' onClick='fncClose(this)'>x</button>"
		            +"<div class='partsprice' name=partsprice' data-parts='"+data.partsNo+"'>"
		            +"<div name=partsPrice' data-parts='"+data.partsNo+"'><span name='partsprice'>"+ data.price +"</span>원<br/>"
		            +"<input type='hidden' name='plusGram' value='10'/>"
		            +`<button type='button' class="btn btn-outline-primary btn-sm minus" onclick="fnCalGram('minus',this);">-</button>
         			&ensp; <span class='gram' name='gram'>10</span> &ensp; 
        			<button type='button' class="btn btn-outline-primary btn-sm plus" onclick="fnCalGram('plus',this);">+</button>`
	               + "</div></div></div></div>" 

	               $(".search").val('');
	               $(".plusparts").append(parts);
	               
	                
	                const productprice = $("#total").text();
	                const result = parseInt(productprice)+parseInt(data.price);
	                $("#total").text(result);
		        }
			})
	 }
	
	
	 $(".search").keydown(function(key){
		        if(key.keyCode==13) {
			           fncEnter();
			    }     
	});
	

	document.insertCustom.addEventListener("keydown", evt => {
		  if (evt.code === "Enter") 
		  evt.preventDefault();
		});
	
	
	function fncClose(ths){
		 $(ths).closest("div").parent().remove();
		
	}
	
</script>

<jsp:include page="../layer/footer.jsp"></jsp:include>	
</body>
</html>