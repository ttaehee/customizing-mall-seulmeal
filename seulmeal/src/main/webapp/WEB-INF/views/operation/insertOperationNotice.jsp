<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
<form action="/operation/insertOperation" method="POST">
	제목 : <input name="title" />
	내용 : <input name="content" />
	아이디 : <input name="userId" />
	<input type="hidden" name="postStatus" value="1" />
	<button type="submit">저장</button>
</form>
	
</body>
</html>