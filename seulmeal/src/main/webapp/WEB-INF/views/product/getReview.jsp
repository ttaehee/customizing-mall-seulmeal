<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>


<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>리뷰 조회</title>


<head>

<script>
	
</script>

<style>
</style>

</head>


<body>
	<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
		<div class="card-body">
			<table class="table table-hover text-center">
				<thead style="background-color: #4b6cb7; color: #fff;">
					<tr>
						<th>작성자</th>
						<th>제목</th>
						<th>내용</th>
						<th>별점</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>${review.user.userId}</th>
						<th>${review.title }</th>
						<th>${review.content }</th>
						<th>${review.rating }</th>
						<th>${review.regDate }</th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>


</html>