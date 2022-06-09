<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세정보</title>
</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="container">
		<div class="row" style="margin-top:20px;">			
			<div class="col-md-12">
				<div class="row" style="min-height:40px; border-bottom: 2px double #BAD7DF;">
					<div class="col-md-3" style="background-color:#e9e9e9; padding-top:10px;">제목</div>
					<div class="col-md-9" style="padding-top:10px;">${post.title}</div>
				</div>
				<div class="row" style="min-height:40px; border-bottom: 2px double #BAD7DF;">
					<div class="col-md-3" style="background-color:#e9e9e9; padding-top:10px;">작성자</div>
					<div class="col-md-9" style="padding-top:10px;">${post.user.userId}</div>
				</div>
				<div class="row" style="min-height:40px; border-bottom: 2px double #BAD7DF;">
					<div class="col-md-3" style="background-color:#e9e9e9; padding-top:10px;">작성일</div>
					<div class="col-md-3" style="padding-top:10px;">${post.regDate}</div>
					<div class="col-md-3" style="background-color:#e9e9e9; padding-top:10px;">조회수</div>
					<div class="col-md-3" style="padding-top:10px;">${post.views}</div>
				</div>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row" style="min-height:700px;">
				<c:forEach var="attachments" items="${post.attachments}">
						<a href="/download/${attachments.attachmentName}">${attachments.attachmentName }</a>			
				</c:forEach>
					${post.content}
				</div>
			</div>
			<div class="col-md-12">
				<div class="row" style="border-bottom: 2px double #BAD7DF; border-top: 2px double #BAD7DF;">
					<div class="col-md-10"></div>
					<span style="margin-bottom:10px; margin-top:10px;">
						<button style="margin-right:10px;">수정</button>
						<button>목록</button>
					</span>						
				</div>
				<div class="row" style="border-bottom: 2px double #BAD7DF;">
					<div class="col-md-12" style="background-color:#e9e9e9;">다음글</div>
					<div class="col-md-12" style="background-color:#e9e9e9;">이전글</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>