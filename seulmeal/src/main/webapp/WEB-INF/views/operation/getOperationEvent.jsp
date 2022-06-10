<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세정보</title>
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
	
	#tumbCard{
		background-image: url('../../../../resources/attachments/${post.thumnail}');
		background-size: contain;
	    background-repeat: no-repeat;
	    background-position: center;
	    background-size: cover;
	}
</style>
</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>
	
	<!-- 이미지 -->
	<div class="row" style="margin-top:20px;">
		<div class="col">
			<div id="tumbCard" data-value="${post.postNo}" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg">
				<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
					<h2 class="display-6 fw-bold">${post.title}</h2>
					<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${post.shortContent}</h2>
					<h2 class="endDateView">~${post.endDate}</h2>
					<div style="display:flex; justify-content:space-between;">
						<ul class="d-flex list-unstyled mt-auto">
							<li class="me-auto">
								<i class="bi bi-cart-plus-fill" style="font-size:2rem; color:black;"></i>
							</li>							
						</ul>
						<ul class="d-flex list-unstyled mt-auto">
							<li class="d-flex align-items-center me-3" style="font-size:1.5rem; margin-right:5px;">
								<i class="bi bi-emoji-heart-eyes"></i><br/>
								<small>&nbsp;${post.views}</small>
							</li>
							<li class="d-flex align-items-center"  style="font-size:1.5rem; margin-left:5px;">
								<i class="bi bi-calendar-date"></i>
								<small>&nbsp;${post.endDate}</small>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="card-header" id="headingOne" style="display:flex; justify-content: center; font-size: 30px;">
		<!-- 1번 -->
		<h2 class="mb-0">
			<a class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				제목
			</a>
		</h2>

		<!-- 2번 -->
		<h2 class="mb-0">
			<a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				내용
			</a>
		</h2>

		<!-- 3번 -->
		<h2 class="mb-0">
			<a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				할인상품
			</a>
		</h2>
	</div>
		
	<div class="container" style="margin-top:20px;">
		<div id="accordion">			
			<div class="card">			
				<!-- 1번 -->
				<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
					<div class="card-body">
						Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
					</div>
				</div>
		
				<!-- 2번 -->
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
					<div class="card-body">
						${post.content }
					</div>
				</div>
		
				<!-- 3번 -->
				<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
					<div class="card-body">
						Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
					</div>
				</div>
				
			</div>		  
		</div>
	</div>
	<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>