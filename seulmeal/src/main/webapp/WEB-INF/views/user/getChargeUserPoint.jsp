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
    width:300px;
    height:300px;
    margin:0 auto;
}
</style>

</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
<div id="wrap">
<div class="box">
<h1>포인트 충전</h1>
<input name="point" >원

 <button type="button" class="btn btn-default">충전하기</button>
</div>
</div>

<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>