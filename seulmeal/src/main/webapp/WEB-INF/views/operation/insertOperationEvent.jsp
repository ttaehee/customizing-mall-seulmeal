<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
</head>
<body>
<form action="/operation/insertOperation" method="POST">
	제목 : <input name="title" />
	짧은내용 : <input name="shotrContent" />
	썸네일 : <input name="thumnail" />
	기간 : <input type="date" name="endDate" />
	내용 : <input name="content" />
	아이디 : <input name="userId" />
	<input type="hidden" name="postStatus" value="2" />
	<button type="submit">저장</button>
</form>
	
</body>
</html>