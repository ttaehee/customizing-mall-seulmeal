<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>장바구니 목록</title>

</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>

	<style>
		
		h2{
			text-align: left; 
		}

		h2:after {
			content: "";
			display: block;
			width: 170px;
			border-bottom: 1px solid #bcbcbc;
			margin: 20px 0px;
			padding:0px 10px 0px 10px;
		}
		
		h5:after {
	        content: "";
	        display: block;
	        width: 250px;
	        border-bottom: 1px solid #bcbcbc;
	        margin: 20px auto;
		}
		
		button:hover{
			color: #FF607F;
		}
		
		img{
			width: 70px;
			height: 70px;
		}	
		
		h6:after {
	        content: "";
	        display: block;
	        width: 80px;
	        border-bottom: 2px solid #000000;
	        margin: 20px 0px;
	        margin-top: 10px;
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
	
	
	<form class="list" name="list">
	 <div class="container">
	  <div class="row">
		 <div class="col-xs-4" style="padding: 100px 0px 0px 40px;">
		 	<h2>장바구니</h2>
		 </div>
		 <div class="col-xs-4">
		 	<div style="border:1px solid; padding:1px 0px 10px 12px; margin:20px; width:600px; margin-top:80px; border-radius: 3px; border-color: #969696;">
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
		 					<hr style="border:1px solid; width:400px; bottom:15px"/>
		 					<div align="center" style="padding: 0px 0px 0px 30px;">가용포인트 : ${user.totalPoint} P</div>
		 				</div>				
		 			</div>
		 	</div>
		 </div>
		 <div class="col-xs-4">
			 <br/><br/>
		 	<svg xmlns="http://www.w3.org/2000/svg" width="100px" height="100px" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16" style="padding: 50px 0px 0px 0px;">
  			<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
			</svg>
		 </div>
		</div><br/>
		
		 <table class="table table-hover" style="width: 1000px;">
	 
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
						  <td align="left" data-no="${cpd.product.productNo}" title="Click : 상품확인" ><img src='/resources/attachments/${cpd.product.thumbnail}'></td>
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
						  	<button type='button' class="btn btn-outline-primary btn-sm minus" data-no="${cpd.customProductNo}" onclick="fnCalCartCount('minus',this);">-</button>
						  	&ensp; <span id ="count" name="count"> ${cpd.count} </span> &ensp;
						  	<button type='button' class="btn btn-outline-primary btn-sm plus" data-no="${cpd.customProductNo}" onclick="fnCalCartCount('plus',this);">+</button> 
						  </td>
						  <td align="left">
						  <span id="customprice" name="price">${cpd.price*cpd.count}</span>원</td>
						  <td>
						  	<div>
				                <p><a type="button" class="change" data-value="${cpd.customProductNo}"  data-toggle="modal" data-target="#changeModal">옵션선택다시하기</a>
				                <a type="button" class="delete" data-value="${cpd.customProductNo}">&ensp;x</a>
				            </div>
						  </td>
						  <c:set var="total" value="${total+cpd.price*cpd.count}" />
						  
					  </tr>  
				  </c:forEach>
	        </tbody>
	      </table><br/>
	      
	      <div class="container" style="justify-content: center; display:flex;">
				<h5>결제예정 금액 :  <span id="total">${total}</span>원</h5>
				<div style="border:none; float:right">
				<button class="button" id="order" style="margin-left:200px; padding: 5px; font-size:20px; border:1px #FF4500; background-color:white;" onclick="fncInsertPurchase()">전체상품주문</button>
				</div>
		</div>
		
		
		<!-- 페이징처리 -->
		<div class="container">
			<div class="row" style="justify-content : center;">
				<nav aria-label="...">
				  <ul class="pagination">
				  	<c:forEach var="i" begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}">
				  		<li class="page-item"><a class="page-link" href="/purchase/getListCustomProduct/${i}">${i}</a></li>
				  	</c:forEach>
				  </ul>
				</nav>
			</div>
		</div>	
		
	</div>
	</form>
		
		<!-- Modal -->
		<div id="changeModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg " role="document">
			<div class="modal-content">

				<!-- 헤더 -->
				<div class="modal-header" style="background-color: #282828; color: white;">
					<h3 class="modal-title" id="productName"></h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;">
						<span aria-hidden="true">&times;</span>
					</button><br/>
										
				</div>

				<!-- 바디 -->
				<div id="follow-modal-body" class="modal-body" style="background-color: #282828;">

					<form class="cc" name="insertCustom" method="post">
						<input type="hidden" id="customProductNo" name="customProductNo"/>
						<div class="container"> 
						    
							<div class="card" style="width: 40rem; padding: 0px 0px 0px 50px; border-radius: 10px;">
							  <div class="card-body">
							    <h6 class="card-title">제품구성</h6>
							    <p class="card-text">
										<div class="container productParts">
										</div>
								</p>
							  </div>
							</div><br/>
							
							<div class="card" id="insertcard" style="width: 40rem; padding: 0px 0px 0px 50px; border-radius: 10px;">
								<div class="card-body">
								    <h6 class="card-title">추가재료</h6>
								    <h8 class="card-subtitle mb-2 text-muted">*추가를 원하는 재료는 검색 후 추가해주세요 (한번 추가당 10g)*</h8>
								    <p class="card-text">
										<div class="container">
											재료 검색 : 
												<div style="display:flex;">	
													<div class="form-outline">
														<input name="searchKeyword" type="search" class="form-control search" value=""/>
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
							</div><br/>
				
					  		<div class="card" style="width: 40rem; padding: 0px 0px 0px 50px; border-radius: 10px;">
								<div class="card-body">
								    <h8 class="card-subtitle mb-2 text-muted"></h8>
								    <p class="card-text">
										<div>커스터마이징상품 금액 :&ensp;<span id="customPrice"></span>원</div><br/>
				
										<div>커스터마이징상품 수량 :
											<button type='button' class="btn btn-outline-primary btn-sm mi" onclick="fnCalCount('minus',this);">-</button>
									        &ensp; <span id="customProductCount" name="optionCount">1</span> &ensp; 
									        <button type='button' class="btn btn-outline-primary btn-sm pl" onclick="fnCalCount('plus',this);">+</button>
									    </div>
									</p>
				
								</div>
							</div><br/>
					</form>

				</div>

				<!-- 푸터 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary status" style="margin-right:10px;" onClick="fncUpdateCustomProduct(this)">적용하기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
			
<jsp:include page="../layer/footer.jsp"></jsp:include>	

		
<script type="text/javascript">
	
	//insertPurchase submit
	function fncInsertPurchase() {
  		$(".list").attr("method" , "GET").attr("action" , "/purchase/insertPurchase").submit();
  	  }
	
	//장바구니 수량변경 후 가격디스플레이변경
	function fnCalCartCount(type, ths){
		var stat = $(ths).parents("td").find("span[name='count']").text();
		var num = parseInt(stat,10);
		var price = parseInt($(ths).parents("tr").find("span[name='price']").text());
		var oneprice = parseInt(price,10)/num;
		
		if(type=='minus'){
			num--;
			if(num<1){
				alert('더이상 줄일수 없습니다.');
				return;
			}
			$(ths).parents("td").find("span[name='count']").text(num);
			
			const minus = price - oneprice;
			$(ths).parents("tr").find("span[name='price']").text(minus);
			const minustotal = parseInt($("#total").text()) - oneprice;
			$("#total").text(minustotal);

		}else{
			num++;
			$(ths).parents("td").find("span[name='count']").text(num);
			
            const plus = price + oneprice;
            $(ths).parents("tr").find("span[name='price']").text(plus);
            const plustotal = parseInt($("#total").text()) + oneprice;
			$("#total").text(plustotal);
		}
		
		const customProductNo = $(ths).attr('data-no');
		console.log(customProductNo);
		const count = $(ths).parents("td").find("span[name='count']").text();
		console.log(count);
		
		$.ajax({
			url:"/purchase/api/updateCustomProduct/"+customProductNo+"/"+count,
			method:"GET",
	        headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	        },
	        dataType : "json",
	        success : function(data){	
	        	
	        }
    	});	
		
	}
	
	
	$(function(){
		
		//모달창으로 상품번호 넘기기
		$(".change").on("click",function(){
			const customproductNo = $(this).data('value');		
			
			//상품구성재료
			$.ajax({
				url:"/purchase/api/getCustomProduct/"+customproductNo,
				method:"GET",
		        headers : {
		            "Accept" : "application/json",
		            "Content-Type" : "application/json"
		        },
		        dataType : "json",
		        success : function(data){	
		        	for(var i=0; i<data.partsList.length; i++){
		        		const productParts = "<div class='partsList'><span>"+data.partsList[i].name+"</span> &emsp;&emsp;"
						+"<button type='button' class='btn btn-outline-primary execpt' style='margin-right:10px;' data-partsNo='"+ data.partsList[i].productPartsNo +"' data-partsName='" + data.partsList[i].name +"' onClick='fncExcept(this)'>제외하기</button></div>"
		        		
		        		$(".productParts").append(productParts);
		        	}

	               $("#customProductNo").val(data.customProduct.customProductNo);
	               $("#productName").text(data.customProduct.product.name);
	               $("#customPrice").text(data.customProduct.product.price);
		        }
	    	});	
			
		});
		
		//장바구니리스트에서 삭제
		$(".delete").on("click",function(){
			var del = confirm("장바구니에서 삭제할까요?");	
			const customproductNo = $(this).data('value');
			if(del){
				window.location.href="/purchase/deleteCustomProduct/"+customproductNo;
			}
		});
		
		
	})
	
	//모달자바스크립트시작
	//제외재료번호, 이름 배열
	const minusNo = [];
	const minusName = [];
	
	//form insertCustomProduct
	function fncUpdateCustomProduct(ths) {
		
		alert("제외한 재료 : "+minusName)
		const count = $("#customProductCount").text();
		const customprice= $("#customPrice").text();
		const cartStatus = $(ths).val();
		
		$(".cc").append(`<input type="hidden" name ="count" value="\${count}">`);
		$(".cc").append(`<input type="hidden" name ="minusNoA" value="\${minusNo}">`);
		$(".cc").append(`<input type="hidden" name ="minusNameA" value="\${minusName}">`);
		$(".cc").append(`<input type="hidden" name ="price" value="\${customprice}">`);
		$(".cc").append(`<input type="hidden" name ="cartStatus" value="1">`);
		$(".cc").attr("method" , "POST").attr("action" , "/purchase/updateCustomProduct").submit();
	 }
	
	//상품구성재료 제외하기버튼 클릭
	function fncExcept(ths) {
	        const partsNo = $(ths).attr('data-partsNo');	        
	        minusNo.push(partsNo);
	        	       	        
	        const partsName = $(ths).attr('data-partsName'); 
	        minusName.push(partsName);
	        
	        alert(partsName+" 제외되었습니다.");
	        
	        $(ths).attr("disabled","disabled");
	 }
	
	//추가재료 검색
	function search(){
		var word = $(".search").val();
		
		if(word == null || word.length<1){
			alert("추가할 재료이름을 입력하세요.");
		}
	}
	
	//추가재료 g변경
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
			
	        const minus = parseInt($("#customPrice").text()) - calprice;
	        $("#customPrice").text(minus);
		}else{
			num+=10;
			$(ths).closest("div").find("span[name='gram']").text(num);
	
	        const plus = parseInt($("#customPrice").text()) + calprice;
	        $("#customPrice").text(plus);
		}
		const pgram = parseInt($(ths).closest("div").find("span[name='gram']").text(num));
		const ppgram = $(ths).closest("div").find("input[name='plusGram']").val(num);
		const pprice = $(ths).closest("div").find("span[name='partsprice']").val();
	
	}
	
	//추가재료 검색
	function fncGetParts(){
		const inputTag = $(".partSearch").parent('div').find("input[name='searchKeyword']");
		
		if(inputTag.val().trim() != null){
			if(inputTag.val() != $('.name').text()){
				$.ajax({
					url:"/product/api/getPartsName/"+$(".search").val(),
					method:"GET",
			        headers : {
			            "Accept" : "application/json",
			            "Content-Type" : "application/json"
			        },
			        dataType : "json",
			        success : function(data){	        	
	
			        	const parts = "<div class='searchparts'> <input type='hidden' class='partsNo' name='plusPartsNo' value='"+data.partsNo+"' /> <input type='hidden' class='partsName' name='plusName' value='"+data.name+"' />"
			        	+"<input type='hidden' class='price' name='plusPrice' value='"+data.price+"' />"
			            +"<br/><div class='parts' data-parts='"+data.partsNo+"'>"+"<span class='name'>" +data.name + "</span><button type='button' class='btn btn-primary' onClick='fncClose(this)'>x</button>"
			            +"<div class='partsprice' name=partsprice' data-parts='"+data.partsNo+"'>"
			            +"<div name=partsPrice' data-parts='"+data.partsNo+"'><span name='partsprice'>"+ data.price +"</span>원<br/>"
			            +"<input type='hidden' name='plusGram' value='10'/>"
			            +`<button type='button' class="btn btn-outline-primary btn-sm minus" onclick="fnCalGram('minus',this);">-</button>
	         			&ensp; <span class='gram' name='gram'>10</span> &ensp; 
	        			<button type='button' class="btn btn-outline-primary btn-sm plus" onclick="fnCalGram('plus',this);">+</button>`
		               + "</div></div></div></div>" 
	
		               $(".search").val('');
		               $(".plusparts").append(parts); 
		                              
		                const productprice = $("#customPrice").text();
		                const result = parseInt(productprice)+parseInt(data.price);
		                $("#customPrice").text(result);
			        }
				})
			}else{
				alert("이미 추가되어있는 재료입니다.");
				inputTag.val('');
			}
		}
	 }
	
	//추가재료 검색 + autocomplete
	 $(function(){ 
		 $(".search").autocomplete({ 
			 source : function(request, response) { //source: 입력시 보일 목록
			     $.ajax({
			           url : "/purchase/api/autocomplete"   
			         , type : "POST"
			         , dataType: "JSON"
			         , data : {value: request.term}	// 검색 키워드
			         , success : function(data){ 	// 성공
			        	 response(
			                 $.map(data.resultList, function(item) {
			                     return {
			                    	     label : item.NAME,    	// 목록에 표시되는 값
			                             value : item.NAME 		// 선택 시 input창에 표시되는 값
			                     };
			                 })
			             );    //response
			         }
			         ,error : function(){ //실패
			             alert("오류가 발생했습니다.");
			         }
			     });
			 }
				,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
					return false;
				},
				minLength: 1,// 최소 글자수
				delay: 100	//autocomplete 딜레이 시간(ms),
				, select : function(evt, ui) { 
		      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value를 가짐
					console.log(ui.item.label);
			 }
		 });
		 
		 //모달위에 autocomplete appendTo
		 $("#changeModal").on("shown.bs.modal", function() {
			  $(".searchS").autocomplete("option", "appendTo", "#changeModal")
			})
		 
		$(".partSearch").on("click",()=>{
			
			fncGetParts();
		})
		
		//추가재료 검색 엔터적용
		$(".search").keydown(function(key){
			        if(key.keyCode==13) {
				           fncGetParts();
				    }     
		});
		
	})
	
	//엔터 시 submit 방지
	document.insertCustom.addEventListener("keydown", evt => {
		  if (evt.code === "Enter") 
		  evt.preventDefault();
	});
	document.list.addEventListener("keydown", evt => {
		  if (evt.code === "Enter") 
		  evt.preventDefault();
	});
	
	//추가재료 삭제
	function fncClose(ths){
		 $(ths).closest("div").parent().remove();
		
	}
	
	//커스터마이징 한 상품 수량변경
	function fnCalCount(type, ths){
		var statcount = $(ths).parents("div").find("span[name='optionCount']").text();
		var number = parseInt(statcount,10);
	
		if(type=='minus'){
			number--;
			if(number<1){
				alert('더이상 줄일수 없습니다.');
				return;
			}
			$(ths).parents("div").find("span[name='optionCount']").text(number);
	
		}else{
			number++;
			$(ths).parents("div").find("span[name='optionCount']").text(number);
		}
	}
	
	//모달창 닫으면 추가한데이터 삭제
	$('#changeModal').on('hidden.bs.modal', function (e) {
		$(this).find('.search').val('');
		$(this).find('.partsList').remove();
		$(this).find('.searchparts').remove();
	});

	
</script>

</body>
</html>