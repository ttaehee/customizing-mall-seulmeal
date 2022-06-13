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
	
	<form class="cc">
		<input type="hidden" name="productNo" value="${product.productNo}"/>
		<div class="container">
		<h2>커스터마이징 : ${product.name}</h2> 
		<h5 id="price">${product.price}원</h5></div>
		<div class="container">!! 재료 추가,제외를 원하지 않는 분은 설정을 그대로 진행해주세요 !!</div><br/><br/>
	
		
		<div class="container">
		<h5 >제품구성</h5></div>
		<c:forEach var="parts" items="${partsList}">
		<div class="container productparts">${parts.name} &emsp;&emsp; 
		<button type="button" class="btn btn-outline-primary execpt" style="margin-right:10px;" data-partsNo="${parts.partsNo}" data-partsName="${parts.name}">제외하기
		<input class="hiddenNo" type="hidden" name="minusNo" value=""/>
		<input class="hiddenName" type="hidden" name="minusName" value=""/>  </div>
		</c:forEach>
		<br/><br/>
	
		
		<div class="container">
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
			</form> 
		</div>
		<div class="container">
			<div class="plusparts"></div> <!-- 여기에 플러스파츠정보 들어옴 -->
		</div><br/><br/>
		
		
		<div class="container">커스터마이징상품 금액 :<span id="total">${product.price}</span>원</div>
		<br/><br/>
		
		<div class="container">커스터마이징상품 수량 :<span id="count">
			<button type='button' class="btn btn-outline-primary btn-sm minus" onclick="fnCalCount('minus',this);">-</button>
	        &ensp; <span class='count' name='count'>1</span> &ensp; 
	        <button type='button' class="btn btn-outline-primary btn-sm plus" onclick="fnCalCount('plus',this);">+</button></span>원</div>
		<br/><br/>
		
		<div class="container">
		
		<button type="button" class="btn btn-primary status" style="margin-right:10px;" data-cartStatus="1" onClick="fncInsertCustomProduct()">장바구니 담기</button>
		<a class="btn btn-primary status" href="#" role="button">취&nbsp;소</a>
		<input class="hiddenStatus" type="hidden" name="cartStatus" value="0"/> 
		</div>
	</form>

		
	<script type="text/javascript">
	
	function fncInsertCustomProduct() {
		$(".cc").attr("method" , "POST").attr("action" , "/purchase/insertCustomProduct").submit();
	 }
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "a[href='#' ]").on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
				$("form")[0].reset();
		});
	});	

	$(function() {
	    $('.execpt').on('click', function() {
	        var partsNo = $(this).attr('data-partsNo');  
	        $(this).closest('div').find('.hiddenNo').val(partsNo);

	        var partsName = $(this).attr('data-partsName'); 
	        $(this).closest('div').find('.hiddenName').val(partsName);
	    });
	    
	    $('.status').on('click', function() {
	        var status = $(this).attr('data-cartStatus');    
	        $(this).closest('div').find('.hiddenStatus').val(status);
	        console.log(status);
	    });
	});
	
	function fnCalGram(type, ths){
		var stat = $(ths).closest("div").find("span[name='gram']").text();
		console.log(stat);
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
		        	const parts = "<div class='searchparts'> <input type='hidden' name='partsNo' value='"+data.partsNo+"' /> <input type='hidden' name='partsName' value='"+data.name+"' />"
		        	+"<input type='hidden' name='price' value='"+data.price+"' />"
		            +"<div class='parts' data-parts='"+data.partsNo+"'>"+ data.name
		            +"<div class='partsprice' name=partsprice' data-parts='"+data.partsNo+"'><span name='partsprice'>"+ data.price +"</span>원<br/>"
		            +`<button type='button' class="btn btn-outline-primary btn-sm minus" onclick="fnCalGram('minus',this);">-</button>
            		&ensp; <span class='gram' name='gram'>10</span> &ensp; 
           		 <button type='button' class="btn btn-outline-primary btn-sm plus" onclick="fnCalGram('plus',this);">+</button>`
	               + "</div></div>"
		        	$(".plusparts").append(parts);    
	                
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