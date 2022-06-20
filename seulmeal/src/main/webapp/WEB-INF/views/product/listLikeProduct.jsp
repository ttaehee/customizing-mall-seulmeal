<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">

<meta charset="UTF-8">
<title>찜 목록 관리</title>
</head>
<body>

<jsp:include page="../layer/header.jsp"></jsp:include>

	<div class="container">
		
		<div class="row" style="border-top: thick double #ff4500; border-bottom: thick double #ff4500; margin-bottom: 1rem; margin-top: 2rem;">
			<div class="col-6">
				<h1 class="pt-5 mb-4 fw-bold" style="padding-left: 30px;">찜 목록 관리</h1>
			</div>
		</div>
		
		
		<table class="table table-hover text-center">
			<p style="text-align: right;">*</p>
			
			<thead style="background-color: #ff4500; color: #fff;">
				<tr>
					<th>음식카테고리명</th>
					<th>상품명</th>
					<th>가격</th>
					<th>등록일자</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="like" items="${list}" varStatus="status">
				<tr>
					<th style="padding-left: 50px; text-align: left;"><a href="/product/getProduct/${like.productNo }">[${like.product.Foodcategory.name}] ${like.product.name}</a></th>
					<th>${like.product.price}</th>
					<th>${like.regDate}</th>
					<th>	<div data-value="${like.product.productNo}" class="btn-delete" id="deleteLike" style="cursor: pointer;">
						좋아요 취소</div>
					</th>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
	<div class="container">
	<div class="row" style="justify-content : center;">
			<nav aria-label="...">
			  <ul class="pagination">
			  	<c:forEach var="i" begin="${page.beginUnitPage}" end="${page.endUnitPage}">
			  		<li class="page-item"><a class="page-link" href="/product/listLike/${i}/${searchCondition}">${i}</a></li>
			  	</c:forEach>
			  </ul>
			</nav>
		</div>
	</div>	
</div>
		
<jsp:include page="../layer/footer.jsp"></jsp:include>

<script> 
$(function(){ 

	  $(".btn-delete").click(function(){
		  const no =$(this).data("value");
		window.location.href = '/product/updateLikeProduct/'+no;
	  });
	  
	});
</script>
</body>
</html>