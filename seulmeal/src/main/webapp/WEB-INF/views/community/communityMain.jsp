<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 메인</title>


<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

*:focus {
	outline: none;
}

body {
	width: 100%;
	background: #fafafa;
	position: relative;
	font-family: 'roboto', sans-serif;
}

.navbar {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 50px;
	background: #fff;
	border-bottom: 1px solid #dfdfdf;
	display: flex;
	justify-content: center;
	padding: 5px 0;
}

.nav-wrapper {
	width: 70%;
	max-width: 1000px;
	height: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
}


#search{
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	width: 200px;
	height: 25px;
	background: #fafafa;
	border: 1px solid #dfdfdf;
	border-radius: 2px;
	color: rgba(0, 0, 0, 0.5);
	text-align: center;
	text-transform: capitalize;
}

#search::placeholder {
	color: rgba(0, 0, 0, 0.5);
}

.nav-items {
	height: 22px;
	position: relative;
}

section.main{
	margin:0px;
	padding:40px 0px;
}

#insertLikeBtn{
	cursor:pointer;
}

.user-profile {
	width: 22px;
	border-radius: 50%;
	background-image: url(img/profile-pic.png);
	background-size: cover;
}


.main{
    width: 100%;
    padding: 40px 0;
    display: flex;
    justify-content: center;
    margin-top: 50px;
}

.wrapper{
    width: 70%;
    max-width: 1000px;
    display: grid;
    grid-template-columns: 60% 40%;
    grid-gap: 40px;
    margin-left: 14%;
}

.left-col{
    display: flex;
    flex-direction: column;
}

.post-card{
	margin-bottom:20px;	
	border: 1px solid #dfdfdf;
	border-radius: 3px;
}

.profile-pic{
    width: 70px;
    height: 70px;
    border-radius: 50%;
    overflow: hidden;
    padding: 3px;
    background: linear-gradient(45deg, rgb(255, 230, 0), rgb(255, 0, 128) 80%);
}

.profile-pic img{
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid #fff;
}

.post{
    width: 100%;
    height: auto;
    background: #fff;
    border: 1px solid #dfdfdf;
    margin-top: 40px;
}

.info{
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 10px;
    border-bottom: 1px solid #dfdfdf;
}

.info .username{
    width: auto;
    font-weight: bold;
    color: #000;
    font-size: 14px;
    margin-left: 10px;
    margin-top: 17px;
}

/* 게시글 옵션 아이콘*/
#option_icon{
    height: 10px;
    cursor: pointer;
}

.info .user{
    display: flex;
    align-items: center;
}

.info .profile-pic{
    height: 40px;
    width: 40px;
    padding: 0;
    background: none;
}

.info .profile-pic img{
    border: none;
}

.post-list-title{
	margin: 30px;
	font-size: 20px;
	font-weight: bold;
}

.post-shortContent{
	margin-bottom:30px;
}


.post-list-content{
	margin-left: 50px; 
	margin-bottom: 70px; 
}

.post-image{
    width: 100%;
    height: 500px;
    object-fit: cover;
    margin-bottom: 10px;
}

.post-content{
    width: 100%;
    padding: 10px 10px 2px 10px;
}

.likes{
    font-weight: bold;
}

.description{
    margin: 10px 0;
    font-size: 14px;
    line-height: 20px;
}

.description span{
    font-weight: bold;
    margin-right: 10px;
}

.post-time{
    color: rgba(0, 0, 0, 0.5);
    font-size: 12px;
    margin: 0px;
}

.comment-btn,
.action-btn{
    width: 70px;
    height: 100%;
    background: none;
    border: none;
    outline: none;
    text-transform: capitalize;
    font-size: 16px;
    color: rgb(0, 162, 255);
    opacity: 0.5;
}



/* 좋아요수, 조회수, 댓글수 아이콘*/
.reaction-wrapper{
    width: 100%;
    height: 50px;
    display: flex;
    margin-top: -28px;
    align-items: center;
}

.reaction-wrapper .icon{
    height: 25px;
    font-size: 17px;
    margin: 0 3px 0 10px;
}

/* //////////우측 프로필 카드////////*/
.right-col{
    padding: 10px;
    position:fixed;
    left:65%;
}

.profile-card{
    width: 370px;
    display:flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px 0px 0px 100px;
    border: 1px solid #dfdfdf;
	border-radius: 3px;
	padding: inherit;
	border-radius: 10px;
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

.slick-dots{
	height:30px;
}

.bi.bi-heart.icon,
.bi.bi-heart-fill.icon{
	cursor:pointer;
}


div.modal-content{
	border-radius: 17px;
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

</style>

</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>
		
	<!-- 검색, 정렬, 게시글 작성버튼 작성 -->
	<div class="search-order-post">	
	
		<form class="navbar" action="/community/communityMain" method="GET">
			<div style="margin:auto;">
				<div class = "nav-wrapper" >	
				    <input  class="form-control mr-sm-2" id = "search" name = "searchKeyword"  placeholder="제목+내용" type="search" aria-label="Search">
				    <!-- button class="btn btn-outline-success my-2 my-sm-0" id="searchBtn" type="submit">검색</button-->
			    </div>
			</div>
			<c:if test="${not empty sessionScope.user.userId}">
				<button  type="button" onclick="location.href='/community/insertPost'" class="btn btn-primary">
					게시글 작성
				</button>
			</c:if>
		</form>
			
			<div class="order-inline">
				<div class="order-nav">
					<ul class="nav">
					  <li class="nav-item">
					    <a class="nav-link active"  href="/community/communityMain?searchCondition=1">조회순</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link"  href="/community/communityMain?searchCondition=2">좋아요순</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link"  href="/community/communityMain?searchCondition=3">최신순</a>
					  </li>
					</ul>
				</div>
			</div>				
	</div>
	<!-- 검색, 정렬, 게시글 작성버튼 끝 -->

	<section class="main">
	
		<div class="wrapper">
	
		<!-- 게시글 col 시작-->
		<div class="left-col">		
		
		<c:forEach var="post" items="${postList}">
			<c:set var= "i" value="${i+1}" />
                <div class="post-card">
                    <div class="info">
                        <div class="user">
                            <!-- 1. 프로필 이미지 -->
                            <div class="profile-pic">
                                <a class ="profile-link" href="/community/getProfile/${post.user.userId}">
                                    <img class="profile-img" src="/resources/attachments/profile_image/${post.user.profileImage}"/>
                                </a>
                            </div>
                            <!-- 2. 닉네임 -->                       
                            <p id = "post_nickname" class="username">
                                <a id= "profile-nick" class ="profile-link2" href="/community/getProfile/${post.user.userId}">${post.user.nickName}</a>
                            </p>
                        </div>
                        <!-- 게시글 옵션 아이콘 -->
                        <i id = "option_icon" class="bi bi-three-dots option_icon" data-toggle="modal" data-target=".fade${i}" data-value="${post.user.userId}"></i>
						<!-- 게시글 수정 삭제 / 신고 모달 -->
						<div id="postOptionModal" class="modal fade${i}" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalScrollableTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-md "
								role="document">
								<div class="modal-content" style="width:460px;" >
					
									<!-- 헤더 -->
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalScrollableTitle"></h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<c:choose>
											<c:when test="${sessionScope.user.userId == post.user.userId}">
												<div>
													<div class="postOption" onclick="location.href='/community/updatePost/${post.postNo}'">수정하기</div>
												</div>
												<hr>
												<div>
													<div class="postOption" onclick="deletePost(this)" data-value="${post.postNo}">삭제하기</div>
												</div>					
											</c:when>
											<c:otherwise>
												<div>
													<div data-target="#reportModal${i}" class="postOption" onclick="reportCheck(this)" >신고하기</div>
													<div style="dsiplay:none;" class="postOption reportTrue" data-toggle= "modal" data-target="#reportModal${i}" 
													data-dismiss="modal"></div>													
												</div>
											</c:otherwise>
										</c:choose>	
										<hr>
										<div style="margin:10px; text-align: center; margin:0px;">
											<button type="button"  class="btn btn-secondary" data-dismiss="modal">취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 게시글 수정 삭제 / 신고 모달 끝 -->						

					<!-- 게시글 신고 모달 -->
					<div class="modal fade" id="reportModal${i}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content" style="width:460px; border-radius: 15px;">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">게시글 신고 사유</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form class="report-form" >
					          <div class="report">
					            <label for="message-text" class="col-form-label"></label>
					            <textarea class="form-control" id = "reason" name="reason" rows="5" placeholder="신고사유를 적어주세요."></textarea>   <!-- 신고사유 -->
					            <input type="hidden" name="reporterId" value="${sessionScope.user.userId}" />
					            <input type="hidden" name="postNo" value="${post.postNo}" />
					          </div>
					        </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" data-value="${post.postNo}" onclick="reportPost(this)">신고등록</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- 게시글 신고 모달 끝-->
                        
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
                        	<div  class="post-list-content">
                            	<div style="margin-bottom: 30px;"><a class="post-shortContent" href="/community/getPost/${post.postNo}">${post.shortContent}</a></div>								
                        	</div>
                    	</c:otherwise>
                    </c:choose>
                    
                    <div class="post-content">
                        <div class="reaction-wrapper">
                        	<c:if test="${post.likeStatus eq 1}">
                            	<i class="bi bi-heart-fill icon" onclick="like(this)" style="color:red;" data-value="${post.postNo}"></i>
                            </c:if>
                            <c:if test="${empty post.likeStatus}">
                            	<i class="bi bi-heart icon" onclick="like(this)" data-value="${post.postNo}"></i>
                            </c:if>
                            <!-- 4.조회수, 댓글수 -->
                            <i class="bi bi-eye icon">${post.views}</i>
                            <i class="bi bi-chat-left icon">${post.commentCount}</i>
                        </div>
                        <!-- 5. 좋아요 수-->
                        <p class="likes">좋아요 <span class="like-cnt">${post.likeCount}</span></p>	
                        <c:if test="${not empty post.attachments}">
                            <p class="description">${post.shortContent} ...</p>
                        </c:if>
                        <!-- 6. 등록날짜-->
                        <div class="post-time">${post.regDate}</div>
                    </div>
                    
                </div>
                         	
         </c:forEach>   
        
        <!-- 무한스크롤 / RestController postList가 붙는 곳 -->
        
      </div>      
	<!-- 게시글 col 끝-->
		
		
		
				
		<!-- 프로필 col 시작-->
			<div class="right-col">
	            <div class="profile-card">
	                <div class="profile-pic">
	                	<c:choose> 
							<c:when test="${not empty sessionScope.user.profileImage}">
								<a href="/community/getProfile/${sessionScope.user.userId}"><img id="profileImage" class="rounded-circle" src="/resources/attachments/profile_image/${sessionScope.user.profileImage}"/></a>
							</c:when>
							<c:otherwise>
								<a href="/community/getProfile/${sessionScope.user.userId}"><img id="profileImage" class="rounded-circle" src="/resources/attachments/profile_image/default_profile.jpg"/></a>
							</c:otherwise>						
						</c:choose>
	                    <!-- img src="img/profile-pic.png" alt="로그인유저"-->
	                </div>
					<div class ="profile-user-info">
	                    <p class="username">
	                    	<c:choose> 
								<c:when test="${not empty sessionScope.user.nickName}">
									<a style ="font-size: 19px;" class = "username" href="/community/getProfile/${sessionScope.user.userId}">${sessionScope.user.nickName}</a>
								</c:when>
								<c:otherwise>
									<a style ="font-size: 19px;" class = "username" href="/community/getProfile/${sessionScope.user.userId}">${sessionScope.user.userId}</a>							
								</c:otherwise>						
							</c:choose>
	                    </p>
	                    <!-- a class="update_profile" style="margin:30px">프로필 이미지 변경</a-->
	                    <p class="sub-text">${sessionScope.user.profileMessage}</p>
	                    <c:choose>
								<c:when test="${sessionScope.user.grade eq '0'}"><p class="sub-text">슬밀프랜즈</p></c:when>
								<c:when test="${sessionScope.user.grade eq '1'}"><p class="sub-text">슬밀패밀리</p></c:when>
								<c:when test="${sessionScope.user.grade eq '2'}"><p class="sub-text">슬밀히어로</p></c:when>
								<c:when test="${sessionScope.user.grade eq '3'}"><p class="sub-text">슬밀마스터</p></c:when>
						</c:choose>
						<!-- 선호음식 카테고리  null처리하기-->
						<p class="sub-text">${sessionScope.user.foodCategoryName1}  ${sessionScope.user.foodCategoryName2}  ${sessionScope.user.foodCategoryName3}</p>
					</div>	               
					<div class="follow-info"><!-- 팔로우, 팔로워, 차단 모달창 클릭 -> 실행-->
		                <p><a id = "follow-user-list"  data-toggle="modal" data-target="#followModal" >팔로잉 <span class="followTotalCount">${followMap.followTotalCount}</span></a></p> <!-- 팔로우 목록 모달창 -->
		                <p><a id = "follower-user-list"  data-toggle="modal" data-target="#followerModal">팔로워 ${followerMap.followerTotalCount}</a></p> <!-- 팔로워 목록 모달창 -->
		                <a id="block-user-list" data-toggle="modal" data-target="#blockUserModal">차단유저목록</a>
		            </div>
	            </div>
			</div><!-- 프로필 col 끝-->
		</div><!-- wraaper 끝 -->
	</section><!-- main 끝 -->

	
		
		
		<!-- include 모달창  -->
		<jsp:include page="listCommunityFollowUserModal.jsp"></jsp:include>
		<jsp:include page="listCommunityFollowerUserModal.jsp"></jsp:include>
		<jsp:include page="listCommunityBlockUserModal.jsp"></jsp:include>


<script type="text/javascript">
	function slick2(e){		
		$(e).slick({
			dots : true,
			infinite : true,
			speed : 500,
			fade : true,
			cssEase : 'linear',
			arrows : true
					});
	}

	// slick
	$(document)
	.ready(function() {
			slick2('.your-class');
			});

	

	// 좋아요, 좋아요 취소
	function like(e){
		const heart = $(e)		
		console.log(heart);
		const postNo = $(e).data("value");
		//alert("postNo: " + postNo);
		console.log("postNo: " + postNo);

		//like_cnt = <span class="like-cnt">${post.likeCount}</span>
		const div_like_cnt = $(e).parent().parent().find("span.like-cnt");
		console.log(div_like_cnt);
		
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
        
				div_like_cnt.html(value); // 좋아요 개수 수정
			
			}, error : function(jqXHR, status){
				console.log(jqXHR);	// 응답 메시지
				console.log(status); // "errror"
			}
		});
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
					//alert("차단해제 완료!");
					line.remove();
				}else{
					//alert("차단해제 실패..");
				}
			}
		});

	});


	// 게시글 무한스크롤
	$(function(){
		
		let currentPage = 2;
		let maxPage = ${resultPage.maxPage};
		//let index = ${resultPage.pageUnit};

		
		let abc = 1;
		$(window).scroll(function(){
			
			let $window = $(this);
			let scrollTop = $window.scrollTop();
			let windowHeight = $window.height();
			let documentHeight = $(document).height();		
			
			if(scrollTop + windowHeight >= documentHeight && currentPage <= maxPage){
				setTimeout(getListPost,200);//0.2초
			}
			
				function getListPost(){
								
					$.ajax({
						url:"/community/api/getListPost?currentPage="+currentPage,
						type:"GET",
						datatype:"json",
						async: false,
						success: function(data, status, jqXHR){

							console.log("success status: "+ status);
							console.log("data: " + data);
							console.log("jqXHR: "+ jqXHR);
							console.log("json/stringify: "+JSON.stringify(data));						
							//const posts = JSON.stringify(data);	
							
									
							for(let i = 0; i<data.length; i++){
								
								let post = data[i];
								
								let likeStats = post.likeStatus;
								console.log("/////"+likeStats)
								
								let postCardHtml = `
									<div class="post-card">
									    <div class="info">
									        <div class="user">
									            <div class="profile-pic">
									                <a class ="profile-link">
									                    <img class="profile-img"/>
									                </a>
									            </div>                  
									            <p id = "post_nickname" class="username">
									                <a id= "profile-nick" class ="profile-link2" ></a>
									            </p>
									        </div>
									        <i id = "option_icon" class="bi bi-three-dots option_icon" data-toggle="modal" ></i>
									    </div>
									    <div class="your-class-m">
									    <div class="your-class\${currentPage}">
									    	
									    </div>
									    </div>
									    <div class="post-content">
									        <div class="reaction-wrapper">
									        
									            <i class="bi bi-eye icon"></i>
									            <i class="bi bi-chat-left icon"></i>
									        </div>
									        <p class="likes">좋아요 <span class="like-cnt"></span></p>	
									        
									        <div class="post-time"></div>
									    </div>
									</div>
									`;
									
								let div1 = `
											<a class ="post-link">
												<img id = "post-img" class="post-image"/>
											</a>
											`;
										
								let div2 = `<div class="post-list-title"></div>
							            <div id="post-list-content" class="post-list-content">
							            <div style="margin-bottom: 30px;"><a class="post-shortContent"></a></div>								
							            </div>`;
								
							    let div3 = `<div class="description"></div>`;
								
								let postCard = $($.parseHTML(postCardHtml));
								let div_1 = $($.parseHTML(div1));
								let div_2 = $($.parseHTML(div2));
								let div_3 = $($.parseHTML(div3));

								
								if(post.attachments == ""){
									
									$(postCard).find(".your-class-m").append(div_2);

									$(postCard).find(".post-list-title").text(post.title);
									$(postCard).find(".post-shortContent").attr("href","/community/getPost/"+post.postNo)
									$(postCard).find(".post-shortContent").append(post.shortContent);
								}else{
									
									$(postCard).find(".post-time").before(div_3);
									$(postCard).find(".description").html(post.shortContent);
									
									for(let j = 0; j < post.attachments.length; j++){	
										$(postCard).find(".your-class"+currentPage).append(`
											<a class ="post-link">
												<img id = "post-img" class="post-image" src="/resources/attachments/\${post.attachments[j].attachmentName}"/>
											</a>
											`);
										$(postCard).find(".post-link").attr("href","/community/getPost/"+post.postNo);
									}
								}
								
								if(post.likeStatus === '1'){									
									$(postCard).find("i.bi.bi-eye.icon").before(`<i class="bi bi-heart-fill icon" onclick="like(this)" style="color:red;" data-value="\${post.postNo}"></i>`);
								}else if(post.likeStatus === undefined ){
									$(postCard).find("i.bi.bi-eye.icon").before(` <i class="bi bi-heart icon" onclick="like(this)" data-value="\${post.postNo}"></i>`);
								}
								
								//$(postCard).find("a.profile-link").attr("href","/community/getProfile/"+post.user.userId);							
								$(postCard).find(".profile-img").attr("src","/resources/attachments/profile_image/"+post.user.profileImage);
								$(postCard).find(".profile-link").attr("href","/community/getProfile/"+post.user.userId)
								$(postCard).find(".profile-link2").attr("href","/community/getProfile/"+post.user.userId)
								$(postCard).find(".profile-link2").text(post.user.nickName);
								
								$(postCard).find("i.bi.bi-eye.icon").text(post.views);
								$(postCard).find("i.bi.bi-chat-left.icon").text(post.commentCount);
								$(postCard).find(".like-cnt").text(post.likeCount);
								$(postCard).find(".post-time").text(post.regDate);
								$(postCard).find(".option_icon").attr("data-value", post.postNo);
								//$(postCard).find(".option_icon").attr("data-target",".fade\${index}");
								
								console.log("postC: "+postCard);
								
								$(".left-col").append(postCard);
								//index++;
							}//for
							slick2('.your-class'+currentPage);								
						}//success
						, error: function(status, jqXHR){
							console.log("error status: "+ status);
							console.log("jqXHR: "+ jqXHR);
							alert("페이지 로드 실패");
						}
						
					})//jQuery.ajax()
					
				currentPage ++;
				}//getListPost
				
		})//window.scroll()
		
		
	});
	
	function deletePost(e){
		
		let postNo = $(e).data("value");
		
		let result = confirm("정말 삭제하시겠습니까?")
		if(result){
			window.location.href= "/community/deletePost/"+postNo;
		}
	}
	
	// 신고한 게시글인지 체크
	function reportCheck(e){
		const modal = $(e).data("target")
		const modalpar = $(e).parent().parent().parent().parent().parent()
		const btn = $(`\${modal}`).find(".btn-primary")
		const next = $(e).next(".reportTrue");
		
		
		$.ajax({
			url : "/community/api/checkReport/"+btn.data("value"),
			method : "GET",
			dataType : "json",
			contentType : "application/json; charset=utf-8",
	        success : function(data,status){
	        	console.log(status)
	        	if(status === 'nocontent'){
	        		toastr.error("이미 신고된 게시글 입니다.","게시글 신고",{timeOut:10000})
	        		modalpar.modal('hide')
	        	}
	        	if(status ==='success'){
	        		modalpar.modal('hide')
	        		$(`\${modal}`).modal('show');
	        	}
	        }
		})
	}
	
	// 게시글 신고 넣기
	function reportPost(e){		
		const postNo = $(e).data("value");
		const reason = $(e).parent().parent().find("#reason").val();
		
		const modal = $(e).parent().parent().parent().parent()
		
		
		$.ajax({
			url : "/community/api/insertReportPost",
			method : "POST",
			data : JSON.stringify({
				postNo : postNo,
				reason : reason
			}),
			dataType : "json",
			contentType : "application/json; charset=utf-8",
	        success : function(data,status){
	        	if(status === 'success'){
	        		toastr.error("게시글 신고가 완료 되었습니다.","게시글 신고 완료",{timeOut:10000})
	        		modal.modal('hide');
	        	}
	        }
		})		
		//$(".report-form").attr("method","POST").attr("action","/community/insertReportPost").submit();
	}
	
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
	
	
</script>
</body>
</html>