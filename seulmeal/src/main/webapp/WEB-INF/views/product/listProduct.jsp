<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<style type="text/css">
	.bi {
	  vertical-align: -.125em;
	  fill: currentColor;
	}
	
	.text-shadow-1 { text-shadow: 0 .125rem .25rem rgba(0, 0, 0, .25); }
	
	.card-cover {
	  background-repeat: no-repeat;
	  background-position: center center;
	  background-size: cover;
	}	
</style>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>

	<div class="container px-4 py-5" id="custom-cards">
    <h2 class="pb-2 border-bottom">이 상품 어떠세?</h2>
    	<div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-5 py-3">
			<c:forEach var="product" items="${list}">		
				<div class="col" style="margin-top:20px;">
					<div data-value="${product.productNo}" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-10 shadow-lg" style="background-image: url('../../resources/attachments/image/tetris.png');">
						<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
							<h2 class="display-6fw-bold">${product.name}</h2>
							<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${product.subContent}</h2>
							<h2>${product.price}원</h2>
							<h2>${product.calorie}Cal</h2>
							<div style="display:flex; justify-content:space-between;">
								<ul class="d-flex list-unstyled mt-auto">
									<li class="me-auto">
										<i class="bi bi-cart-plus-fill" style="font-size:2rem; color:black;"></i>				
									</li>							
								</ul>
								<ul class="d-flex list-unstyled mt-auto">
									<li class="d-flex align-items-center me-3">
										<i style="font-size:1.5rem; color:black;" class="bi bi-clipboard-heart-fill"></i>
										<small>&nbsp;${product.reviewCount}</small>
									</li>
									<li class="d-flex align-items-center">
										<i style="font-size:1.5rem;" class="bi bi-heart-fill"></i>
										<small>&nbsp;${product.likeCount}</small>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>			
			</c:forEach>
   		</div>
	</div>
	    
	<jsp:include page="../chatBot/chatBot.jsp"></jsp:include>
	
<jsp:include page="../layer/footer.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$(".card-cover").on("click",function(){
			const no =$(this).data("value");
			window.location.href = '/product/getProduct/'+no;
		})
	});	
</script>
</body>
</html>