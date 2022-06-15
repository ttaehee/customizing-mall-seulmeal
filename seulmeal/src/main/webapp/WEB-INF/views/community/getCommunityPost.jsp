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
.carousel-item {
  height: 100%;
  min-height: 100%;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
*/

/*
.carousel-inner > .carousel-item > img {
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 400px;
    }
*/

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
</style>


</head>

<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>

	<br />

	
	<div class="container">

		<c:if test="${sessionScope.user.userId == post.user.userId}">
			<button id="updatePostBtn" type="button"
				class="btn btn-primary" onclick="location.href='/community/updatePost/${post.postNo}'">수정</button>
			<button id="deletePostBtn" type="button" 
				class="btn btn-primary"  onclick="location.href='/community/deletePost/${post.postNo}'">삭제</button>
		</c:if>

		<!-- 게시글 이미지 또는 제목/간략내용 -->
		<div class="attach">
			<div class="your-class">
				<c:forEach var="attachment" items="${attachmentList}">
					<div>
						<img style="height: 60vh;"
							src="/resources/attachments/${attachment.attachmentName}" alt="">
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 프로필 이미지 -->
		<div class="profile_img">
			프로필 이미지 : <img width="40" height="40" class="rounded-circle"
				src="/resources/attachments/profile_image/${post.user.profileImage}">
		</div>

		<!-- 닉네임 -->
		<div class="nick">
			닉네임 : <strong>${post.user.nickName}</strong>
		</div>


		<!-- 좋아요 -->		
		<div class="post_like">
			<i class="bi bi-heart"></i>
			<button id="insertLikeBtn" data-value="${post.postNo}" type="button"
				class="btn btn-primary">좋아요</button>
			<button id="deleteLikeBtn" data-value="${post.postNo}" type="button"
				class="btn btn-primary">좋아요 취소</button>
			<span id="like_cnt">좋아요 ${post.likeCount}개</span>
		</div>

		<!-- 조회수 -->
		<div class="view_count">
			<i class="bi bi-eye"></i> <span id="v_cnt">${post.views}</span>
		</div>

		<!-- 댓글수 -->
		<div class="comment_count">
			<i class="bi bi-chat-left"></i> <span id="c_cnt">${post.commentCount}</span>
		</div>

		<!-- 등록날짜 -->
		<div class="comment_count">
			<span id="r_cnt">등록날짜 : ${post.regDate}</span>
		</div>


	<div id="accordion">			
			<div class="card" style="min-height: 500px;">

				<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
					<div class="card-body">
						제목 : ${post.title}
					</div>
				</div>


				<div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
					<div class="card-body">
						 내용 : ${post.content}
					</div>
				</div>
			</div>
	</div>
	</div>


<!-- 댓글 -->
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

						<!-- Comments-->
						<c:forEach var="comment" items="${commentList}">
							<div class="d-flex mb-4">
								<!-- Parent comment-->
								<div class="flex-shrink-0">
									<img width="40" height="40" class="rounded-circle"
										src="/resources/attachments/profile_image/${comment.user.profileImage}"
										alt="..." />
								</div>
								<div class="ms-3">
									<div class="fw-bold">${comment.user.nickName}</div>
									<span class="a">${comment.content}</span> <span class="b">${comment.regDate}</span>
									<span class="c">${comment.updateDate}</span>

									<c:if test="${sessionScope.user.userId == comment.user.userId}">
										<button id="updateCommentBtn" type="button"
											class="btn btn-primary" data-value="${comment.commentNo}">수정</button>
										<button id="deleteCommentBtn" type="button"
											class="btn btn-primary" data-value="${comment.commentNo}">삭제</button>
									</c:if>
								</div>
							</div>
						</c:forEach>


					</div>
				</div>
			</section>
		</div>


	</div>

	<br />





	<span id="commentPlus" style="color: red"></span>



	<script>
		$("#insertCommentBtn")
				.on(
						"click",
						function() {

							var postNo = ${post.postNo};
							var content = $("#comment_content").val();
							var layer = $("#layer").val();

							var jsonReq = {
								"postNo" : postNo,
								"content" : content,
								"layer" : layer
							}

							alert("jsonReq: " + jsonReq);
							console.log("jsonReq: " + jsonReq);

							$
									.ajax({
										url : "/community/api/insertComment",
										method : "POST",
										data : JSON.stringify(jsonReq), //@RequestBody
										//data : jsonReq,
										dataType : "json", // 받는 타입
										contentType : "application/json; charset=utf-8", // 보내는 타입
										success : function(jsonRes, status) {

											//(status : sucess or err)
											alert("status: " + status);
											console.log("status: " + status);

											// 응답받은 dto 객체 json 형태
											alert("jsonRes : " + jsonRes);
											console.log("jsonRes : " + jsonRes);

											// 응답받은 dto 객체 json 형태를 str으로 
											var strData = jsonRes["user"]["nickName"]
													+ ", "
													+ jsonRes["user"]["profileImage"]
													+ ", "
													+ jsonRes["content"]
													+ ", "
													+ jsonRes["regDate"]
													+ ", "
													+ jsonRes["updateDate"];
											alert(strData);

											// 입력값 지우기 ^
											$("#comment_content").value("");
										}
									});

						});

		$("#deleteCommentBtn").on("click", function() {

			const commentNo = $(this).data("value");

			alert("commentNo: " + commentNo);
			console.log("commentNo: " + commentNo);

			$.ajax({
				url : "/community/api/deleteComment/" + commentNo,
				method : "POST",

				success : function(status) {
					//(status : sucess or err)
					alert("status: " + status);
					console.log("status: " + status);

					console.log('삭제 테스트..');
					//var tagName = $(this).closest('tr.ct_list_pop');
					//console.log($(this));
					console.log(this);
					//$(this).closest('tr.ct_list_pop');
					//$(this).closest('tr.ct_list_pop').remove();
					//$("#tr_comment").remove();
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

		$(document)
				.ready(
						function() {
							$('.your-class')
									.slick(
											{
												dots : true,
												infinite : true,
												speed : 500,
												fade : true,
												cssEase : 'linear',
												arrows : true,
												prevArrow : "<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
												nextArrow : "<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>"

											});
						});
	
		
		
		
		

		

		
	</script>




</body>
</html>