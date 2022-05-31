<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 수정</title>
</head>
<body>
<form action="/operation/updateOperation" method="POST">
	<input type="hidden" name="postNo" value="${post.postNo}" />
	제목 : <input name="title" value="${post.title}" />
	짧은내용 : <input name="shotrContent" value="${post.shortContent}" />
	썸네일 : <input name="thumnail" value="${post.thmnail}" />
	기간 : <input type="date" name="endDate" value="${post.endDate}" />
	내용 : <input name="content" value="${post.content}" />
	아이디 : <input name="userId" />
	<input type="hidden" name="postStatus" value="2" />
	<button type="submit">저장</button>
</form>
	
</body>
</html>