<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<link rel="stylesheet" href="../../../resources/css/summernote/summernote-lite.css">
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="container" style="margin-top:20px;">
		<form action="/operation/insertOperation" method="POST" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-12 text-center" style="margin-top:20px;">
					제목 : <input id="title" name="title" style="width:90%;" />
				</div>
				
				<div class="col-md-12" style="margin-top:20px;">
					<div>
						<input type="file" value="첨부파일임" name="uploadfile" multiple="multiple" />
					</div>
				</div>
				
				<div class="col-md-12" style="margin-top:20px;">
					<textarea id="summernote" name="content"></textarea>		
				</div>
			
				<input type="hidden" name="postStatus" value="2" />
			
			</div>				
			<div class="text-right" style="margin-top:20px;">
				<button type="submit" class="btn btn-primary">
					등록
				</button>
			</div>
		</form>
	</div>
	
<jsp:include page="../layer/footer.jsp"></jsp:include>

<script>
	function readURL(){
		const reader = new FileReader();
		
		reader.onload = function(event){
			$("#imageThumbnail").css({"background":"url("+event.target.result+")"});
		}
		
		reader.readAsDataURL(event.target.files[0]);
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