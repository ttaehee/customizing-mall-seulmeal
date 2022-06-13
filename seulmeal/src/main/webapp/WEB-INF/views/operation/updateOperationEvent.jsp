<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/summernote/summernote-lite.css">
<!--<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/css/common/fileTag.css">
<title>이벤트 등록</title>
<style type="text/css">
	.col-md-12{
		margin-top: 20px;
	}
</style>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>

<div class="container">
		<div class="container px-4 py-5" id="custom-cards">
			<div class="row row-cols-1 row-cols-lg-10 align-items-stretch g-4 py-3">
				<div class="col">
					<div id="imageThumbnail" class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('/resources/attachments/${post.thumnail}');">
						<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
							<h1 id="titleView" class="fw-bold">${post.title}</h1>
							<h2 id="shortContentView" class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">${post.shortContent}</h2>
							<h2 class="endDateView">${post.endDate}</h2>							
							<div style="display:flex; justify-content:space-between;">
								<ul class="d-flex list-unstyled mt-auto">
									<li class="me-auto">
										<i class="bi bi-cart-plus-fill" style="font-size:2rem; color:black;"></i>
									</li>							
								</ul>
								<ul class="d-flex list-unstyled mt-auto">
									<li class="d-flex align-items-center me-3" style="font-size:1.5rem; margin-right:5px;">
										<i class="bi bi-emoji-heart-eyes"></i><br/>
										<small>&nbsp;${post.views}</small>
									</li>
									<li class="d-flex align-items-center"  style="font-size:1.5rem; margin-left:5px;">
										<i class="bi bi-calendar-date"></i>
										<small id="end_date">&nbsp;${post.endDate}</small>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
	<form action="/operation/updateOperation" method="POST" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-12 form-group">
				<label for="Email3" class="col-sm-2 control-label h4" >제목</label>
					<div class="col-md-12">
					<input type="text" class="form-control" id="title" name="title" value="${post.title}" placeholder="제목을 입력해 주세요">
				</div>
			</div>
			
			<div class="col-md-12 form-group">
				<label for="Email3" class="col-sm-2 control-label h4" >짧은 내용</label>
					<div class="col-md-12">
					<input type="text" class="form-control" id="shortContent" name="shortContent" value="${post.shortContent }" placeholder="제목을 입력해 주세요">
				</div>
			</div>
			
			<div class="col-md-12 form-group">
				<label for="Email3" class="col-sm-2 control-label h4" >기간</label>
					<div class="col-md-12">
					<input type="date" class="form-control" id="endDate" value="${post.endDate }" name="endDate">
				</div>
			</div>
			
			<div class="col-md-12" style="margin-top:20px;" >
				<div class="filebox" style="display: flex; justify-content:space-around;">
						<input class="upload-name" value="${post.thumnail }" disabled="disabled" style="width:90%;">
						<label class="btn btn-primary" for="ex_filename">썸네일</label> 
						<input type="file" accept="image/*" name="thumnailFile" id="ex_filename" class="upload-hidden" onchange="readURL(event);" />  
				</div>
			</div>
			
			<div class="col-md-12">
				<textarea id="summernote" name="content">${post.content }</textarea>
			</div>
		
			<input type="hidden" name="postStatus" value="2" />
		

			<div class="col-md-12" style="margin-top:20px;" >
				<input type="file" name="uploadfile" multiple="multiple" id="ex_uploadfile" />
			</div>
		</div>
		
		<div class="text-right" style="margin-top:20px;">
			<button type="submit" class="btn btn-primary">
				등록
			</button>
			<button type="button" onclick="cancelBtn()" class="btn btn-primary">
				취소
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
	
	// fileUploadTag
	$(document).ready(function(){
		const fileTarget = $('.filebox .upload-hidden');
		let filename;	
		fileTarget.on('change', function(){  // 값이 변경되면
			if(window.FileReader){  // modern browser
				filename = $(this)[0].files[0].name;
			} else {  // old IE
				filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}		   
			// 추출한 파일명 삽입
			$(this).siblings('.upload-name').val(filename);
		});
	});
	
	$(".filebox").on("click",()=>{
		document.querySelector("#ex_filename").click();
	})
	//////
	
	$("#title").on("keyup",function(){
		$("#titleView").text($(this).val());
	});
	
	$("#shortContent").on("keyup",function(){
		$("#shortContentView").text($(this).val());
	});
	
	$("#endDate").on("change",function(){
		$("#end_date").text($(this).val());
		$(".endDateView").text($(this).val());
	});
	
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