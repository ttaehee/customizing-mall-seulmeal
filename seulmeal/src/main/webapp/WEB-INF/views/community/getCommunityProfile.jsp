<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 조회</title>

<style type="text/css">

* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}


body {
	width: 100%;
	background: #fafafa;
	position: relative;
	font-family: 'roboto', sans-serif;
	/*
	display: flex;
	align-items: center;
	flex-direction:column;
	justify-content: center;
	height: 100vh;
	background: #fafafa;
*/
}

section.main {
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
	background: #fafafa;
	padding:40px 0px;
}


.profile {
	background: #fff none repeat scroll 0 0;
	border: 1px solid #e1e8ed;
	border-radius: 6px;
	height: auto;
	width: 670px;
	max-width: 800px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, .09);
	margin-bottom: 20px;
}

.left-col {
	width: 600px;
	heigth: 600px;
	display: flex;
	flex-direction: column;
}

#profile-link {
	background-color: #fff;
	border-radius: 6px;
	display: inline-block;
	float: left;
	margin: -30px 5px 0px 8px;
	max-width: 100%;
	padding: 1px;
	vertical-align: bottom;
}

#profile-img {
	border: 2px solid #fff;
	border-radius: 7px;
	color: #fff;
	height: 72px;
	width: 72px;
}

#profile-marg {
	margin: 5px 0px 0px;
}

#profile-name {
	font-size: 21px;
	font-weight: 700;
	line-height: 21px;
}

#profile-name a {
	color: inherit;
}

#profile-state {
	padding: 15px;
}

#profile-Arrange {
	display: flex;
	align-items: center;
	margin: 0;
	min-width: 100%;
	padding: 0px;
}

ul#profile-Arrange {
	justify-content:flex-end;
	list-style: none;
	margin: 0;
	padding: 0;
}

#profile-details a:hover {
	text-decoration: none;
}

#profile-details{
	margin-right:10px;
}

#profile-number {
	display: block;
	font-size: 18px;
	font-weight: 500;
	transition: color 0.15s ease-in-out 0s;
}

#profile-label {
	color: #8899a6;
	font-size: 13px;
	overflow: hidden;
	transition: color 0.15s ease-in-out 0s;
}

/* 게시글 */
.left-col {
	display: flex;
	flex-direction: column;
}

.post-card {
	margin-bottom: 20px;
	border: 1px solid #dfdfdf;
	border-radius: 3px;
}

.profile-pic {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	overflow: hidden;
	padding: 3px;
	background: linear-gradient(45deg, rgb(255, 230, 0), rgb(255, 0, 128)
		80%);
}

.profile-pic img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 50%;
	border: 2px solid #fff;
}

.post {
	width: 100%;
	height: auto;
	background: #fff;
	border: 1px solid #dfdfdf;
	margin-top: 40px;
}

.info {
	width: 100%;
	height: 60px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 10px;
	border-bottom: 1px solid #dfdfdf;
}

.info .username {
	width: auto;
	font-weight: bold;
	color: #000;
	font-size: 14px;
	margin-left: 10px;
	margin-top: 17px;
}

#option_icon {
	height: 10px;
	cursor: pointer;
}

.info .user {
	display: flex;
	align-items: center;
}

.info .profile-pic {
	height: 40px;
	width: 40px;
	padding: 0;
	background: none;
}

.info .profile-pic img {
	border: none;
}

#post-list-title {
	margin-top: 20px;
	margin-left: 20px;
	font-size: 20px;
	font-weight: bold;
}

#post-list-content {
	margin: 30px;
}

.post-image {
	width: 100%;
	height: 500px;
	object-fit: cover;
}

.post-content {
	width: 100%;
	padding: 10px 10px 2px 10px;
}

.likes {
	font-weight: bold;
}

.description {
	margin: 10px 0;
	font-size: 14px;
	line-height: 20px;
}

.description span {
	font-weight: bold;
	margin-right: 10px;
}

.post-time {
	color: rgba(0, 0, 0, 0.5);
	font-size: 12px;
	margin: 0px;
}


/* */

.slick-dots{
	height:30px;
}

.bi.bi-heart.icon{
	cursor:pointer;
}

div.modal-content{
	width:120%;
}


.profile-card{
    width: 400px;
    display:flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px 0px 0px 100px;
    border: 1px solid #dfdfdf;
	border-radius: 3px;
}

/* 내 프로필 카드- 내 프로필 이미지*/
.profile-card .profile-pic{
    flex: 0 0 auto;
    padding: 0;
    background: none;
    width: 40px;
    height: 40px;
    margin: 0px 10px 40px 5px;
}

.profile-card:first-child .profile-pic{
    width: 60px;
    height: 60px;
}

.profile-card .profile-pic img{
    border: none;
}

.profile-user-info{
	width:50%;
	margin:2px;
}

.profile-card .username{
    font-weight: 500;
    font-size: 14px;
    color: #000;
}

.sub-text{
    color: rgba(0, 0, 0, 0.5);
    font-size:12px;
    font-weight: 500;
    margin: 5px;
}

.action-btn{
    opacity: 1;
    font-weight: 700;
    font-size: 12px;
}



#block-list-card,
#follow-list-card,
#follower-list-card {
    height: 60px;
}

#block-user-list,
#follow-user-list,
#follower-user-list{
	cursor:pointer; 
}

#block-list-image,
#follow-list-image,
#follower-list-image{
    margin: 10px;
}

#block-list-nickname,
#follow-list-nickname,
#follower-list-nickname {
    width: 265px;
    font-size: 17px;
    font-weight: normal;
}

#block-list-card,
#follow-list-card,
#follower-list-card {
    width: 466px;
}

.postOption {
	text-align:center;
	cursor: pointer;
}

.action-btn{
    width: 70px;
    height: 100%;
    background: none;
    border: none;
    outline: none;
    text-transform: capitalize;
    font-weight: 700;
    font-size: 12px;
    color: rgb(0, 162, 255);
    opacity: 1;
}


</style>
</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>



<!-- flex container -->
	<section class="main">
	
	<!--  div 1. 프로필 -->
		<div class="profile" >
				<div id="profile-link"> <img id="profile-img"
					src="/resources/attachments/profile_image/${profileUser.profileImage}" />
				</div>
				<div id="profile-marg">
					<span id="profile-name"> ${profileUser.nickName} </span>
					<c:if test="${isMine == true}">
						<span id="profile-update">
							<a class= "profile-update btn" style="float:right" href="/community/updateProfile">프로필 정보 수정</a>
						</span>
					</c:if>
				</div>


				<div id="profile-state">
					<br />
					<div>
						<div class="aaaa">
							<div id="profile-msg" style="margin-bottom:15px; font-size: 18px;">${profileUser.profileMessage}</div>
							
							<div id="food-cate">
								<c:if test="${not empty profileUser.foodCategoryName1 }">
									"
									${profileUser.foodCategoryName1}
									${profileUser.foodCategoryName2}
									${profileUser.foodCategoryName3}
									" 을 선호합니다.
								</c:if>
								
								<div id="user-grade" style="justify-content: flex-start">
								회원등급 : 
									<c:choose>
										<c:when test="${profileUser.grade eq '0'}">
											<span class="">슬밀프랜즈</span>
										</c:when>
										<c:when test="${profileUser.grade eq '1'}">
											<span class="">슬밀패밀리</span>
										</c:when>
										<c:when test="${profileUser.grade eq '2'}">
											<span class="">슬밀히어로</span>
										</c:when>
										<c:when test="${profileUser.grade eq '3'}">
											<span class="">슬밀마스터</span>
										</c:when>
									</c:choose>
								</div>
								
							</div>

						</div>
					</div>
					
							
					<ul id="profile-Arrange" >
					
						<!-- 타 프로필일 경우,  -->
						<c:if test="${isMine == false}">
							<button id="insertFollowBtn" onclick="insertFollowBtn(this)" type="button" data-value="${profileUser.userId}"  class="btn btn-primary">
								팔로우
							</button>
							<button id="insertBlockBtn" onclick="insertBlock(this)" type="button" data-value="${profileUser.userId}"  class="btn btn-primary">
								차단하기
							</button>
							<li id="profile-details"> 
									<span class="d-block" id="profile-label" >팔로잉</span> 
									<span class = "followTotalCount" id="profile-number"> ${followMap.followTotalCount}</span>
							</li>
							<li id="profile-details"> 
									<span class="d-block" id="profile-label">팔로워</span> 
									<span class = "followerTotalCount" id="profile-number"> ${followerMap.followerTotalCount}</span>
							</li>
						</c:if>
						<!-- 내 프로필일 경우,  -->
						<c:if test="${isMine == true}">
							<li id="profile-details"><a id = "follow-user-list" data-toggle="modal" data-target="#followModal"> 
									<span class="d-block" id="profile-label" >팔로잉</span> 
									<span id="profile-number" class="followTotalCount"> ${followMap.followTotalCount}</span>
							</a></li>
							<li id="profile-details"><a id = "follower-user-list" data-toggle="modal" data-target="#followerModal"> 
									<span class="d-block" id="profile-label">팔로워</span> 
									<span id="profile-number" class="followerTotalCount"> ${followerMap.followerTotalCount}</span>
							</a></li>
							<li id="profile-details"><a id="block-user-list" data-toggle="modal" data-target="#blockUserModal">
									<span class="d-block" id="profile-label">차단</span> 
									<span id="profile-number"> ${blockMap.blockTotalCount}</span>
							</a></li>
	
							<!-- include 모달창  -->
							<jsp:include page="listCommunityFollowUserModal.jsp"></jsp:include>
							<jsp:include page="listCommunityFollowerUserModal.jsp"></jsp:include>
							<jsp:include page="listCommunityBlockUserModal.jsp"></jsp:include>
						</c:if>
					</ul>
				</div>
		</div>

		<!-- div2. 게시글  -->
		<div class="left-col">

			<c:forEach var="post" items="${postList}">
				<div class="post-card">
					<div class="info">
						<div class="user">
							<!-- 1. 프로필 이미지 -->
							<div class="profile-pic">
								<img class="profile-img" src="/resources/attachments/profile_image/${post.user.profileImage}"/>
							</div>
							<!-- 2. 닉네임 -->
							<p id="post_nickname" class="username">
								<a id="profile-nick" class="profile-link2"> ${post.user.nickName} </a>
							</p>
						</div>
						<!-- 게시글 옵션 아이콘 -->
						<i id="option_icon" class="bi bi-three-dots option_icon"></i>


					</div>

					<!-- 3. 게시글사진/제목+간략내용 --> 
                    <c:choose>
                    	<c:when test="${not empty post.attachments}">
                    		<div class="your-class">
                    	 		<c:forEach var="attach" items="${post.attachments}">	
                            	    <a class ="post-link" href="/community/getPost/${post.postNo}">
                            	        <img id = "post-img" class="post-image" src="/resources/attachments/${attach.attachmentName}"/>
                                	</a>
                    			</c:forEach>
                    		</div>
                    	</c:when>
                    	<c:otherwise>
                    		<div class="post-list-title">${post.title}</div>
                        	<div id="post-list-content">
                            	<a class="post-shortContent" href="/community/getPost/${post.postNo}">${post.shortContent}</a>								
                        	</div>
                    	</c:otherwise>
                    </c:choose>

					<div class="post-content">
						<div class="reaction-wrapper">
							<i class="bi bi-heart icon" data-value="${post.postNo}"></i> 
							<i class="bi bi-heart-fill" style="display: none;"></i>
							<!-- 4.조회수, 댓글수 -->
							<i class="bi bi-eye icon">${post.views}</i> 
							<i class="bi bi-chat-left icon">${post.commentCount}</i>
						</div>
						<!-- 5. 좋아요 수-->
						<p class="likes">
							좋아요 <span class="like-cnt">${post.likeCount}</span>
						</p>
						<c:if test="${not empty post.attachments}">
                            <p class="description">${post.shortContent} ...</p>
                        </c:if>
						<!-- 6. 등록날짜-->
						<div class="post-time">${post.regDate}</div>
					</div>

				</div>

				<!-- 게시글 col 끝-->
			</c:forEach>
			<!-- 무한스크롤 / RestController postList가 붙는 곳 -->

		</div>



	</section>

	<script type="text/javascript">

	/*
	$("#insertFollowBtn").on("click",
			function() {

				let relationUserId = $("#followUserId").data("value");

				alert("relationUserId: " + relationUserId);
				console.log("relationUserId: " + relationUserId);

				$.ajax({
					url : "/community/api/insertFollow/"+relationUserId,
					method : "POST",
					success : function(followCnt, status) {

						//(status : sucess or err)
						alert("status: " + status);
						console.log("status: " + status);

						// 응답받은 strData
						alert("followCnt : " + followCnt);
						console.log("followCnt : " + followCnt);
						
						$(".followTotalCount").text(followCnt);
						
					}, error : function(jqXHR, status){
						console.log(jqXHR);	// 응답 메시지
						console.log(status); // "errror"
					}
				});

			});*/	

	// 팔로우
	function insertFollowBtn(e){
		let relationUserId = $(e).data("value");
		//alert("relationUserId: " + relationUserId);
		
		$.ajax({
			url : "/community/api/insertFollow/"+relationUserId,
			method : "POST",
			success : function(data, status, jqXHR) {

				console.log("data : " + data);
				console.log("status: " + status);
				console.log("jqXHR: " + jqXHR);
				
				console.log(data.msg)
				console.log(data.followerTotalCount)
				
				let msg = data.msg;
				let followerTotalCount = data.followerTotalCount;
				
				if(data.msg === '팔로우'){
					//alert(msg)
					$("#insertFollowBtn").html('<i class="bi bi-person-check-fill"></i>');
					
				}else if (data.msg === '팔로우취소'){
					//alert(msg)
					/*
					let result = confirm(relationUserId+"님의 팔로우를 취소하시겠어요?");
					if(result){
					}*/
					$("#insertFollowBtn").text("팔로우");
				}
				
				$(".followTotalCount").text(followerTotalCount);
				
			}, error : function(jqXHR, status){
				console.log(jqXHR);	// 응답 메시지
				console.log(status); // "errror"
			}
		});
	};
	
	
	// 팔로우 해제
	function deleteFollow(e){
		let relationUserId = $(e).data("value");
		//alert("relationUserId: " + relationUserId);
		
		let result = confirm(relationUserId+"님의 팔로우를 취소하시겠어요?")
		if(result){
			$.ajax({
				url : "/community/api/deleteFollow/"+relationUserId,
				method : "POST",
				success : function(data, status, jqXHR) {
					
					//alert(data.userFollowCnt)
					//alert(data.relationUserFollowerCnt)
					console.log("data : " + data);
					console.log("status: " + status);
					console.log("jqXHR: " + jqXHR);
					
					$(e).parent().parent().remove();
					$(".followTotalCount").text(data.userFollowCnt);
					
				}, error : function(jqXHR, status){
					console.log(jqXHR);	// 응답 메시지
					console.log(status); // "errror"
				}
			});
		}// confirm
	};
	
	// 차단
	function insertBlock(e){
		
		let blockUserId = $(e).data("value");
		
		let result = confirm(blockUserId+"님을 차단하시겠어요?")
		if(result){
			
			$.ajax({
				url : "/community/api/insertBlock/"+blockUserId,
				method : "POST",
				success : function(data, status, jqXHR) {
					
					console.log("data : " + data);
					console.log("status: " + status);
					console.log("jqXHR: " + jqXHR);
					
					if(data === 1){
						alert("차단성공")
						$("#insertBlockBtn").text("차단해제");
						// '<i class="bi bi-person-x"></i>'
					}else{
						console.log("차단실패")
					}
					
				},error : function(jqXHR, status){
					console.log(jqXHR);	// 응답 메시지
					console.log(status); // "errror"
				}
				

			});
		}
	}
	
	// 차단해제
	$("button.action-btn:contains('차단해제')").on("click", function() {
		
		const relationUserId = $(this).data("value");
		//alert(relationUserId);
		console.log(relationUserId);
		
		const line = $(this).parent().parent(); 
		console.log(line);
		
		$.ajax({
			url : "/community/api/deleteBlock/" + relationUserId,
			method : "POST",
			success : function(status) {
				
				if(status === 1){
					alert("차단해제 완료!");
					line.remove();
				}else{
					alert("차단해제 실패..");
				}
			}
		});

	});
	
	
	
	function slick2(e){		
		$(e).slick({
			dots : true,
			infinite : true,
			speed : 500,
			fade : true,
			cssEase : 'linear',
			arrows : true
			//prevArrow : "<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
			//nextArrow : "<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>"
					});
	}

	// slick
	$(document)
	.ready(function() {
			slick2('.your-class');
			});


	</script>

</body>
</html>