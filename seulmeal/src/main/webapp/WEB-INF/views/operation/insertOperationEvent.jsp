<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
<div class="container">
		<div class="container px-4 py-5" id="custom-cards">
			<div class="row row-cols-1 row-cols-lg-10 align-items-stretch g-4 py-3">
				<div class="col">
					<div id="imageThumbnail" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('../../../resources/attachments/image/tetris.png');">
						<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
							<h1 id="titleView" class="fw-bold">Title</h1>
							<h2 id="shortContentView" class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">ShortContent</h2>
							<h2 class="endDateView">2022-08-11</h2>
							<ul class="d-flex list-unstyled mt-auto">
								<li class="me-auto">
									<img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
								</li>
								<li class="d-flex align-items-center me-3">
									<i class="bi bi-emoji-heart-eyes"></i><br/>
									<small>0</small>
								</li>
									<li class="d-flex align-items-center">
									<i class="bi bi-calendar-date"></i>
									<small id="end_date">2022-08-11</small>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<form action="/operation/insertOperation" method="POST">
	제목 : <input id="title" name="title" />
	짧은내용 : <input id="shortContent" name="shortContent" />
	썸네일 : <input type="file" id="image" accept="image/*" onchange="readURL(event);"/>
	기간 : <input id="endDate" type="date" name="endDate" />
	내용 : <input name="content" />
	아이디 : <input name="userId" />
	<input type="hidden" name="postStatus" value="2" />
	<button type="submit">저장</button>
</form>
<jsp:include page="../layer/footer.jsp"></jsp:include>
<script>
	function readURL(){
		const reader = new FileReader();
		
		reader.onload = function(event){
			$("#imageThumbnail").css({"background":"url("+event.target.result+")"});
		}
		
		reader.readAsDataURL(event.target.files[0]);
	}
	
	$("#title").on("keyup",function(){
		$("#titleView").text($(this).val());
	});
	
	$("#shortContent").on("keyup",function(){
		$("#shortContentView").text($(this).val());
	});
	
	$("#endDate").on("change",function(){
		$("#end_date").text($(this).val());
		$(".endDateView").text($(this).val());
	});
</script>
</body>
</html>