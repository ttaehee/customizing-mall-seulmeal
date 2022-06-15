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


img{
	display:block;
	margin:auto;
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

</style>


</head>

<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>
	
	<br />

	<!-- 게시글 이미지 또는 제목/간략내용 -->
	<div class="container" >
	
				<!--img width="40" height="40" class="rounded-circle"
				src="/resources/attachments/profile_image/${post.user.profileImage}" /-->
	
		<div class="your-class">
			<c:forEach var="attachment" items="${attachmentList}">
				<div>
					<img style="height:50vh;" src="/resources/attachments/${attachment.attachmentName}" alt="">
				</div>
			</c:forEach>
		</div>
		
		<i class="bi bi-heart"></i>
		<i class="bi bi-heart-fill"></i>
		<button id="insertLikeBtn" data-value="${post.postNo}" type="button" class="btn btn-primary">좋아요 </button>
		<button id="deleteLikeBtn" data-value="${post.postNo}" type="button" class="btn btn-primary">좋아요 취소</button>
		<span id = "like_cnt">${post.likeCount}</span>
	</div>
	

	

	<!-- table : 게시글 정보 -->
	<div class="container">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 10px;">

		<tr>
			<td class="ct_list_b">게시글유저_닉네임</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">게시글유저_프로필이미지</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">게시글 제목</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">게시글 내용</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">좋아요 수</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">조회수</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">달린 댓글 수</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">등록날짜</td>
			<td class="ct_line02"></td>

		</tr>
		<tr>
			<td colspan="11" bgcolor="808285" height="1"></td>
		</tr>

		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>

		<!-- c:set var="no" value="0"/-->
		<tr class="ct_list_pop">
			<td align="left">${post.user.nickName}</td>
			<td></td>
			<td align="left"><img width="40" height="40" class="rounded-circle" 
				src="/resources/attachments/profile_image/${post.user.profileImage}" /></td>
			<td></td>
			<td align="left">${post.title}</td>
			<td></td>
			<td align="left">${post.content}</td>
			<td></td>
			<td align="left">${post.likeCount}</td>
			<td></td>
			<td align="left">${post.views}</td>
			<td></td>
			<td align="left">${post.commentCount}</td>
			<td></td>
			<td align="left">${post.regDate}</td>
			<td></td>

		</tr>

	</table>


	<br />
	<br />


	              <!-- Comments section-->
	              <div class="container">
                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                            
                                <!-- Comment form-->
                                <form class="mb-4"><textarea class="form-control" rows="3" placeholder="댓글을 입력하세요"></textarea></form>
                             
                                <!-- Comments-->
	                            <c:forEach var="comment" items="${commentList}">
	                                <div class="d-flex mb-4">
		                                    <!-- Parent comment-->
		                                    <div class="flex-shrink-0"><img width="40" height="40" class="rounded-circle"  src="/resources/attachments/profile_image/${comment.user.profileImage}" alt="..." /></div>
		                                    <div class="ms-3">
		                                        <div class="fw-bold">${comment.user.nickName}</div>
		                                        ${comment.content}
		                                        ${comment.regDate}
		                                        ${comment.updateDate}
		                                        <c:if test="${sessionScope.user.userId == comment.user.userId}">
													<button id="updateCommentBtn" type="button" class="btn btn-primary">수정</button>
													<button id="deleteCommentBtn" type="button" class="btn btn-primary" data-value="${comment.commentNo}">삭제</button>
												</c:if>
		                    				</div>
	                     			</div>
		                       	</c:forEach>
                     			
                      			
                    		</div>
                       	</div>
                    </section>
                </div>
                
                
			</div>





	<!-- table : 해당 게시글에 달린 댓글 목록 -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 10px;" id="comment_table">

		<tr>
			<td class="ct_list_b">댓글작성자_닉네임</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">댓글작성자_프로필이미지</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">댓글내용</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">등록날짜</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">수정날짜</td>
			<td class="ct_line02"></td>
		</tr>
		<tr>
			<td colspan="11" bgcolor="808285" height="1"></td>
		</tr>

		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>

		<!-- c:set var="no" value="0"/-->
		<c:forEach var="comment" items="${commentList}">
			<tr class="ct_list_pop" id="tr_comment">
				<td align="left">${comment.user.nickName}</td>
				<td></td>
				<td align="left"><img style="width: 80px; height: 80px"
					src="/resources/attachments/profile_image/${comment.user.profileImage}" /></td>
				<td></td>
				<td align="left">${comment.content}</td>
				<td></td>
				<td align="left">${comment.regDate}</td>
				<td></td>
				<td align="left">${comment.updateDate}</td>
				<td></td>
				<c:if test="${sessionScope.user.userId == comment.user.userId}">
					<td class="ct_list_b">
					<button id="updateCommentBtn" type="button" class="btn btn-primary">수정</button>
					<button id="deleteCommentBtn" type="button" class="btn btn-primary" data-value="${comment.commentNo}">삭제</button>
					</td>
					<td class="ct_line02"></td>
				</c:if>
			</tr>
		</c:forEach>




	</table>

	<br />



	<!-- 댓글 작성 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				댓글 : <input id="comment_content" name="content" class="comment_content"/>
			</div>
			<div class="col-md-12">
				layer : <input id="layer" name="layer" />
				<button id="insertCommentBtn" type="button" class="btn btn-primary">등록</button>
			</div>
		</div>
	</div>

	
	</div>
	
	
	
	<span id="commentPlus" style="color: red"></span>



	<script>
	
		$("#insertCommentBtn").on(
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

					$.ajax({
						url : "/community/api/insertComment",
						method : "POST",
						data : JSON.stringify(jsonReq),	//@RequestBody
						//data : jsonReq,
						dataType : "json",	// 받는 타입
						contentType : "application/json; charset=utf-8",  // 보내는 타입
						success : function(jsonRes, status) {
							
							//(status : sucess or err)
							alert("status: " + status);
							console.log("status: " + status);

							// 응답받은 dto 객체 json 형태
							alert("jsonRes : " + jsonRes);
							console.log("jsonRes : " + jsonRes);

							// 응답받은 dto 객체 json 형태를 str으로 
							var strData = jsonRes["user"]["nickName"] + ", "
									+ jsonRes["user"]["profileImage"] + ", "
									+ jsonRes["content"] + ", "
									+ jsonRes["regDate"] + ", "
									+ jsonRes["updateDate"];
							alert(strData);
							
							// 입력한 댓글 덧붙이기..
							$("#tr_comment").prepend('<td align="left">'+jsonRes.updateDate+'</td><td></td>');
							$("#tr_comment").prepend('<td align="left">'+jsonRes.regDate+'</td><td></td>');
							$("#tr_comment").prepend('<td align="left">'+jsonRes.content+'</td><td></td>');
							$("#tr_comment").prepend('<td align="left">'+jsonRes.user.profileImage+' </td><td></td>');
							$("#tr_comment").prepend('<td align="left">'+jsonRes.user.nickName+'</td><td></td>');
							$("#tr_comment").prepend('<tr class="ct_list_pop" id="tr_comment">');
							
							$("#commentPlus").html(strData);
							
							// 입력값 지우기 ^
							$("#comment_content").value("");
						}
					});

				});
		
		$("#deleteCommentBtn").on(
				"click",
				function() {

					const commentNo = $(this).data("value");

					alert("commentNo: " + commentNo);
					console.log("commentNo: " + commentNo);

					$.ajax({
						url : "/community/api/deleteComment/"+commentNo,
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
		
		
		$("#insertLikeBtn").on(
				"click",
				function() {

					const postNo = $(this).data("value");

					alert("postNo: " + postNo);
					console.log("postNo: " + postNo);

					$.ajax({
						url : "/community/api/insertLike/"+postNo,
						method : "POST",
						success : function(jsonRes, status) {
							//(status : sucess or err)
							alert("status: " + status);
							alert("jsonRes.likeCount: " + jsonRes.likeCount);
							
							//console.log("status: " + status);
							//console.log("jsonRes: " + jsonRes);
							//console.log("jsonRes.likeCount: " + jsonRes.likeCount);
							
							$("#like_cnt").html(jsonRes.likeCount);
						}
					});

				});
		
		
		$("#deleteLikeBtn").on(
				"click",
				function() {

					const postNo = $(this).data("value");

					alert("postNo: " + postNo);
					console.log("postNo: " + postNo);

					$.ajax({
						url : "/community/api/deleteLike/"+postNo,
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
			$('.your-class').slick({
				  dots: true,
				  infinite: true,
				  speed: 500,
				  fade: true,
				  cssEase: 'linear',
				  arrows: true,
				  prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
		          nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>"
				  
			});
		});


		
	</script>



</body>
</html>