<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시글 등록 </title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script type="text/javascript">
	function goWrite(){
		
	}

</script>

</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>


	<div style="width: 60%; margin: auto;">
		<form method="POST" action="/insertPost">
			<input type="text" name="title" style="width: 40%;" placeholder="제목" /> <br>
			<br>
			<textarea id="summernote" name="content"></textarea>
			<input id="subBtn" type="button" value="등록하기" style="float: right;"
			onclick="goWrite(this.form)" />
		</form>
	</div>
	
	
	<script>
		$('#summernote').summernote({
			placeholder : 'Hello Bootstrap TEST',
			height : 400,
			dialogsInBody : true
		});
	</script>
	
</body>

</html>

