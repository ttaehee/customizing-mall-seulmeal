<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스터마이징 옵션 다시 선택하기</title>
</head>
<body>

	<div id="changeModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg " role="document">
			<div class="modal-content">

				<!-- 헤더 -->
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalScrollableTitle">커스터마이징 옵션 다시 선택하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- 바디 -->
				<div id="follow-modal-body" class="modal-body">

					<form class="cc" name="insertCustom" method="post">
						<input type="hidden" name="productNo" value="${product.productNo}"/>
						<div class="container">
						<h3>${product.name}</h3> 
						
							<div class="card" style="width: 40rem; padding: 0px 0px 0px 50px; border-radius: 10px;">
							  <div class="card-body">
							    <h6 class="card-title" id="price">${product.price}원</h6>
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
					</form>

				</div>

				<!-- 푸터 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary status" style="margin-right:10px;" name=cartStatus value="0" onClick="fncInsertCustomProduct(this)">적용하기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
	
<script type="text/javascript">
	
	const minusNo = [];
	const minusName = [];
	
	//form insertCustomProduct
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
	
	//상품구성재료 제외하기버튼 클릭
	$(function() {
	    $('.execpt').on('click', function() {
	        const partsNo = $(this).attr('data-partsNo');	        
	        minusNo.push(partsNo);
	        	       	        
	        const partsName = $(this).attr('data-partsName'); 
	        minusName.push(partsName);
	        
	        alert(partsName+" 제외되었습니다.");
	        console.log("minusNo : "+minusNo);
	        
	        $(this).attr("disabled","disabled");
	    })
	});
	
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
			
	        const minus = parseInt($("#total").text()) - calprice;
	        $("#total").text(minus);
		}else{
			num+=10;
			$(ths).closest("div").find("span[name='gram']").text(num);
	
	        const plus = parseInt($("#total").text()) + calprice;
	        $("#total").text(plus);
		}
		const pgram = parseInt($(ths).closest("div").find("span[name='gram']").text(num));
		const ppgram = $(ths).closest("div").find("input[name='plusGram']").val(num);
		const pprice = $(ths).closest("div").find("span[name='partsprice']").val();
		console.log($(ths).closest("div").find("input[name='plusGram']").val())
	
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
			        	console.log(data);
	
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
		               
		                
		                const productprice = $("#total").text();
		                const result = parseInt(productprice)+parseInt(data.price);
		                $("#total").text(result);
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
			                     console.log(data);
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
		      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
					console.log(ui.item.label);
			 }
		 });
		 
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
	
	//추가재료 삭제
	function fncClose(ths){
		 $(ths).closest("div").parent().remove();
		
	}
	
	//커스터마이징 한 상품 수량변경
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
	
</script>

</body>
</html>