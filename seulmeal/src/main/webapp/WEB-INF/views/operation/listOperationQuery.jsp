<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<title>문의 목록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="container">
		<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
		    문의관련
		  </button>
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
		    <li><a href="/operation/getListOperation/3/0/0">답변중인 문의</a></li>
		    <li><a href="/operation/getListOperation/3/0/1">답변완료 문의</a></li>
		    <li><a href="/operation/insertOperation/3">문의 등록</a></li>
		  </ul>
		</div>
		<div class="row">
			<div class="col-md-1">번호</div>
			<div class="col-md-3">제목</div>
			<div class="col-md-3">등록날짜</div>
			<div class="col-md-2">답변여부</div>
		</div>
		<c:forEach var="post" items="${list}">
			<c:set var="i" value="${i+1}" />
			<div class="row">
				<div class="col-md-1">${i}</div>
				<div class="col-md-3">
					<c:if test="${post.publicStatus ==0 }">
						<a href="/operation/getOperation/${post.postNo}">${post.title}</a>
					</c:if>
					<c:if test="${post.publicStatus ==1 }">
						<a href="/operation/getOperation/${post.postNo}">${post.title}</a>
						<i class="bi bi-lock-fill"></i>
					</c:if>					
				</div>
				<div class="col-md-3">${post.regDate}</div>
				<div class="col-md-2">
					<c:if test="${post.answerStatus == 0}">X</c:if>
					<c:if test="${post.answerStatus == 1}">O</c:if>
				</div>
				<hr/>
			</div>
		</c:forEach>
	</div>
	<div class="container">
	<div class="row">
		<div class="col-md-3"></div>
			<div class="col-md-6">
				<nav aria-label="...">
				  <ul class="pagination">
			  		<li class="page-item disabled">
				      <span class="page-link" data-value="1">Previous</span>
				    </li>
				  	<c:forEach var="i" begin="${page.beginUnitPage}" end="${page.endUnitPage}">
				  		<li class="page-item"><a class="page-link" href="/operation/getListOperation/3/${i}">${i}</a></li>
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