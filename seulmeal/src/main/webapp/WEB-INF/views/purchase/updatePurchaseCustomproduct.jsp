<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>커스터마이징상품 등록</title>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>

	<jsp:include page="../layer/header.jsp"></jsp:include>
	<form action="/operation/insertOperation" method="POST" enctype="multipart/form-data">
	
	
	
	<input type="hidden" name="postStatus" value="1" />
	<button type="submit">저장</button>
	</form>
	<jsp:include page="../layer/footer.jsp"></jsp:include>	
 	
</body>
</html>