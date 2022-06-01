<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>문의 등록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
<form action="/operation/updateOperation" method="POST">
	제목 : <input name="title" value="${post.title}" /><br/>
	공개 : <input type="checkbox" name ="publicStatus" value="0" />
	비공개 : <input type="checkbox" name ="publicStatus" value="1" /><br/>
	비밀번호 : <input type="password" /><br/>
	내용 : <input name="content" value="${post.content}" /><br/>
	아이디 : <input name="userId" /><br/>
	<button type="submit">저장</button>
</form>
<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>