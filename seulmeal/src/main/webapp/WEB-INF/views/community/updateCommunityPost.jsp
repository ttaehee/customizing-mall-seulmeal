<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/summernote/summernote-lite.css">
<title>게시글 등록</title>
</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>
	
	<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script> -->
	<script src="/resources/javascript/summernote/summernote-lite.js"></script>
	<script src="/resources/javascript/summernote/lang/summernote-ko-KR.js"></script>

	<div class="container">
	<form action="/community/insertPost" method="POST" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-12">
				제목 : <input id="title" name="title" />
			</div>
			<div class="col-md-12">
				아이디 : <input id="userId" name="userId" />
			</div>
			<div class="col-md-12">
				<textarea id="summernote" name="content"></textarea>		
			</div>
		</div>
		<div style="display:flex; justify-content: space-between;">
			<div >
				<input type="file" value="첨부파일임" name="uploadfile" multiple="multiple" />
			</div>
			<div>
				<button type="submit" class="btn btn-primary">
					등록
				</button>
			</div>
		</div>	
	</form>
	</div>

	<form action="/community/insertPost" method="POST" enctype="multipart/form-data">
		아이디 : <input name="userId" /><br /> 
		첨부파일 : <input type="file" name="uploadfile" multiple="multiple" />
		<button type="submit">등록</button>
	</form>


<script>

$(document).ready(function () {
	$('#summernote').summernote({
		height: 500,                // 에디터 높이
		minHeight: 500,            // 최소 높이
		maxHeight: null,            // 최대 높이
		focus: true,                // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",				// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		toolbar: [				    
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});		
});
</script>




	<!-- div style="width: 60%; margin: auto;">
		<form method="POST" action="/insertPost">
			<input type="text" name="title" style="width: 40%;" placeholder="제목" /> <br>
			<br>
			<textarea id="summernote" name="content"></textarea>
			<input id="subBtn" type="button" value="등록하기" style="float: right;"
			onclick="goWrite(this.form)" />
		</form>
	</div-->


	<!-- script>
		$('#summernote').summernote({
			placeholder : 'Hello Bootstrap TEST',
			height : 400,
			dialogsInBody : true
		});
	</script-->

</body>

</html>

