<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community Main</title>
</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>

<form action="/community/communityMain" method="get">

		<!-- table : 검색 (searchCondition, searchKeyword) -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>

				<!-- condition, keyword -->
					<td align="right">
					<select name="searchCondition" class="ct_input_g" style="width: 80px">
							<option value="1" ${search.searchCondition eq '1'? 'selected':''}>조회순</option>
							<option value="2" ${search.searchCondition eq '2'? 'selected':''}>좋아요순</option>
							<option value="3" ${search.searchCondition eq '3'? 'selected':''}>최신순</option>
							
							<!-- option value="1" ${search.searchCondition eq '1'? 'selected':''}>유저 닉네임</option-->
					</select> 
					
			
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
</form>

		<!-- table : 게시글 목록 -->
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
						<td align="left">${post.user.profileImage}</td>
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
					<td class="ct_list_b">선호음식 카테고리2</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">선호음식 카테고리3</td>
					<!-- 팔로우, 팔로워 수? -->
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				
					<tr>
						<td align="left">${sessionScope.user.profileImage}</td>
						<td></td>
						<td align="left">${sessionScope.user.nickname}</td>
						<td></td>
						<td align="left">${user.profileMessage}</td>
						<td></td>
						<td align="left">${user.grade}</td>
						<td></td>
					</tr>
			</table>	
			
			
			
		
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
			



</body>
</html>