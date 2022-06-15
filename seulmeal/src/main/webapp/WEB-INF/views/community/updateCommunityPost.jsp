<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/summernote/summernote-lite.css">
<title>게시글 수정</title>

<style type="text/css">
h1{
	position: absolute;
	left: 160px;
	color: black;
}
</style>

</head>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>
	
	<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script> -->
	<script src="/resources/javascript/summernote/summernote-lite.js"></script>
	<script src="/resources/javascript/summernote/lang/summernote-ko-KR.js"></script>

	<br/>
	<h1>게시글 수정</h1>
	<br/><br/><br/>

	<div class="container">
	<!-- enctype="multipart/form-data" -->
		<form action="/community/updatePost/${post.postNo}" method="POST" >
			<div class="row">
				<div class="col-md-12">
					제목 : <input id="title" name="title"  value = "${post.title}"/>
				</div>
				<div class="col-md-12">
					<textarea id="summernote" name="content">${post.content}</textarea>		
				</div>
			</div>
			<div style="display:flex; justify-content: space-between;">
				<div >
					<input type="file" name="uploadfile" multiple="multiple" />
					
					<!-- 업로드했던 첨부파일 불러오기 -->
					<c:forEach var="attachments" items="${post.attachments}">
                     <div data-value="${attachments.attachmentNo}">${attachments.attachmentName}
                     	<button type="button" onclick="deleteAttachment(this)" class="btn btn-primary">x</button>
                     </div>
             	    </c:forEach>
					
				</div>
				<div>
					<button onclick="updateBtn()" type="button" class="btn btn-primary">
               		수정
            		</button>
				</div>
			</div>	
		</form>
	</div>



<script>

const deleteAttachmentNo = [];
const deleteAttachmentName = [];

function deleteAttachment(e){
   const no = $(e).closest("div").data("value");
   const name = $(e).closest("div").text();	// ${attachments.attachmentName}
   deleteAttachmentNo.push(no);
   deleteAttachmentName.push(name);
   $(e).closest("div").css("display","none");
}

function updateBtn(){
   $("#updateForm").append(`<input name="deleteAttachmentNo" value="\${deleteAttachmentNo}" />`);
   $("#updateForm").append(`<input name="deleteAttachmentName" value="\${deleteAttachmentName}" />`);
   $("#updateForm").submit();
}


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


</body>

</html>


