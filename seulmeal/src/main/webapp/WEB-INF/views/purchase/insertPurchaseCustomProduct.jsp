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
	 
	<br/>
	<h2>커스터마이징</h2><br/>
	<h2>${product.name}</h2> <h5>${product.price}원</h5>
	!! 재료 추가,제외를 원하지 않는 분은 설정을 그대로 진행해주세요 !!<br/><br/>
	==============================================================
	
	<h5>제품구성</h5>
	*제외를 원하는 재료의 수량은 0으로 설정해주세요*<br/>
	<c:forEach var="parts" items="${partsList}">
	${parts.name} &emsp;&emsp; <button id="minus" onclick='count("minus")'>-</button>&ensp; 1<br/><br/>
	</c:forEach>
	
	==============================================================<br/>
	<h5>추가재료</h5>
	*추가를 원하는 재료는 검색 후 추가해주세요 (한번 추가당 10g)*<br/>
	<div>
		재료 검색 : <input class="search" /><div class="partSearch">검색</div>
		<div class="parts"></div>
	</div><br/>
	
	==============================================================<br/>
	커스터마이징 상품 수량 &emsp;&emsp; <button id="minus" onclick='count("minus")'>-</button>&ensp; 1 &ensp; <button id="plus" onclick='count("plus")'>+</button> <br/><br/>
	==============================================================<br/>
	총 상품금액 :<div id="total">${product.price}</div>
	<br/><br/>
	
	<button id="ok">확인</button><br/><br/>
	
	<script type="text/javascript">
	
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
		                +"<div class='part' data-parts='"+data.partsNo+"'>"+ data.name +"</div>"
		                +"</div>"
		        	$(".parts").append(parts);
		                
		        	const price = "<div> <input type='hidden' name='partsNo' value='"+data.partsNo+"' /> <input type='hidden' name='partsName' value='"+data.name+"' />"
	                +"<div class='part' data-parts='"+data.partsNo+"'>"+ data.price +"</div>"
	                +"</div>"
	        		$(".parts").append(price);
	                
	                $(".parts").append(`<button id="minus" onclick='count("minus")'>-</button> 1 <button id="plus" onclick='count("plus")'>+</button> <br/><br/>`)
	                
	                const product = $("#total").text();
	                const result = parseInt(product)+parseInt(data.price);
	                $("#total").text(result);
		        }
			})
		})
	})
	
	function count(type){
		const resultElement=document.getElementById('result');
		let number=resultElement.innerText;
		
		if(type == 'plus'){
			number = parseInt(number)+1;
		}else if(type == 'minus'){
			number = parseInt(number)-1;
		}
		
		resultElement.innerText=number;
	}
	
</script>

<jsp:include page="../layer/footer.jsp"></jsp:include>	
</body>
</html>