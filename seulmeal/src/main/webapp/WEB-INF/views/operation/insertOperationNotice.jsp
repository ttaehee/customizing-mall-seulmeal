<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
<form action="/operation/insertOperation" method="POST" enctype="multipart/form-data">
	제목 : <input name="title" />
	내용 : <input name="content" />
	아이디 : <input name="userId" />
	첨부파일 : <input type="file" name="uploadfile" multiple="multiple" />
	<input type="hidden" name="postStatus" value="1" />
	<button type="submit">저장</button>
</form>
<jsp:include page="../layer/footer.jsp"></jsp:include>	
</body>
</html>