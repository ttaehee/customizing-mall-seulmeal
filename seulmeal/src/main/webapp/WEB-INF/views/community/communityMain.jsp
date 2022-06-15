<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

#searchBox{
	position: absolute;
	right:80px;
}

#profileImage{
	width: 80px; 
	height: 80px";
}

</style>



<title>community Main</title>
</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>



				<div style="float:right;">	
					<c:if test="${not empty sessionScope.user.userId}">
						<button  type="button" onclick="location.href='/community/insertPost'" class="btn btn-primary">
							게시글 작성
						</button>
					</c:if>
				</div>

				<br/>
				<br/>
				<br/>


<!-- 
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="right">		
				<select name="searchCondition" class="ct_input_g" style="width: 80px">
					<option value="1" ${search.searchCondition eq '1'? 'selected':''}>조회순</option>
					<option value="2" ${search.searchCondition eq '2'? 'selected':''}>좋아요순</option>
					<option value="3" ${search.searchCondition eq '3'? 'selected':''}>최신순</option>
				</select> 
					<input type="text" name="searchKeyword" 
					class="ct_input_g" style="width: 200px; height: 19px" />
					</td>

					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"></td>
								<td class="ct_btn01"
									style="padding-top: 3px;">
									<input type="submit" value="검색"/>
								<td width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
 -->
 
 
	<!-- 게시글 목록 -->	
	<div class="container">
		
		<!-- 정렬 및 검색 -->
			<div style="float:left;">	
				<form class="form-inline" action="/community/communityMain" method="get">
			
					<ul class="nav">
					  <li class="nav-item">
					    <a class="nav-link active" href="/community/communityMain?searchCondition=1&searchKeyword=">조회순</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/community/communityMain?searchCondition=2">좋아요순</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/community/communityMain?searchCondition=3">최신순</a>
					  </li>
					</ul>
					
				<div id = "searchBox">	
				    <input style="width:180px" class="form-control mr-sm-2" id = "search" name = "searchKeyword" type="search" placeholder="게시글 제목+내용" aria-label="Search">
				    <button class="btn btn-outline-success my-2 my-sm-0" id="searchBtn" type="submit">검색</button>
			    </div>
			    
			  </form>
			</div>		
		
		
			<table width="100%"  cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">

				<tr>
					<td class="ct_list_b">게시글유저_프로필이미지</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" >게시글유저_닉네임</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">게시글 사진 / 제목+간략내용</td>
					<td class="ct_line02"></td>
					
					<!-- 
					<td class="ct_list_b">게시글 제목</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">게시글 간략?내용</td>
					<td class="ct_line02"></td>
					 -->
					
					<td class="ct_list_b">좋아요 수</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">조회수</td>
					<td class="ct_line02"></td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>

				<!-- 게시글 목록 -->				
				<c:forEach var="post" items="${postList}" varStatus="status">
					<tr class="ct_list_pop">
					
						<!-- 1. 프로필 이미지 -->
						<td align="left">
							<c:choose> 
								<c:when test="${not empty post.user.profileImage}">
									<a href="/community/getProfile/${post.user.userId}"><img style="width:80px; height:80px;" class="rounded-circle" src="/resources/attachments/profile_image/${post.user.profileImage}"/></a>
								</c:when>
								<c:otherwise>
									<a href="/community/getProfile/${post.user.userId}"><img style="width:80px; height:80px;" src="/resources/attachments/profile_image/default_profile.jpg"/></a>							
								</c:otherwise>						
							</c:choose>
						</td>
						<td></td>
						
						<!-- 2. 닉네임 -->
						<td align="left">
							<c:choose> 
								<c:when test="${not empty post.user.nickName}">
									<a href="/community/getProfile/${post.user.userId}">${post.user.nickName}</a>
								</c:when>
								<c:otherwise>
									<a href="/community/getProfile/${post.user.userId}">${post.user.userId}</a>							
								</c:otherwise>						
							</c:choose>
							
						</td>
						<td></td>
						
						<!-- 3. 게시글사진/제목+간략내용 -->
						<td align="left">
													
							<!-- 사진 -->
							<c:if test="${not empty post.attachments}">
								<c:forEach  var="attach" items="${post.attachments}">
											<a href="/community/getPost/${post.postNo}">
											<img style="width:80px; height:80px;" src="/resources/attachments/${attach.attachmentName}"/></a>
								</c:forEach>			
							</c:if>
																
							<!-- 사진 없을 경우, 제목+간략내용 -->
							<c:if test="${empty post.attachments}">
								${post.title} / ${post.content}<a href="/community/getPost/${post.postNo}"></a>
							</c:if>
							
						</td>
						
						<!-- 
						<td></td>
						<td align="left"><a href="/community/getPost/${post.postNo}">${post.title}</a></td>
						<td></td>
						<td align="left"><a href="/community/getPost/${post.postNo}">${post.content}</a></td>
						<td></td> -->
						
						<!-- 4. 좋아요 수 -->
						<td align="left">${post.likeCount}</td>
						<td></td>
						<!-- 5. 조회수 -->
						<td align="left">${post.views}</td>
						<td></td>
					</tr>
				</c:forEach>
				
				
			</table>
			
		<br/>
		<br/>
		<br/>
	</div>
		
		
		
		<div class="container">
		<!-- table : 유저 프로필 -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">

				<tr>
					<td class="ct_list_b">로그인유저_프로필이미지</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">로그인유저_닉네임</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" >상태메시지</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">회원등급</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">선호음식 카테고리1</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">카테고리2</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">카테고리3</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">팔로우 수</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">팔로워 수</td>
					<td class="ct_line02"></td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				
					<tr>
						
						<td align="left">
						<c:choose> 
							<c:when test="${not empty post.user.profileImage}">
								<a href="/community/getProfile/${sessionScope.user.userId}"><img id="profileImage" class="rounded-circle" src="/resources/attachments/profile_image/${sessionScope.user.profileImage}"/></a>
							</c:when>
							<c:otherwise>
								<a href="/community/getProfile/${sessionScope.user.userId}"><img id="profileImage" class="rounded-circle" src="/resources/attachments/profile_image/default_profile.jpg"/></a>
							</c:otherwise>						
						</c:choose>
						</td>
						<td></td>
						<td align="left"><a href="/community/getProfile/${sessionScope.user.userId}">${sessionScope.user.nickName}</a></td>
						<td></td>
						<td align="left">${sessionScope.user.profileMessage}</td>
						<td></td>
						<td align="left">
						<c:choose>
							<c:when test="${user.grade eq '0'}">슬밀프랜즈</c:when>
							<c:when test="${user.grade eq '1'}">슬밀패밀리</c:when>
							<c:when test="${user.grade eq '2'}">슬밀히어로</c:when>
							<c:when test="${user.grade eq '3'}">슬밀마스터</c:when>
						</c:choose>
						</td>
						<td></td>
						<td align="left">${sessionScope.user.foodCategoryName1}</td>
						<td></td>
						<td align="left">${sessionScope.user.foodCategoryName2}</td>
						<td></td>
						<td align="left">${sessionScope.user.foodCategoryName3}</td>
						<td></td>
						<td align="left"><a href="/community/api/getListFollow" id ="followCnt">${followCnt}</a></td>
						<td></td>
						<td align="left"><a href="/community/api/getListFollower">${followerCnt}</a></td>
						<td></td>
						
					</tr>
			</table>	
			
		<div class="listBlockUser">
			<button type="button" onclick="location.href='/community/api/getListBlock'" class="btn btn-primary">
				차단유저 목록보기
			</button>
		</div>
			
	</div>
		
		
		<!-- table : 밀키트 추천 
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">

				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">등록일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
			</table>
-->
			
			<br/>

<script type="text/javascript">

</script>

</body>
</html>