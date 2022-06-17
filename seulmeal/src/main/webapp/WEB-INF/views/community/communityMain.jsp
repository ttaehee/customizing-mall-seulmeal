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

.brand-img {
	height: 100%;
	margin-top: 5px;
}

.search-box {
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

.search-box::placeholder {
	color: rgba(0, 0, 0, 0.5);
}

.nav-items {
	height: 22px;
	position: relative;
}

.icon {
	height: 100%;
	/*cursor: pointer;*/
	margin: 0 10px;
	display: inline-block;
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
    grid-gap: 30px;
}

.left-col{
    display: flex;
    flex-direction: column;
}

.status-wrapper{
    width: 100%;
    height: 120px;
    background: #fff;
    border: 1px solid #dfdfdf;
    border-radius: 2px;
    padding: 10px;
    padding-right: 0;
    display: flex;
    align-items: center;
    overflow: hidden;
    overflow-x: auto;
}

.status-wrapper::-webkit-scrollbar{
    display: none;
}

.status-card{
    flex: 0 0 auto;
    width: 80px;
    max-width: 80px;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-right: 15px;
}

.post-div{
	margin-bottom:20px;	
	border: 1px solid #dfdfdf;
	
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

#post-list-title{
	margin-top: 20px;
	margin-left: 20px;
	font-size: 20px;
	font-weight: bold;
}

#post-list-content{
	margin: 30px; 
	
}


.post-image{
    width: 100%;
    height: 500px;
    object-fit: cover;
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

.comment-wrapper{
    width: 100%;
    height: 50px;
    border-radius: 1px solid #dfdfdf;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.comment-wrapper .icon{
    height: 30px;
}

.comment-box{
    width: 80%;
    height: 100%;
    border: none;
    outline: none;
    font-size: 14px;
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

.reaction-wrapper{
    width: 100%;
    height: 50px;
    display: flex;
    margin-top: -28px;
    align-items: center;
}

/* 좋아요수, 조회수, 댓글수 아이콘*/
.reaction-wrapper .icon{
    height: 25px;
    margin: 0;
    margin-right: 20px;
}

.reaction-wrapper .icon.save{
    margin-left: auto;
}




/* //////////우측 프로필 카드////////*/
.right-col{
    padding: 10px;
    position:fixed;
    left:58%;
}

.profile-card{
    width: 400px;
    display:flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px 0px 0px 100px;
    /*border: 1px solid black;*/
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

.sub-text{
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

.suggestion-text{
    font-size: 14px;
    color: rgba(0, 0, 0, 0.5);
    font-weight: 700;
    margin: 20px 0;
}


@media (max-width: 1100px){
    .right-col, .search-box{
        display: none;
    }
    .nav-wrapper,
    .wrapper{
        width: 90%;
    }
    .wrapper{
        display: block;
    }
}

@media (max-width: 500px){
    .nav-items .icon{
        margin: 0 5px;
    }
    .post-image{
        height: 300px;
    }
}

.slick-dots{
	height:30px;
}

#block-user-list{
	cursor:pointer;
}

.bi.bi-heart.icon{
	cursor:pointer;
}

#block-list-image {
    margin: 10px;
}

#block-list-nickname {
    width: 280px;
    font-size: 17px;
    font-weight: normal;
}

#block-list-card {
    width: 466px;
}

</style>

</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>

	<!-- 내비 검색바 -->
	<nav class="navbar">
		<div class="nav-wrapper">
			<img src="img/logo.PNG" class="brand-img" alt=""> <input
				type="text" class="search-box" placeholder="search">
			<div class="nav-items">
				<img src="img/home.PNG" class="icon" alt=""> <img
					src="img/messenger.PNG" class="icon" alt=""> <img
					src="img/add.PNG" class="icon" alt=""> <img
					src="img/explore.PNG" class="icon" alt=""> <img
					src="img/like.PNG" class="icon" alt="">
				<div class="icon user-profile"></div>
			</div>
		</div>
	</nav>

	<!-- 검색, 정렬, 게시글 작성버튼 작성 -->
	<div class="search-order-post">	
	
		<form class="form-inline" action="/community/communityMain" method="GET">
			<div style="margin:auto;">
				<div class = "search-div" >	
				    <input style="width:180px" class="form-control mr-sm-2" id = "search" name = "searchKeyword" type="search" placeholder="게시글 제목+내용" aria-label="Search">
				    <button class="btn btn-outline-success my-2 my-sm-0" id="searchBtn" type="submit">검색</button>
			    </div>
			</div>
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
					  
						<c:if test="${not empty sessionScope.user.userId}">
							<button  type="button" onclick="location.href='/community/insertPost'" class="btn btn-primary">
								게시글 작성
							</button>
						</c:if>
						
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
		
			<div class="post-div">
                <div class="info">
                    <div class="user">
                    	<!-- 1. 프로필 이미지 -->
                    	<div class="profile-pic">
                    	
                  		  	<c:choose> 
								<c:when test="${not empty post.user.profileImage}">
									<a href="/community/getProfile/${post.user.userId}"><img src="/resources/attachments/profile_image/${post.user.profileImage}"/></a>
								</c:when>
								<c:otherwise>
									<a href="/community/getProfile/${post.user.userId}"><img src="/resources/attachments/profile_image/default_profile.jpg"/></a>							
								</c:otherwise>						
							</c:choose>
                    	
                    	</div>
						<!-- 2. 닉네임 -->                       
                        <p class="username">
                        	<c:choose> 
								<c:when test="${not empty post.user.nickName}">
									<a href="/community/getProfile/${post.user.userId}">${post.user.nickName}</a>
								</c:when>
								<c:otherwise>
									<a href="/community/getProfile/${post.user.userId}">${post.user.userId}</a>							
								</c:otherwise>						
							</c:choose>
                        </p>
                    </div>
                    <!-- 게시글 옵션 아이콘 -->
                    <i id = "option_icon" class="bi bi-three-dots"></i>
                    <!-- img src="img/option.PNG" class="options" alt="옵션"-->
                </div>
                <!-- 3. 게시글사진/제목+간략내용 -->
	            <div class="your-class">
	                <c:if test="${not empty post.attachments}">
						<c:forEach var="attach" items="${post.attachments}">
							<a href="/community/getPost/${post.postNo}"><img class="post-image" src="/resources/attachments/${attach.attachmentName}"/></a>
						</c:forEach>									
					</c:if>
				</div>
				<c:if test="${empty post.attachments}">
					<div id="post-list-title">${post.title}</div>
					<div id="post-list-content"><!-- 게시글 내용 200자 이상이면, 200자까지만 출력 -->
						<c:choose>
							<c:when test="${fn:length(post.content) > 200}">
								<a href="/community/getPost/${post.postNo}">${fn:substring(post.content, 0, 200)}...</a>
							</c:when>
							<c:otherwise>
								<a href="/community/getPost/${post.postNo}">${post.content}</a>								
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>
				
                <!-- img src="img/cover 1.png" class="post-image" alt=""-->
                <div class="post-content">
                    <div class="reaction-wrapper">
                    	<i class="bi bi-heart icon" data-value="${post.postNo}"></i>
                    	<i class="bi bi-heart-fill" style="display:none;"></i>
                    	<!-- 4.조회수, 댓글수 -->
                    	<i class="bi bi-eye icon">${post.views}</i>
                    	<i class="bi bi-chat-left icon">${post.commentCount}</i>
                    </div>
                    <!-- 5. 좋아요 수-->
                    <p class="likes">좋아요 <span class="like-cnt">${post.likeCount}</span></p>	
                    <c:if test="${not empty post.attachments}">
                    	<p class="description">
                    	<c:choose>
							<c:when test="${fn:length(post.content) > 50}">
								${fn:substring(post.content, 0, 50)}...
							</c:when>
							<c:otherwise>
								${post.content}								
							</c:otherwise>
						</c:choose>
                    	</p>
                    
                    	<!-- a href="/community/getPost/${post.postNo}">${post.content}</a-->
                    </c:if>
                    <!-- 6. 등록날짜-->
                    <div class="post-time">${post.regDate}</div>
                </div>
                <!--div class="comment-wrapper">
                    <img src="img/smile.PNG" class="icon" alt="">
                    <input type="text" class="comment-box" placeholder="Add a comment">
                    <button class="comment-btn">post</button>
                </div-->
            </div>
         	
         </c:forEach>   
        
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
	                    <p class="username"><a style ="font-size: 19px;" class = "username" href="/community/getProfile/${sessionScope.user.userId}">${sessionScope.user.nickName}</a></p>
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
					<div class="follow-info">
		                <p><a class="follow" role="link" href="#">팔로우 ${followCnt}</a></p> <!-- 팔로우 목록 모달창 -->
		                <p><a class="follower" role="link" href="#">팔로워 ${followerCnt}</a></p> <!-- 팔로워 목록 모달창 -->
		                <a id="block-user-list" data-toggle="modal" data-target="#blockUserModal">차단유저목록</a>
		            </div>
	            </div>
			</div><!-- 프로필 col 끝-->
		</div><!-- wraaper 끝 -->
	</section><!-- main 끝 -->




		<!-- 차단목록 모달 -->
              <div id="blockUserModal" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable modal-md " role="document">
                  <div class="modal-content">
                  
                  
                      <!-- 외부 모달 창 load 되는 곳 -->
                          <!-- 헤더 -->
                          <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalScrollableTitle">차단 유저 목록</h5>
                              <button type="button" class="close" data-dismiss="modal"
                                  aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                              </button>
                          </div>
                      
                      
                      <div class="modal-body">
                          
                              <!-- 차단 유저 리스트 -->
                                  <c:forEach var="relation" items="${blockList}">
                                      <div class ="block-li">
                                          <div class="blockUser_section" >
                                          
                                          
								            <div id="block-list-card" class="profile-card">
								                <div id="block-list-image" class="profile-pic">
								                	<c:choose>
	                                                  <c:when test="${empty relation.relationUser.profileImage}">
	                                                      <a href="/community/getProfile/${relation.relationUser.userId}"><img src="/resources/attachments/profile_image/default_profile.jpg"  class="rounded-circle"></a>
	                                                  </c:when>
	                                                  <c:otherwise>
	                                                      <a href="/community/getProfile/${relation.relationUser.userId}"><img src="/resources/attachments/profile_image/${relation.relationUser.profileImage}" class="rounded-circle"/></a>
	                                                  </c:otherwise>
	                                              	</c:choose>
								                </div>
								                <div>
								                   <div id="block-list-nickname" class="username" >
								                   		<c:choose>
										                  	<c:when test="${not empty relation.relationUser.userId}">
																<a href="/community/getProfile/${relation.relationUser.userId}">${relation.relationUser.userId}</a>
															</c:when>
															<c:otherwise>
																<a href="/community/getProfile/${relation.relationUser.userId}">${relation.relationUser.userId}</a>							
															</c:otherwise>
														</c:choose>	
								                  </div>
								                    <div id="block-list-profilemsg" class="sub-text">${relation.relationUser.profileMessage}</div>
								                </div>
								                <div><button class="action-btn" data-value="${relation.relationUser.userId}">차단해제</button></div>
								            </div>
								            
                                          </div>
                                          
                                      </div>
                                  </c:forEach>
                  
                    	  </div>
                      
                      
                          <!-- 푸터 -->
                          <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                          </div>			    	
                                    
                    </div>
                </div>
            </div>
            <!-- 모달 끝 -->










<script type="text/javascript">

	// slick
	$(document)
	.ready(function() {$('.your-class').slick({
			dots : true,
			infinite : true,
			speed : 500,
			fade : true,
			cssEase : 'linear',
			arrows : true
			//prevArrow : "<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
			//nextArrow : "<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>"
					});
			});


	// 좋아요
	$("i.bi.bi-heart.icon").on("click", function() {
		
		const postNo = $(this).data("value");
		//alert("postNo: " + postNo);
		console.log("postNo: " + postNo);

		//like_cnt = <span class="like-cnt">${post.likeCount}</span>
		const div_like_cnt = $(this).parent().parent().find("span.like-cnt");
		console.log(div_like_cnt);
		
		$.ajax({
			url : "/community/api/insertLike/" + postNo,
			method : "POST",
			success : function (data, status, jqXHR){
				
				alert("좋아요 성공");
				
            	console.log(data); //응답 body부 데이터
            	console.log(status); //"succes"로 고정인듯함
            	console.log(jqXHR)
				
            	const likeCount = data;
				console.log("likeCount: " + likeCount);
				
				div_like_cnt.html(likeCount); // 좋아요 개수 수정
				
			
			}, error : function(jqXHR, status){
				
            	alert("좋아요 이미 누름..");

				console.log(jqXHR);	// 응답 메시지
				console.log(status);	// "errror"로 고정인듯함
				//console.log(errorThrown);
			}
		});

	});
	
	
	// 차단해제
	$("button.action-btn").on("click", function() {
		
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
					alert("차단해제 실패..")
				}
			}
		});

	});
	
	
	
	
	
	// 무한 스크롤
	let page = 2;
	$(window).on("scroll", function() {

	     const scrollHeight = $(document).height();
	     const scrollPosition = $(window).height() + $(window).scrollTop();
	     if (scrollHeight <= scrollPosition) {         
	         //console.log(${resultPage.endUnitPage})
	         if(page <=${resultPage.maxPage}){
	         $.getJSON("/community/api/getListPost",
	                     {
	                         currentPage : page,
	                         //searchCondition : ${search.searchCondition},
	                   		 searchKeyword : "${search.searchKeyword}"         
	                     },
	                     (data,status)=>{
	                        if(status ==='success'){
	                           for(let i=0; i<data.list.length; i++){
	                              
	                              let card = $(".productComponet").clone()[0];
	                              //let card = $(".product").clone();
	                              const prod = data.list[i];
	                              $(card).find(".title").attr("data-value",prod.prodNo).text(prod.prodName)
	                              $(card).find(".date").text(prod.regDate)
	                              $(card).find(".price").text(prod.price)
	                              $(card).find(".image").attr("src","../images/uploadFiles/"+prod.fileName);
	                              $(card).find(".float-end").text(prod.stock)
	                              
	                              if(prod.stock===0){
	                                 $(card).find(".status").text("재고없음")
	                              } else {
	                                 $(card).find(".status").text("판매중")
	                              }
	                              
	                              
	                              $("#scroll_test").append(card);
	                              
	                              
	                              /*
	                              $( "#send:contains('배송하기')" ).on("click" , function() {
	                                 const prodNo = $(this).data("value");
	                                 self.location = "/updateTranCode?prodNo="+prodNo+"&tranCode=2&menu=${param.menu}&con=''";
	                              });
	                              
	                              if('${user.role}' !== 'admin'){
	                                 $(".title").on("click",function (){         
	                                    const prodNo = $(this).data("value");
	                                    self.location = "/product/getProduct?prodNo="+prodNo;
	                                 })
	                              } else {
	                                 $(".title").on("click",function (){         
	                                    const prodNo = $(this).data("value");
	                                    self.location = "/product/updateProduct?prodNo="+prodNo;
	                                 })
	                              }
	                              */
	                              
	                           }
	                           
	                        }
	                     })
	         //$("#test").append('<div id="content">123122332</div>');
	         //console.log(page)
	         //page++
	         }
	         //console.log($(".container").clone())
	         //$("#test").append($(".container").clone()[0])
	         page++
	     }        
	 });
	
	
	
	
</script>
</body>
</html>