<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>회원 목록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<h3>포인트</h3>
			<button  onclick="location.href='/user/chargeUserPoint'">포인트 충전</button>	

			
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>포인트 상태</th>
					<th>포인트</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="point" items="${pointList}">
				<tr>
					<th>${point.pointStatus}</th>
					<th>${point.point}</th>
					<th>${point.regDate}</th>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	<div class="container">
	<div class="row">		<div class="col-md-3"></div>
		<div class="col-md-6">
			<nav aria-label="...">
			  <ul class="pagination">
		  		<li class="page-item disabled">
			      <span class="page-link" data-value="1">Previous</span>
			    </li>
			  	<c:forEach var="i" begin="${page.beginUnitPage}" end="${page.endUnitPage}">
			  		<li class="page-item"><a class="page-link" href="/pont/listUserPoint/${i}">${i}</a></li>
			  	</c:forEach>
			  	<li class="page-item">
			      <a class="page-link" href="#">Next</a>
			    </li>
			  </ul>
			</nav>
		</div>
	</div>	
</div>
<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>