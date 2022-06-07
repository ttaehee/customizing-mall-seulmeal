<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>공지사항 목록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<a href="/operation/insertOperation/1">공지 등록</a>
			<hr/>
			<div class="col-md-3"></div>
			<div class="col-md-6" style="width: 100%;">
				<c:forEach var="post" items="${list}">
					<c:set var="i" value="${i+1}" />
					<div class="row">
						<div class="col-md-1">${i}</div>
						<div class="col-md-3"><a href="/operation/getOperation/${post.postNo}">${post.title}</a></div>
						<div class="col-md-3">${post.regDate}</div>
						<div class="col-md-2"><button>삭제</button></div>
						<hr/>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="../common/pageNavigator_new.jsp"/>
<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>