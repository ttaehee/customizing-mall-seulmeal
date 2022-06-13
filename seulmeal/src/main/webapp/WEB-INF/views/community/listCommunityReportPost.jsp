<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>

<br/><br/>
	<!-- table : 신고 게시글 목록 -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">

				<tr>
					<td class="ct_list_b">신고날짜</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" >신고한 유저</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">신고당한 게시글No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">신고사유</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">답변상태</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">삭제하기</td>
					<td class="ct_line02"></td>
					
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				
				<!-- c:set var="no" value="0"/-->
				<c:forEach var="report" items="${reportList}">
					<tr class="ct_list_pop">
						<td align="left">${report.regDate}</td>
						<td></td>
						<td align="left">${report.reporterId}</td>
						<td></td>
						<td align="left">${report.postNo}</td>
						<td></td>
						<td align="left">${report.reason}</td>
						<td></td>
						<td align="left">
						<c:choose>
							<c:when test="${report.status eq 0}">처리중</c:when>
							<c:when test="${report.status eq 1}">삭제완료</c:when>
						</c:choose>
						</td>
						<td></td>												
					</tr>
				</c:forEach>
				
				
			</table>

</body>
</html>