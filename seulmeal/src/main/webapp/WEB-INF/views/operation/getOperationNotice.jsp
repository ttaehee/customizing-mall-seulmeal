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
<title>공지사항 상세정보</title>
</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">				
				<div class="row">
					<div class="col-md-3">제목</div>
					<div class="col-md-9">${post.title}</div>
				</div>
				<div class="row">
					<div class="col-md-3">작성자</div>
					<div class="col-md-9">${post.user.userId}</div>
				</div>
				<div class="row">
					<div class="col-md-3">작성일</div>
					<div class="col-md-3">${post.regDate}</div>
					<div class="col-md-3">조회수</div>
					<div class="col-md-3">${post.views}</div>
				</div>
				<hr />
				<div class="row">
					${post.content}
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-9"></div>
					<span><button>수정</button> <button>목록</button></span>						
				</div>
				<hr>
				<div>다음글</div>
				<div>이전글</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>