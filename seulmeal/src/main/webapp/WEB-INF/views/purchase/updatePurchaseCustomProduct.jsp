<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
		
		#close {
		  display:inline-block;
		  padding:2px 5px;
		  font-weight: 700;
		  text-shadow: 0 1px 0 #fff;
		  font-size: 1rem;
		}
		#close:hover {
		  border: 0;
		  cursor:pointer;
		  opacity: .75;
		}
		
	</style>
	 
	
	<div class="container">
	<h2>커스터마이징 : ${customProduct.product.name}</h2> 
	<h5 id="productprice">${customProduct.product.price}원</h5>
	<div>!! 재료 추가,제외를 원하지 않는 분은 설정을 그대로 진행해주세요 !!</div><br/><br/>


	<div>
	<h5 >제품구성</h5></div>
	<c:forEach var="parts" items="${partsList}">
	<div class="container productparts">${parts.name} &emsp;&emsp; 
	<button class="btn btn-outline-primary" id="execpt" style="margin-right:10px;">제외하기 </div>
	</c:forEach>
	<br/><br/>
	
	
	<div>
	<h5>추가재료</h5>
	*추가를 원하는 재료는 검색 후 추가해주세요 (한번 추가당 10g)*</div>
	<div class="container">
		재료 검색 : 
		<form class="searchProduct">
			<div style="display:flex;">	
				<div class="form-outline">
					<input name="searchKeyword" type="search" class="form-control search" />
				</div>		  
				<button type="button" class="btn btn-primary partSearch">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form> 
		<div class="customparts"></div>
	</div><br/><br/>
	
	
	<div class="custom">커스터마이징 상품 수량 &emsp;&emsp; 
	<button type='button' class="btn btn-outline-primary btn-sm minus" onclick="fnCalCount('minus',this);">-</button>
	&ensp; <span name='count'>${customProduct.count}</span> &ensp; 
	 <button type='button' class="btn btn-outline-primary btn-sm plus" onclick="fnCalCount('plus',this);">+</button> </div><br/>
	
	
	<div>총 상품금액 :<div id="total">${customProduct.price*customProduct.count}원</div></div>
	<br/><br/>
	
	<div>
	<button class="btn btn-primary" style="margin-right:10px;">적용하기/button> 
	</div>
	</div>

		
	<script type="text/javascript">
	
	function fnCalCount(type, ths){
		var stat = $(ths).parents("div").find("span[name='count']").text();
		var num = parseInt(stat,10);
		let calprice = 0;
		
		if($(ths).parents("div").attr('class') === 'container custom'){
			calprice = parseInt($("#productprice").text());
		}else if($(ths).parents("div").attr('class') === 'customparts'){
			calprice = parseInt($("#partsprice").text());
		}
		
		if(type=='minus'){
			num--;
			if(num<1){
				alert('더이상 줄일수 없습니다.');
				return;
			}
			$(ths).parents("div").find("span[name='count']").text(num);
			
            const minus = parseInt($("#total").text())-calprice;
            $("#total").text(minus);
		}else{
			num++;
			$(ths).parents("div").find("span[name='count']").text(num);
			
            const plus = parseInt($("#total").text())+calprice;
            $("#total").text(plus);
		}
	}
	
	
	$(()=>{
		$(".partSearch").on("click",()=>{
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
		        	const parts = "<div> <input type='hidden' name='partsNo' value='"+data.partsNo+"' /> <input type='hidden' name='partsName' value='"+data.name+"' />"
		                +"<div class='parts' data-parts='"+data.partsNo+"'>"+ data.name +"<span id='close'>x</span></div>"
		        	$(".customparts").append(parts);
		                
		        	const price = "<div> <input type='hidden' name='partsNo' value='"+data.partsNo+"' /> <input type='hidden' name='partsPrice' value='"+data.price+"' />"
	                +"<div class='parts' id='partsprice' data-parts='"+data.partsNo+"'>"+ data.price +"원</div>"
	                +"</div>"
	        		$(".customparts").append(price);
	                
	                $(".customparts").append(`<div class="customparts">
	                		<button type='button' class="btn btn-outline-primary btn-sm minus" onclick="fnCalCount('minus',this);">-</button>
	                		&ensp; <span name='count'>1</span> &ensp; 
	                		 <button type='button' class="btn btn-outline-primary btn-sm plus" onclick="fnCalCount('plus',this);">+</button> </div>`)
	                
	                const productprice = $("#total").text();
	                const result = parseInt(productprice)+parseInt(data.price);
	                $("#total").text(result);
		        }
			})
		})
	})
	
</script>

<jsp:include page="../layer/footer.jsp"></jsp:include>	
</body>
</html>