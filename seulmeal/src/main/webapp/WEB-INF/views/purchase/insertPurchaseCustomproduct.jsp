<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>구매 상세</title>

</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	 
	<h2>배송정보</h2>
	받으시는분 : ${purchase.name} <br/>
	주소 : ${purchase.address} <br/>
	휴대전화 : ${purchase.phone} <br/>
	배송메시지 : ${purchase.message} <br/><br/>
	
	<button id="ok">확인</button>

<jsp:include page="../layer/footer.jsp"></jsp:include>	
</body>
</html>