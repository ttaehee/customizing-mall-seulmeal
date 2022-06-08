<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 등록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
<form action="/operation/insertOperation" method="POST" enctype="multipart/form-data">
	제목 : <input name="title" /><br/>
	공개 : <input type="checkbox" name ="publicStatus" value="0" />
	비공개 : <input type="checkbox" name ="publicStatus" value="1" /><br/>
	비밀번호 : <input type="password" /><br/>
	내용 : <input name="content" /><br/>
	아이디 : <input name="userId" /><br/>
	첨부파일 : <input type="file" name="uploadfile" multiple="multiple" />
	<input type="hidden" name="postStatus" value="3" />
	<button type="submit">저장</button>
</form>
<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>