<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
<form action="/operation/updateOperation" method="POST">
	<input type="hidden" name="postNo" value="${post.postNo}" />
	제목 : <input name="title" value="${post.title }" />
	내용 : <input name="content" value="${post.content}" />
	아이디 : <input name="userId" />
	<input type="hidden" name="postStatus" value="1" />
	<button type="submit">저장</button>
</form>
	
</body>
</html>