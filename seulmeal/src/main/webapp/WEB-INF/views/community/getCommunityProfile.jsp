<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
</style>


</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>

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
					<td class="ct_list_b">선호음식 카테고리2</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">선호음식 카테고리3</td>
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
						<td align="left"><img style="width: 80px; height: 80px" src="../../resources/attachments/profile_image/${sessionScope.user.profileImage}"/></td>
						<td></td>
						<td align="left">${sessionScope.user.nickName}</td>
						<td></td>
						<td align="left">${user.profileMessage}</td>
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
						<td align="left">${user.foodCategoryName1}</td>
						<td></td>
						<td align="left">${user.foodCategoryName2}</td>
						<td></td>
						<td align="left">${user.foodCategoryName3}</td>
						<td></td>
						<td align="left"><a href="/community/api/getListFollow" id ="followCnt">${followCnt}</a></td>
						<td></td>
						<td align="left"><a href="/community/api/getListFollower">${followerCnt}</a></td>
						<td></td>
						
						
						
					</tr>
			</table>	
			
	<!-- 내 프로필 -->
	<!-- div class="listBlockUser">
			<button type="button" onclick="location.href='/community/api/getListBlock'" class="btn btn-primary">
				차단유저 목록보기
			</button>
	</div-->
	
	<!-- 모달창 실행 버튼 -->
	<div class="listBlockUser">
			<button id = "blockUser_Btn" data-toggle="modal" data-target="#blockUserModal" type="button" class="btn btn-primary">
				차단유저 목록보기
			</button>
	</div>
	<!-- Modal -->
	<div id="blockUserModal" class="modal fade"  aria-labelledby="staticBackdropLabel" aria-hidden="true" data-backdrop="static" tabindex="-1" role="dialog">
		<div class="modal-dialog" >
			<div class="modal-content">
				<!-- 외부 모달 창 load 되는 곳 -->
			</div>
		</div>
	</div>
	
	
	<div class="updateProfile">
			<button type="button" onclick="location.href='/community/updateProfile'" class="btn btn-primary">
				프로필 정보 수정
			</button>
	</div>
	

<br/><br/>

		<!-- table : 본인 게시글 목록 -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">

				<tr>
					<td class="ct_list_b">게시글유저_프로필이미지</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" >게시글유저_닉네임</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">게시글 제목</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">게시글 간략?내용</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">좋아요 수</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">조회수</td>
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
				<c:forEach var="post" items="${postList}">
					<tr class="ct_list_pop">
						<td align="left"><img style="width: 80px; height: 80px" src="../../resources/attachments/profile_image/${post.user.profileImage}"/></td>
						<td></td>
						<td align="left">${post.user.nickName}</td>
						<td></td>
						<td align="left">${post.title}</td>
						<td></td>
						<td align="left">${post.content}</td>
						<td></td>
						<td align="left">${post.likeCount}</td>
						<td></td>
						<td align="left">${post.views}</td>
						<td></td>
						<!-- 게시글 사진 -->
					</tr>
				</c:forEach>
				
				
			</table>



<!-- 타유저 프로필 -->
<div class="container">
	<!-- 팔로우 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				팔로우userId : <input id="followUserId" name="followUserId" />
			</div>
		</div>

		<div style="display: flex; justify-content: space-between;">
			<div>
				<button id="insertFollowBtn" type="button" class="btn btn-primary">
					등록</button>
				<button id="deleteFollowBtn" type="button" class="btn btn-primary">
					삭제</button>
				<!-- button id="updateBtn" type="button" class="btn btn-primary">
					수정</button-->
			</div>
		</div>
	</div>


	<!-- 차단 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				차단userId : <input id="blockUserId" name="blockUserId" />
			</div>
		</div>

		<div style="display: flex; justify-content: space-between;">
			<div>
				<button id="insertBlockBtn" type="button" class="btn btn-primary">
					등록</button>
				<button id="deleteBlockBtn" type="button" class="btn btn-primary">
					삭제</button>
				<!-- button id="updateBtn" type="button" class="btn btn-primary">
					수정</button-->
			</div>
		</div>
	</div>
</div>

</div>
	
		<script>
		// ===================================== 추가 부분 ========================================
		//태그명.클래스명
		$("#insertFollowBtn").on(
				"click",
				function() {

					var strData = $("#followUserId").val()

					alert("followUserId: " + strData);
					console.log("followUserId: " + strData);

					$.ajax({
						url : "/community/api/insertFollow/"+strData,
						method : "POST",
						success : function(followCnt, status) {

							//(status : sucess or err)
							alert("status: " + status);
							console.log("status: " + status);

							// 응답받은 strData
							alert("followCnt : " + followCnt);
							console.log("followCnt : " + followCnt);
							
							$("#followCnt").html(followCnt);
						}
					});

				});
		
		
		$("#deleteFollowBtn").on(
				"click",
				function() {

					var strData = $("#followUserId").val()

					alert("followUserId: " + strData);
					console.log("followUserId: " + strData);

					$.ajax({
						url : "/community/api/deleteFollow/"+strData,
						method : "DELETE",

						success : function(followCnt,status) {
							
							//(status : sucess or err)
							alert("status: " + status);
							console.log("status: " + status);

							// 응답받은 strData
							alert("followCnt : " + followCnt);
							console.log("followCnt : " + followCnt);
							
							$("#followCnt").html(followCnt);
						}
					});

				});
		
		$("#insertBlockBtn").on(
				"click",
				function() {

					var strData = $("#blockUserId").val()
					
					alert("blockUserId: " + strData);
					console.log("blockUserId: " + strData);

					$.ajax({
						url : "/community/api/insertBlock/"+strData,
						method : "POST",
						success : function(status) {
						}

					});

				});
		
		$("#deleteBlockBtn").on(
				"click",
				function() {

					var strData = $("#blockUserId").val()

					alert("blockUserId: " + strData);
					console.log("blockUserId: " + strData);

					$.ajax({
						url : "/community/api/deleteBlock/"+strData,
						method : "DELETE",
						success : function(status) {
						}
					});

				});
		
		$(".modal-content").load("/community/listCommunityBlockUserModal");
		
		
	</script>


</body>
</html>