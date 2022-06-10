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


		<!-- table : 검색 (searchCondition, searchKeyword) -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>

				<!-- condition, keyword -->
					<td align="right">
					<select name="searchCondition" class="ct_input_g" style="width: 80px">
							<option value="0" ${search.searchCondition eq '0'? 'selected':''}>게시글 제목 + 내용</option>
							<option value="1" ${search.searchCondition eq '1'? 'selected':''}>유저 닉네임</option>
					</select> 
					<input type="text" name="searchKeyword" value="${search.searchKeyword}" 
					class="ct_input_g" style="width: 200px; height: 19px" />
					</td>

				<!-- 검색버튼 -->
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncGetDomainList(1);">검색</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


		<!-- table : 게시글 -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">

				<tr>
					<td class="ct_list_b" width="100">게시글_프로필이미지</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">게시글_유저닉네임</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">게시글 제목</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">게시글 내용</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">게시글 사진</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
			</table>
			
		
		<!-- table : 유저 프로필 -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">

				<tr>
					<td class="ct_list_b" width="100">프로필 이미지</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">닉네임</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상태메시지</td>
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