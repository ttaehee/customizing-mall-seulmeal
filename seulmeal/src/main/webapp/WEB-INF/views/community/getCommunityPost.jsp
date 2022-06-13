<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>


<style type="text/css">

	.card-cover {
		background-repeat: no-repeat;
		background-position: center center;
		background-size: cover;
	}
	
	.carousel-control.left, .carousel-control.right {
	    background-image: none
	}

.carousel-indicators{
	carousel-indicator-width:3px;
	$carousel-indicator-width:3px;
}

.carousel-inner{
	carousel-caption-width: 50%;
}

.carousel-inner{
	carousel-caption-width: 50%;
}


.d-block w-100 {
	top: 0;
	left: 0;
	min-width: 100px;
	min-height: 100px;
}
</style>

</head>

<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>

	<br />

	<!-- Carousel -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">

		<!-- 1.  -->
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>

			<!-- 2.  -->
			<div class="carousel-inner">

				<div class="carousel-item active" data-bs-interval="10000">
					<img class="d-block w-100" style="width: 30%"
						src="../../resources/attachments/profile_image/${post.user.profileImage}"
						alt="First slide">
				</div>

				<div class="carousel-item" data-bs-interval="10000">
					<img class="d-block w-100" src="..." alt="Second slide">
				</div>

				<div class="carousel-item" data-bs-interval="10000">
					<img class="d-block w-100" src="..." alt="Third slide">
				</div>

				<div class="carousel-item" data-bs-interval="10000">
					<img class="d-block w-100" src="..." alt="Third slide">
				</div>

				<div class="carousel-item" data-bs-interval="10000">
					<img class="d-block w-100" src="..." alt="Third slide">
				</div>

			</div>


		<!-- 3.  -->
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>



	<!-- cards -->
	<div class="card mb-3">
		<img class="card-img-top" style = "width : 10%" src="../../resources/attachments/profile_image/${post.user.profileImage}" alt="Card image cap">
		<div class="card-body">
			<h5 class="card-title">Card title</h5>
			<p class="card-text">This is a wider card with supporting text
				below as a natural lead-in to additional content. This content is a
				little bit longer.</p>
			<p class="card-text">
				<small class="text-muted">Last updated 3 mins ago</small>
			</p>
		</div>
	</div>

	<!-- table : 게시글 -->
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
			<td class="ct_list_b">게시글 사진</td>
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
			<td align="left"><img style="width: 80px; height: 80px"
				src="../../resources/attachments/profile_image/${post.user.profileImage}" /></td>
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
			<!-- 게시글 사진 -->
			<td align="left"></td>
			<td></td>

		</tr>

	</table>

	<br />
	<br />

	<!-- table : 해당 게시글에 달린 댓글 목록 -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 10px;">

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
			<tr class="ct_list_pop">
				<td align="left">${comment.user.nickName}</td>
				<td></td>
				<td align="left"><img style="width: 80px; height: 80px"
					src="../../resources/attachments/profile_image/${comment.user.profileImage}" /></td>
				<td></td>
				<td align="left">${comment.content}</td>
				<td></td>
				<td align="left">${comment.regDate}</td>
				<td></td>
				<td align="left">${comment.updateDate}</td>
				<td></td>

				<!-- 게시글 사진 -->
			</tr>
		</c:forEach>




	</table>

	<br />



	<!-- 댓글 작성 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				댓글 : <input id="comment_content" name="content" />
			</div>
			<div class="col-md-12">
				layer : <input id="layer" name="layer" />
			</div>
		</div>

		<div style="display: flex; justify-content: space-between;">
			<div>
				<button id="insertBtn" type="button" class="btn btn-primary">
					등록</button>
				<button id="updateBtn" type="button" class="btn btn-primary">
					수정</button>
				<button id="deleteBtn" type="button" class="btn btn-primary">
					삭제</button>
			</div>
		</div>
	</div>


	<span id="commentPlus" style="color: red"></span>



	<script>
	
		$("#insertBtn").on(
				"click",
				function() {

					var postNo = $
					{
						post.postNo
					}

					var jsonReq = {
						"postNo" : postNo,
						"content" : $("#comment_content").val(),
						"layer" : $("#layer").val()
					}

					alert("jsonReq: " + jsonReq);
					console.log("jsonReq: " + jsonReq);

					$.ajax({
						url : "/community/api/insertComment",
						method : "POST",
						data : JSON.stringify(jsonReq),
						//data : jsonReq,
						dataType : "json",
						contentType : "application/json; charset=utf-8",
						/*
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
						 */
						success : function(DTORes, status) {

							//(status : sucess or err)
							alert("status: " + status);
							console.log("status: " + status);

							// 응답받은 dto 객체
							alert("DTORes : " + DTORes);
							console.log("DTORes : " + DTORes);

							// 응답받은 dto 객체의 value 값 꺼내기
							var result = DTORes["postNo"] + ", "
									+ DTORes["commentNo"] + ", "
									+ DTORes["content"] + ", "
									+ DTORes["regDate"];

							alert("result: " + result);
							console.log("result : " + result);

							$("#commentPlus").html(result);
							//$("#" + postNo + "").html(displayValue);
						}
					});

				});
	</script>



</body>
</html>