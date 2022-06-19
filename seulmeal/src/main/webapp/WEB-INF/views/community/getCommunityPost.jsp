<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시글 상세</title>


<style type="text/css">
.slick-prev:before {
	content: "<";
	color: black;
	font-size: 30px;
}

.slick-next:before {
	content: ">";
	color: black;
	font-size: 30px;
}

img {
	display: block;
	margin: auto;
}

/*
.your_class{
	text-align: center;
  	height: 50%;
  	width: 50%;
}
*/
span.a {
	display: inline;
	width: 500px;
	padding: 5px;
}

img.rounded-circle{
	width:60px;
	height:60px;
	
}

.info{
	display: flex;
}

#reg-date{
	text-align:right;
	margin-right: 15px;
}

.comment_count{
	margin-bottom: 0px;
}

#post-content-body{
	margin-bottom: 80px;
}


</style>


</head>

<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>

	<br />
	
	<div class="container">
	
	<div>
		<c:if test="${sessionScope.user.userId == post.user.userId}">
			<button id="updatePostBtn" type="button"
				class="btn btn-primary" onclick="location.href='/community/updatePost/${post.postNo}'">수정</button>
			<button id="deletePostBtn" type="button" 
				class="btn btn-primary"  onclick="location.href='/community/deletePost/${post.postNo}'">삭제</button>
		</c:if>
	</div>

		<!-- 게시글 이미지 또는 제목/간략내용 -->
		<div class="your-class" style="margin-bottom:30px">
				<c:forEach var="attachment" items="${attachmentList}">
					<div>
						<img style="height: 60vh;"
							src="/resources/attachments/${attachment.attachmentName}" alt="">
					</div>
				</c:forEach>
		</div>

		
		
		<div class="info">
			<!-- 프로필 이미지 -->
			<div class="user"> 
				<div class="profile-img">
					<c:if test="${not empty post.user.profileImage}">
						<img class="rounded-circle"
						src="/resources/attachments/profile_image/${post.user.profileImage}">
					</c:if>
					<c:if test="${empty post.user.profileImage}">
						<img class="rounded-circle"
						src="/resources/attachments/profile_image/default_profile.jpg">
					</c:if>
				</div>
				
				<!-- 닉네임 -->
				<div class="nick">
					<strong>${post.user.nickName}</strong>
				</div>
			</div>

		</div>



		<!-- 좋아요 -->		
		<div class="post_like">
			<i class="bi bi-heart"></i>
			<button id="insertLikeBtn" data-value="${post.postNo}" type="button"
				class="btn btn-primary">좋아요</button>
			<button id="deleteLikeBtn" data-value="${post.postNo}" type="button"
				class="btn btn-primary">좋아요 취소</button>
		</div>



		<!-- 제목, 내용 -->
		<div id="accordion" style="margin-top:50px;">			
				<div class="card" style="min-height: 500px;">
	
					<div id="post-title" class="card">
					  <div id="post-title-body" class="card-body" style="font-size: 25px">
							<strong>${post.title}</strong>
					  </div>
					</div>
					
					<div id="post-content" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
						<div id="post-content-body" class="card-body"  style="font-size: 18px">
							 ${post.content}
						</div>
					</div>
					
					<div class="comment_count">
						<span id="like_cnt">좋아요  <span class="like-cnt">${post.likeCount}</span>개</span>
						<i class="bi bi-eye"></i> <span id="v_cnt">${post.views}</span>
						<i class="bi bi-chat-left"></i> <span id="c_cnt">${post.commentCount}</span>
						<div id ="reg-date">${post.regDate}</div>
					</div>
				</div>
				
		</div>
		<!-- 제목, 내용 끝-->
	</div>


<!-- 댓글 컨테이너 -->
	<div class="container" style="margin-top:20px;">
	
		<!-- Comments section-->
		<div class="container">
			<section class="mb-5">
				<div class="card bg-light">
					<div class="card-body">

						<!-- Comment form-->
						<div class="mb-4">
							<textarea style="width: 90%;" id="comment_content" name="content"
								class="comment_content" rows="3" placeholder="댓글을 입력하세요"></textarea>
							<button id="insertCommentBtn" type="button"
								class="btn btn-primary">등록</button>
						</div>

					<div id ="comment_container">
						<!-- Comments-->
						<c:forEach var="comment" items="${commentList}">
							<div class="d-flex mb-4">
								<div class="flex-shrink-0">
									<img width="40" height="40" class="rounded-circle"
										src="/resources/attachments/profile_image/${comment.user.profileImage}"/>
								</div>
								<div id="comment_div" class="ms-3">
									<div class="fw-bold">${comment.user.nickName}</div>
									<span class="a">${comment.content}</span>
									<span class="b">${comment.regDate}</span>

									<c:if test="${sessionScope.user.userId == comment.user.userId}">
										<!-- button id="updateCommentBtn" type="button"
											class="btn btn-primary" data-value="${comment.commentNo}">수정</button-->
										<button id="deleteCommentBtn" type="button"
											class="btn btn-primary" data-value="${comment.commentNo}">삭제</button>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>

					</div>
				</div>
			</section>
		</div>


	</div>

	<br />


	<script>
		$("#insertCommentBtn")
				.on("click",function() {

							var postNo = ${post.postNo};
							var content = $("#comment_content").val();

							var jsonReq = {
								"postNo" : postNo,
								"content" : content,
							}
							//console.log("jsonReq: " + jsonReq);

									$.ajax({
										url : "/community/api/insertComment",
										method : "POST",
										data : JSON.stringify(jsonReq), //@RequestBody
										//data : jsonReq,
										dataType : "json", // 받는 타입
										contentType : "application/json; charset=utf-8", // 보내는 타입
										success : function(data, status, jqXHR) {
											console.log("data : " + data.regDate);
											console.log("success status: "+ status);
											console.log("jqXHR: "+ jqXHR);
											

											// 댓글 append										
											const comment = `
											<div class="d-flex mb-4">
												<div class="flex-shrink-0">
													<img width="40" height="40" class="rounded-circle"
														src="/resources/attachments/profile_image/\${data.user.profileImage}"/>
												</div>
												<div id="comment_div" class="ms-3">
													<div class="fw-bold">\${data.user.nickName}</div>
													<span class="a">\${data.content}</span>
													<span class="b">\${data.regDate}</span>
													
												</div>
											</div>`

											$("#comment_container").prepend(comment);
											
											// 입력값 지우기 왜안됨?
											$("#comment_content").value("");
											
										},error: function(status, jqXHR){
											console.log("error status: "+ status);
											console.log("jqXHR: "+ jqXHR);
										}
									});

						});

		$("#deleteCommentBtn").on("click", function() {
			alert("1")
			const commentNo = $(this).data("value");
			console.log("commentNo: " + commentNo);
			console.log("////"+$(this).parent().parent());

			$.ajax({
				url : "/community/api/deleteComment/" + commentNo,
				method : "POST",

				success : function(data, status, jqXHR) {
					console.log("data: " + data);
					console.log("success status: " + status);
					console.log("jqXHR: " + jqXHR);

					
					console.log("////"+$(this).parent().parent());
					console.log('삭제 테스트..');
					//var tagName = $(this).closest('tr.ct_list_pop');
					//console.log($(this));
					console.log(this);
					//$(this).closest('tr.ct_list_pop');
					//$(this).closest('tr.ct_list_pop').remove();
					//$("#tr_comment").remove();
				}, error: function(status, jqXHR){
					console.log("error status: "+ status);
					console.log("jqXHR: "+ jqXHR);
				}
			});

		});

		$("#insertLikeBtn").on("click", function() {

			const postNo = $(this).data("value");

			alert("postNo: " + postNo);
			console.log("postNo: " + postNo);

			$.ajax({
				url : "/community/api/insertLike/" + postNo,
				method : "POST",
				success : function(jsonRes, status) {
					//(status : sucess or err)
					alert("status: " + status);
					alert("jsonRes.likeCount: " + jsonRes.likeCount);

					console.log("status: " + status);
					console.log("jsonRes: " + jsonRes);
					console.log("jsonRes.likeCount: " + jsonRes.likeCount);

					$("#like_cnt").html(jsonRes.likeCount);
				}
			});

		});

		$("#deleteLikeBtn").on("click", function() {

			const postNo = $(this).data("value");

			alert("postNo: " + postNo);
			console.log("postNo: " + postNo);

			$.ajax({
				url : "/community/api/deleteLike/" + postNo,
				method : "POST",
				success : function(jsonRes, status) {
					//(status : sucess or err)
					alert("status: " + status);
					alert("jsonRes.likeCount: " + jsonRes.likeCount);

					//console.log("status: " + status);
					//console.log("jsonRes: " + jsonRes);
					console.log("jsonRes.likeCount: " + jsonRes.likeCount);

					//$("#like_cnt").remove();
					$("#like_cnt").html(jsonRes.likeCount);
				}

			});

		});

		$(document).ready(function() {
			$('.your-class').slick(
				{
					 dots: true,
					  infinite: true,
					  speed: 500,
					  fade: true,
					  cssEase: 'linear'
					});
		});
	

		
		
		

		

		
	</script>




</body>
</html>