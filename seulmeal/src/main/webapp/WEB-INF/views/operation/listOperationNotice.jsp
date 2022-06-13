<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>


	<div class="container">
		<div class="your-class">
	<div>
		<img src="/resources/attachments/image/tetris.png" alt="">
	</div>
	<div>
		<img src="/resources/attachments/image/tetris.png" alt="">
	</div>
	<div>
		<img src="/resources/attachments/image/tetris.png" alt="">
	</div>
	<div>
		<img src="/resources/attachments/image/tetris.png" alt="">
	</div>
</div>
		<div class="row" style="border-top: thick double #4b6cb7; border-bottom: thick double #4b6cb7; margin-bottom: 1rem; margin-top: 2rem;">
			<div class="col-6">
				<h1 class="pt-5 mb-4 fw-bold">공지사항</h1>
			</div>
			<div class="dropdown pt-5 mb-4 col-6">		  
			<div class="float-right" style="display:flex;">
				<div class="form-outline">
					<input type="search" id="form1" class="form-control" />
				</div>		  
					<button type="button" class="btn btn-primary">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</div>
		</div>
		
		
		<table class="table table-hover text-center">
			<thead style="background-color: #4b6cb7; color: #fff;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${list}">
				<tr>
					<th>${post.postNo}</th>
					<th>
						<a href="/operation/getOperation/1/${post.postNo}" class="link-dark text-decoration-none">${post.title}</a>
					</th>
					<th style="font-weight: bolder;">${post.user.userId}</th>
					<th>${post.regDate}</th>
					<th>${post.views}</th>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<hr/>
		<c:if test="${user.role == 1}">
			<div class="seulBtn" onclick="insertNotice()" style="float: right;">공지 작성</div>
		</c:if>
		<jsp:include page="../common/pageNavigator_new.jsp"/>
	</div>
	
<jsp:include page="../layer/footer.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function() {
	$('.your-class').slick({
		autoplay : true,
		dots : true, /* 하단 점 버튼 */
		speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
		infinite : true,
		autoplaySpeed : 30000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
		arrows : true,
		slidesToShow : 1,
		slidesToScroll : 1,
		touchMove : true, /* 마우스 클릭으로 끌어서 슬라이딩 가능여부 */
		nextArrows : true, /* 넥스트버튼 */
		/* prevArrows : true,
		arrow : true, */
		fade : false
	});
});

	function insertNotice(){
		window.location.href = "/operation/insertOperation/1";
	}
</script>
</body>
</html>