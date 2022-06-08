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
			<div class="input-group col-md-3" style="justify-content: flex-end;">
				<button class="btn btn-primary" style="margin-right:10px;" onclick="insertEvent()">이벤트 등록</button>
				<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					이벤트 목록
				</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="/operation/getListOperation/2/0/0">진행중인 이벤트</a></li>
					<li><a class="dropdown-item" href="/operation/getListOperation/2/0/1">종료된 이벤트</a></li>
					<li><a class="dropdown-item" href="/operation/insertOperation/2">이벤트 등록</a></li>
				</ul>
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
						<div data-value="${post.postNo}" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('../../../resources/attachments/image/tetris.png');">
							<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
								<h2 class="display-6 fw-bold">${post.title}</h2>
								<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${post.shortContent}shortContent</h2>
								<h2 class="endDateView">~${post.endDate}</h2>
								<ul class="d-flex list-unstyled mt-auto">
									<li class="me-auto">
										<img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
									</li>
									<li class="d-flex align-items-center me-3">
										<i class="bi bi-emoji-heart-eyes"></i><br/>
										<small>&nbsp;${post.views}</small>
									</li>
										<li class="d-flex align-items-center">
										<i class="bi bi-calendar-date"></i>
										<small>&nbsp;${post.endDate}</small>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>	
	
	
<jsp:include page="../layer/footer.jsp"></jsp:include>
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