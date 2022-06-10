<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
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
	<br/>
	<div class="container">
		<div class="dropdown">
			<div class="float-right" style="display:flex;">
				<button class="btn btn-primary" style="margin-right:10px;" onclick="insertEvent()">이벤트 등록</button>
				<div class="dropdown show">
					<a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						이벤트 목록
					</a>					
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="/operation/getListOperation/2/0/0">진행중인 이벤트</a>
						<a class="dropdown-item" href="/operation/getListOperation/2/0/1">종료된 이벤트</a>
						<a class="dropdown-item" href="/operation/insertOperation/2">이벤트 등록</a>
					</div>
				</div>
			    <!-- 
				<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					이벤트 목록
				</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="/operation/getListOperation/2/0/0">진행중인 이벤트</a></li>
					<li><a class="dropdown-item" href="/operation/getListOperation/2/0/1">종료된 이벤트</a></li>
					<li><a class="dropdown-item" href="/operation/insertOperation/2">이벤트 등록</a></li>
				</ul>
				 -->
				<div class="form-outline">
					<input type="search" id="form1" class="form-control" />
				</div>		  
					<button type="button" class="btn btn-primary">
					<i class="bi bi-search"></i>
				</button>
			</div>			
		</div>		
    </div>
    
    
	<div class="container">
		<div class="container px-4 py-5" id="custom-cards">
			<c:forEach var="post" items="${list}">	
				<div class="row row-cols-1 row-cols-lg-10 align-items-stretch g-4 py-3">
					<div class="col">
						<c:if test="${post.thumnail != null}">
							<div data-value="${post.postNo}" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('../../../../resources/attachments/${post.thumnail}');">
						</c:if>
						<c:if test="${post.thumnail == null}">
							<div data-value="${post.postNo}" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('../../../../resources/attachments/image/tetris.png');">
						</c:if>
						
							<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
								<h2 class="display-6 fw-bold">${post.title}</h2>
								<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${post.shortContent}shortContent</h2>
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
			</c:forEach>
		</div>		
	</div>
	<jsp:include page="../chatBot/chatBot.jsp"></jsp:include>
	
<div>
<jsp:include page="../layer/footer.jsp"></jsp:include>
</div>
<script type="text/javascript">
	$(function(){
		$(".card-cover").on("click",function(){
			const no =$(this).data("value");
			window.location.href = '/operation/getOperation/'+no;
		})
	})
	
	function insertEvent(){
		window.location.href = '/operation/insertOperation/2';
	}
</script>
</body>
</html>