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



		<!-- table : 검색 (searchCondition, searchKeyword) -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>



				<!-- condition, keyword -->
					<td align="right">
					
					<c:if test="${not empty sessionScope.user.userId}">
						<button type="button" onclick="location.href='/community/insertPost'" class="btn btn-primary">
							게시글 작성
						</button>
					</c:if>
				

					
					<select name="searchCondition" class="ct_input_g" style="width: 80px">
							<option value="1" ${search.searchCondition eq '1'? 'selected':''}>조회순</option>
							<option value="2" ${search.searchCondition eq '2'? 'selected':''}>좋아요순</option>
							<option value="3" ${search.searchCondition eq '3'? 'selected':''}>최신순</option>
							
							<!-- option value="1" ${search.searchCondition eq '1'? 'selected':''}>유저 닉네임</option-->
					</select> 
					
			
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
				    <input class="form-control mr-sm-2" id = "search" name = "searchKeyword" type="search" placeholder="게시글 제목+내용" aria-label="Search">
				    <button class="btn btn-outline-success my-2 my-sm-0" id="searchBtn" type="submit">검색</button>
			    </div>
			    
			  </form>
			
			
					<input type="text" name="searchKeyword" 
					class="ct_input_g" style="width: 200px; height: 19px" />
					</td>

				<!-- 검색버튼 -->
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


		<!-- table : 게시글 목록 -->
			<table width="100%"  cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">

				<tr>
					<td class="ct_list_b">게시글유저_프로필이미지</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" >게시글유저_닉네임</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">게시글 사진</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">게시글 제목</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">게시글 간략?내용</td>
					<td class="ct_line02"></td>
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
				
				<!-- c:set var="no" value="0"/-->
				<c:forEach var="post" items="${postList}" varStatus="status">
					<tr class="ct_list_pop">
						<td align="left"><a href="/community/getProfile/${post.user.userId}"><img style="width:80px; height:80px;" src="/resources/attachments/profile_image/${post.user.profileImage}"/></a></td>
						<td></td>
						<td align="left"><a href="/community/getProfile/${post.user.userId}">${post.user.nickName}</a></td>
						<td></td>
						<td align="left">
						<c:forEach  var="attachments" items="${attachmentList[status.index]}">
							<a href="/community/getPost/${post.postNo}">
							<img style="width:80px; height:80px;" src="/resources/attachments/${attachments.attachmentName}"/></a>
						</c:forEach>
						</td>
						<td></td>
						<td align="left"><a href="/community/getPost/${post.postNo}">${post.title}</a></td>
						<td></td>
						<td align="left"><a href="/community/getPost/${post.postNo}">${post.content}</a></td>
						<td></td>
						<td align="left">${post.likeCount}</td>
						<td></td>
						<td align="left">${post.views}</td>
						<td></td>
					</tr>
				</c:forEach>
				
				
			</table>
			
		<br/>
		<br/>
		<br/>
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
						<td align="left"><a href="/community/getProfile/${sessionScope.user.userId}"><img id="profileImage" src="/resources/attachments/profile_image/${sessionScope.user.profileImage}"/></a></td>
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