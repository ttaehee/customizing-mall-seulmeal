<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">
      
</script>

<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<title>SeulMeal Main</title>
<style type="text/css">	
	@charset "UTF-8";

	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	body {
		font-family: 'GmarketSansMedium';
		margin:0;
		padding:0;
	}
	
	a:link {
		color: black; 
		text-decoration: none;
	}
	a:visited {
		color:black;
		text-decoration: none;
	}

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

	
	.bi {
		vertical-align: -.125em;
		fill: currentColor;
	}
	
	.text-shadow-1 { 
		text-shadow: 0 .125rem .25rem rgba(0, 0, 0, .25);
	}
	
	.card-cover {
		background-repeat: no-repeat;
		background-position: center center;
		background-size: cover;
	}
	
</style>

</head>
<body> <!-- #BAD7DF -->
	
	<jsp:include page="../layer/header.jsp"></jsp:include>
	<div id="carouselExampleIndicators" class="carousel slide">
	<div class="your-class">
		<c:forEach var="post" items="${listE}">
			<div class="carousel-inner"  id="eventBanner"  data-value="${post.postNo}">
				<c:if test="${post.thumnail == null}">
					<img style="width: 100%; height:600px;" src="/resources/attachments/image/tetris.png" alt="">
				</c:if>
				<c:if test="${post.thumnail != null}">
					<img style="width: 100%; height:600px;" src="/resources/attachments/${post.thumnail}" alt="">
				</c:if>
				<div class="carousel-caption d-none d-md-block">
					<h2 class="display-6 fw-bold">${post.title}</h2>
					<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${post.shortContent}shortContent</h2>
					<h2 class="endDateView">~${post.endDate}</h2>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<!-- carousel iamge-slie 
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<c:forEach var="post" items="${listE}">
				<c:set var="i" value="${ i+1 }" />
				<li data-target="#carouselExampleIndicators" data-slide-to="${i}"></li>
			</c:forEach>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="../../../resources/attachments/image/seulMeal.png" alt="First slide" style="height:600px;">
			</div>
			<c:forEach var="post" items="${listE}">
				<div class="carousel-item" data-value="${post.postNo}" id="eventBanner">
					<c:if test="${post.thumnail == null}">
						<img class="d-block w-100" src="../../../resources/attachments/image/tetris.png" alt="First slide" style="height:600px;">
					</c:if>
					<c:if test="${post.thumnail != null}">
						<img class="d-block w-100" src="../../../resources/attachments/${post.thumnail}" alt="Second slide" style="height:600px;">
					</c:if>			
					<div class="carousel-caption d-none d-md-block">
						<h2 class="display-6 fw-bold">${post.title}</h2>
						<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${post.shortContent}shortContent</h2>
						<h2 class="endDateView">~${post.endDate}</h2>
					</div>
				</div>
			</c:forEach>   
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
	 -->
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
	
	
	<section class="text-center">
	<div class="container px-4 py-5" id="custom-cards">
    <h2 class="pb-2 border-bottom">이 상품 어떠세?</h2>
    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
	<c:forEach var="product" items="${list}">		
			<div class="col">
				<div data-value="${product.productNo}" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('/resources/attachments/${product.thumbnail}');">
					<div class="d-flex flex-column h-100 p-5 pb-0 text-white text-shadow-1">
						<h2 class="display-6fw-bold">${product.name}</h2>
						<h4 class="pt-5 mt-5 mb-5 display-6fw-bold"/>
						<h5>${product.price}원</h5>
						<h5>${product.calorie}Cal</h5>
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
	<jsp:include page="../chatBot/chatBot.jsp"></jsp:include>
	</main>		
	<jsp:include page="../confirm.jsp"></jsp:include>
	<jsp:include page="../layer/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<script type="text/javascript">
const $jq = jQuery.noConflict();
$jq(document).ready(function() {
	$jq('.your-class').slick({
		autoplay : true,
		dots : true, /* 하단 점 버튼 */
		speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
		infinite : true,
		autoplaySpeed : 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
		arrows : true,
		slidesToShow : 1,
		slidesToScroll : 1,
		touchMove : true, /* 마우스 클릭으로 끌어서 슬라이딩 가능여부 */
		nextArrows : true, /* 넥스트버튼 */
		/* prevArrows : true,
		arrow : true, */
		fade : false
	});
});
	
	$(function(){
		$(".overflow-hidden").on("click",function(){
			const no =$(this).data("value");
			window.location.href = '/product/getProduct/'+no;
		})
		
				
		$("#eventBanner").on("click",function(){
			const no = $(this).data("value");
			console.log(no)
			window.location.href="/operation/getOperation/2/"+no;
		});
	})
		
	
</script>
</body>
</html>