<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="../../resources/css/body.css">
<meta charset="UTF-8">
<title>SeulMeal Main</title>
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
	
	.carousel-control.left, .carousel-control.right {
    background-image: none
}
</style>
</head>
<body> <!-- #BAD7DF -->
	<jsp:include page="./layer/header.jsp"></jsp:include>
	
	<!-- carousel iamge-slie -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="resources/attachments/image/tetris.png" alt="First slide" style="height:500px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="resources/attachments/image/tetris.png" alt="Second slide" style="height:500px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="resources/attachments/image/tetris.png" alt="Third slide" style="height:500px;">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	<!-- 
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active" >
	      <img src="resources/attachments/image/tetris.png" class="d-block w-100" alt="..." style="height:500px;">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>First slide label</h5>
	        <p>Some representative placeholder content for the first slide.</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="https://t.ly/j26ep" class="d-block w-100" alt="..." style="height:500px;">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>Second slide label</h5>
	        <p>Some representative placeholder content for the second slide.</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="https://t.ly/j26ep" class="d-block w-100" alt="..." style="height:500px;">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>Third slide label</h5>
	        <p>Some representative placeholder content for the third slide.</p>
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	 -->
	<main role="main">
	<section class="jumbotron text-center">
	<div class="container px-4 py-5" id="custom-cards">
    <h2 class="pb-2 border-bottom">이 상품 어떠세?</h2>
    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
	<c:forEach var="product" items="${list}">		
			<div class="col">
				<div data-value="${product.productNo}" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('../../resources/attachments/image/tetris.png');">
					<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
						<h2 class="display-6fw-bold">${product.name}</h2>
						<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${product.subContent}</h2>
						<h2>${product.price}원</h2>
						<h2>${product.calorie}Cal</h2>
						<ul class="d-flex list-unstyled mt-auto">
							<li class="me-auto">
								<i class="bi bi-cart-plus-fill" style="font-size:2rem; color:black;"></i>
							</li>
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
	</c:forEach>
    </div>
	</div>
	    
	</section>
	<jsp:include page="./chatBot/chatBot.jsp"></jsp:include>
	</main>		
	<jsp:include page="confirm.jsp"></jsp:include>
	<jsp:include page="./layer/footer.jsp"></jsp:include>
	
<script type="text/javascript">
	
	$(function(){
		$(".overflow-hidden").on("click",function(){
			const no =$(this).data("value");
			window.location.href = '/product/getProduct/'+no;
		})
		
		$('.carousel').carousel({
		  interval: 1000
		})
	})
</script>
</body>
</html>