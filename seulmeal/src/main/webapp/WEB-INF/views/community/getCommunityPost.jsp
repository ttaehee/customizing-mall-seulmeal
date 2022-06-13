<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!--  slick lib -->
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />


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
	
	<!--  slick lib -->
	<script type="text/javascript"
	src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
	
	
	<br />

	<div class="container" >
		<div class="your-class">
			<div>
				<img style="height:50vh;" src="/resources/attachments/profile_image/${post.user.profileImage}" alt="">
			</div>
			<div>
				<img style="height:50vh;" src="/resources/attachments/profile_image/${post.user.profileImage}" alt="">
			</div>
			<div>
				<img style="height:50vh;" src="/resources/attachments/profile_image/${post.user.profileImage}" alt="">
			</div>		
		</div>
	</div>
	

	<!-- table : 게시글 -->
	
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
				댓글 : <input id="comment_content" name="content" value=""/>
			</div>
			<div class="col-md-12">
				layer : <input id="layer" name="layer" value=""/>
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
							var strData = DTORes["postNo"] + ", "
									+ DTORes["commentNo"] + ", "
									+ DTORes["content"] + ", "
									+ DTORes["regDate"];

							alert("strData: " + strData);
							console.log("strData : " + strData);
							
							$("#commentPlus").html(strData);
							
							// 입력값 지우기 ^
							$('#comment_content').value("");
							$("#layer").value(" ");
							//$("#" + postNo + "").html(displayValue);
						}
					});

				});
		
		$("#deleteCommentBtn").on(
				"click",
				function() {

					var commentNo = $("#deleteCommentBtn").val();

					alert("commentNo: " + commentNo);
					console.log("commentNo: " + commentNo);

					$.ajax({
						url : "/community/api/deleteComment/"+commentNo,
						method : "POST",
						//data : JSON.stringify(jsonReq),
						//data : commentNo,
						//dataType : "json",
						//contentType : "application/json; charset=utf-8",
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
							var strData = DTORes["postNo"] + ", "
									+ DTORes["commentNo"] + ", "
									+ DTORes["content"] + ", "
									+ DTORes["regDate"];

							alert("strData: " + strData);
							console.log("strData : " + strData);
							
							//$("#commentPlus").html(strData);
							
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