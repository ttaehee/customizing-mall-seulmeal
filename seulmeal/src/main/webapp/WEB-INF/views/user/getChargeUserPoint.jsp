<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #wrap{
    width:100%;
    height:100%;
}
  
#wrap .box{ 
    width:800px;
    height:300px;
    margin:0 auto;
} 
</style>

</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
<div id="wrap">
<div class="box">
<h1>포인트 충전 내역</h1>
<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>충전 포인트</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.price}p</div>
		</div>
</div>
</div>

<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>