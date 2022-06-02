<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>이벤트 목록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<a href="/operation/insertOperation/2">이벤트 등록</a>
	<a href="/operation/getListOperation/2/0"></a>
	<div class="container">
		<div class="row">
			<c:forEach var="post" items="${list}">
				<c:set var="i" value="${i+1}" />
				<div class="col-sm-12">
					<div class="card">
				      <div class="card-body">
				        <h5 class="card-title">${post.title }</h5>
				        <p class="card-text">${post.shortContent}</p>
				        <a href="/operation/getOperation/${post.postNo}" class="btn btn-primary">Go somewhere</a>
				      </div>
				    </div>
			    </div>				
			</c:forEach>			
	    </div>
    </div>
	<div>${page }</div>
<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>