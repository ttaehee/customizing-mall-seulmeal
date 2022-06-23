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


.your-class-img {
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

/*
img.rounded-circle{
	width:60px;
	height:60px;
	
}*/

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

#comment-profile-img{
	width:47px; 
	height:47px;
}

.fw-bold{
	font-size: 16px;
	width:100px; 
	margin:10px;
}
	
.comment-con{
	font-size: 13px;
}

.comment-reg{
	font-size: 10px;
}

#deleteCommentBtn{
	font-size: 12px;
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
						<img class = "your-class-img" style="height: 60vh;"
							src="/resources/attachments/${attachment.attachmentName}" alt="">
					</div>
				</c:forEach>
		</div>

		
		
		<!-- div class="info">
			<!-- 프로필 이미지
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
				
				<!-- 닉네임 
				<div class="nick">
					<strong>${post.user.nickName}</strong>
				</div>
			</div>

		</div-->




		<!-- 제목, 내용 -->
		<div id="accordion" style="margin-top:50px;">			
				<div class="card" style="min-height: 500px; width:85%; left:8%;">
	
					<div id="post-title" class="card">
					  <div id="post-title-body" class="card-body" style="font-size: 25px">
							<strong>${post.title}</strong>
					  </div>
					</div>
					
					<div id="post-content" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
						<div id="post-content-body" class="card-body"  style="font-size: 18px; padding:30px; margin-bottom:0px">
							 ${post.content}
						</div>
					</div>
					
					<div class="post-content">
	                    <div class="reaction-wrapper">
	                    	<!-- 좋아요수, 조회수, 댓글수 -->
	                    	<i class="bi bi-heart icon" data-value="${post.postNo}"></i><span id="heart-cnt">${post.likeCount}</span>
	                    	<i class="bi bi-eye icon">${post.views}</i>
	                    	<i class="bi bi-chat-left icon">${post.commentCount}</i>
	                    </div>
	                    <!-- 등록날짜-->
	                    <div class="post-time" style="text-align:right;">${post.regDate}</div>
	                </div>
					
					
					<!-- div class="comment_count">
						<span id="like_cnt">좋아요  <span class="like-cnt">${post.likeCount}</span>개</span>
						<i class="bi bi-eye"></i> <span id="v_cnt">${post.views}</span>
						<i class="bi bi-chat-left"></i> <span id="c_cnt">${post.commentCount}</span>
						<div id ="reg-date">${post.regDate}</div>
					</div-->
				</div>
				
		</div>
		<!-- 제목, 내용 끝-->
	</div>


<!-- 댓글 컨테이너 -->
	<div class="container" style="margin-top:0px; width:938px;">
	
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
									<img id="comment-profile-img"  class="rounded-circle"
										src="/resources/attachments/profile_image/${comment.user.profileImage}"/>
								</div>
								<div id="comment_div" class="ms-3">
									<span class="fw-bold">${comment.user.nickName}</span>
									<span class="comment-con">${comment.content}</span>
									<span class="comment-reg">${comment.regDate}</span>

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

<jsp:include page="../layer/footer.jsp"></jsp:include>

	<script>
		$("#insertCommentBtn")
				.on("click",function() {

							var postNo = ${post.postNo};
							var content = $("#comment_content").val();
							console.log("content: "+content)
							
							var jsonReq = {
								"postNo" : postNo,
								"content" : content
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
											console.log("data : " + data);
											console.log("success status: "+ status);
											console.log("jqXHR: "+ jqXHR);
											
											// 댓글 append										
											const comment = `
											<div class="d-flex mb-4">
												<div class="flex-shrink-0">
													<img id="comment-profile-img" class="rounded-circle"
														src="/resources/attachments/profile_image/\${data.user.profileImage}"/>
												</div>
												<div id="comment_div" class="ms-3">
													<span class="fw-bold">\${data.user.nickName}</span>
													<span class="comment-con">\${data.content}</span>
													<span class="comment-reg">\${data.regDate}</span>
													<button id="deleteCommentBtn" type="button"
														class="btn btn-primary" data-value="\${data.commentNo}">삭제</button>
												</div>
											</div>`
											
											// 댓글 맨위에 추가
											$("#comment_container").prepend(comment);
											
											deleteComment();

										},error: function(status, jqXHR){
											console.log("error status: "+ status);
											console.log("jqXHR: "+ jqXHR);
										}
									});
									
							// 댓글 내용 비우기
							$("#comment_content").val("");
							
							
						});

		
		
		function deleteComment(){
			
			$(".btn.btn-primary:contains('삭제')").on("click", function() {
				
				let commentNo = $(this).data("value");
				//alert("commentNo: " + commentNo);
				console.log("commentNo: " + commentNo);
				
				
				let result = confirm("정말 삭제하시겠습니까?");
				if(result){
					$.ajax({
						url : "/community/api/deleteComment/" + commentNo,
						method : "POST",

						success : function(data, status, jqXHR) {
							console.log("data: " + data);
							console.log("success status: " + status);
							console.log("jqXHR: " + jqXHR);
							
						}, error: function(status, jqXHR){
							console.log("error status: "+ status);
							console.log("jqXHR: "+ jqXHR);
						}
					});
					
					// 댓글 삭제
					$(this).parent().parent().remove();
				}
				
			});
			
		}
		
		deleteComment();

		
		// 좋아요, 좋아요 취소
		$("i.bi.bi-heart.icon").on("click", function() {
			const heart = $(this)		
			const postNo = $(this).data("value");
			//alert("postNo: " + postNo);
			console.log("postNo: " + postNo);

			const div_like_cnt = $("#heart-cnt");
			
			$.ajax({
				url : "/community/api/insertLike/" + postNo,
				method : "POST",
				success : function (data, status, jqXHR){
					
	            	console.log(data); //응답 body부 데이터
					//console.log(JSON.stringify(data));
	            	//console.log(status); //"succes"
	            	//console.log(jqXHR)
					           	
	            	const first_key = Object.keys(data)[0];
	            	const value = data[first_key];
	            	
	            	console.log(first_key);
	            	console.log(value);
	            	
	            	if(first_key === '좋아요'){
	            		heart.attr("class", "bi bi-heart-fill icon");
	            		heart.css("color","red");
	            	}else if(first_key === '좋아요 취소'){
	            		heart.attr("class", "bi bi-heart icon");
	            		heart.css("color","black");
	            	}
	        		
	            	// 좋아요 개수 수정
					div_like_cnt.html(value); 
				
				}, error : function(jqXHR, status){
					console.log(jqXHR);	// 응답 메시지
					console.log(status); // "errror"
				}
			});

		});

		
		// 댓글 무한스크롤
		$(function(){
			
			let postNo = ${post.postNo};
			let currentPage = 2;
			let maxPage = ${resultPage.maxPage};
			
			$(window).scroll(function(){
				
				let $window = $(this);
				let scrollTop = $window.scrollTop();
				let windowHeight = $window.height();
				let documentHeight = $(document).height();
				
				if(scrollTop + windowHeight + 1 >= documentHeight && currentPage <= maxPage){
					setTimeout(getListComment,200);//0.2초
				}
				
				function getListComment(){
					
					//alert("currentPage: "+currentPage);
					//console.log("currentPage: "+currentPage);
					$.ajax({
						url:"/community/api/getListComment/"+postNo+"?currentPage="+currentPage,
						type:"GET",
						datatype:"json",
						success: function(data, status, jqXHR){
							
							console.log("success status: "+ status);
							console.log("data: " + data);
							console.log("jqXHR: "+ jqXHR);
							console.log("json/stringify: "+JSON.stringify(data));						
							//const comments = JSON.stringify(data);					
							//console.log($(".d-flex.mb-4").clone()[0]);
							//alert("//"+data.resultPage.maxPage);
							
							for(let i = 0; i<data.length; i++){
								const comment = data[i];
								
								// 반복문 안에 위치해야한다.
								let commentCard = $(".d-flex.mb-4").clone()[0];
								/*
								console.log(comment.user.profileImage);
								console.log(comment.user.nickName);
								console.log(comment.content);
								console.log(comment.regDate);
								*/
								
								$(commentCard).find("#comment-profile-img").attr("src","/resources/attachments/profile_image/"+comment.user.profileImage);
								$(commentCard).find(".fw-bold").text(comment.user.nickName);
								$(commentCard).find(".comment-con").text(comment.content);
								$(commentCard).find(".comment-reg").text(comment.regDate);
								
								$("#comment_container").append(commentCard);
								
								deleteComment();
								
								}
						}
						, error: function(status, jqXHR){
							console.log("error status: "+ status);
							console.log("jqXHR: "+ jqXHR);
							alert("페이지 로드 실패");
						}
						
					})//jQuery.ajax()
					// 위치 중요(js 함수 안, jQuery 함수 밖)
					currentPage ++;
				}//getListComment()
				
			})
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