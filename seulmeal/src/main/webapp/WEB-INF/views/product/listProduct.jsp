<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="row">
		<div class="col-2"></div>
		<c:forEach var="product" items="${list}">
			<div class="col-2">
				<div style="width:200px; height:200px;">${product.thumbnail}</div>
				<div><h3><a href="/product/getProduct/${product.productNo}">${product.name}</a></h3></div>
				<div>
					<span>${product.price}</span>
				</div>
				<div>${product.subContent}</div>
				<div>
					<c:forEach var="parts" items="${product.parts}">							
						<span>${parts.name}</span>					
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
	
					
	
	
<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>