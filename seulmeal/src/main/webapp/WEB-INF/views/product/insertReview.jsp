<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>리뷰 등록</title>
</head>
<style>
  .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }
</style>

<script>
const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
  }
</script>

<body>
<form action="/product/insertReview/${product.productNo }" method="POST">
	상품명 : ${product.name} <br/>
	작성자명 : ${user.userName }<br/>
	리뷰 제목 : <input name = "title"/><br/>
	리뷰 내용 : <input name = "content"/><br/>
	별점 : <input name = "rating"/><br/>
<br/>
	<button type="submit">저장</button>
	
	</form>
</body>
</html>