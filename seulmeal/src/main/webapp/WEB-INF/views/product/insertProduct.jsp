<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
<link rel="stylesheet" href="/resources/css/common/fileTag.css">
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
<div class="container">
	<form action="/product/insertProduct" method="POST" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-6 form-group">
				<label for="Email3" class="col-sm-6 control-label h4" >음식 카테고리</label>
					<div class="col-md-12">
					<select name="no" style="width: 160px">
					<c:forEach var="foodcategory" items="${list}">
						<c:set var="i" value="${i+1}" />
						<option value="${foodcategory.foodCategoryNo}">${foodcategory.name}</option>
					</c:forEach>
				</select>
				</div>
			</div>
			
			<div class="col-md-6 form-group">
				<label for="Email3" class="col-sm-5 control-label h4" >상품명</label>
					<div class="col-md-12">
					<input type="text" class="form-control" id="name" name="name" placeholder="상품명">
				</div>
			</div>
			
			<div class="col-md-12 form-group">
				<label for="Email3" class="col-sm-5 control-label h4" >짧은 내용</label>
					<div class="col-md-12">
					<input type="text" class="form-control" id="subContent" name="subContent" placeholder="짧은내용" />
				</div>
			</div>
			
			<div class="col-md-4 form-group">
				<label for="Email3" class="col-sm-4 control-label h4" >가격</label>
					<div class="col-md-12">
					<input type="text" class="form-control" id="price" name="price" />
				</div>				
			</div>
			
			<div class="col-md-4 form-group">
				<label for="Email3" class="col-sm-4 control-label h4" >칼로리</label>
					<div class="col-md-12">
					<input type="text" class="form-control" id="calorie" name="calorie" />
				</div>
			</div>
			
			<div class="col-md-4 form-group">
				<label for="Email3" class="col-sm-4 control-label h4" >재고</label>
					<div class="col-md-12">
					<input type="text" class="form-control" id="stock" name="stock" />
				</div>
			</div>
			
			<div class="col-md-12" style="margin-top:20px;" >
				<div class="filebox" style="display: flex; justify-content:space-around;">
					<input class="upload-name" value="파일선택" disabled="disabled" style="width:90%;">
					<label class="btn btn-primary" for="ex_filename">썸네일</label> 
					<input type="file" accept="image/*" name="thumbnailFile" id="ex_filename" class="upload-hidden" onchange="readURL(event);" />  
				</div>
			</div>
			
			<div>
				재료 검색 : <input class="search" />
				<div class="partSearch">검색</div><div class="parts"></div>
			</div>
			
			<div class="col-md-12">
				<textarea id="summernote" name="content"></textarea>
			</div>
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
			
		
	<jsp:include page="../layer/footer.jsp"></jsp:include>
	</form>
</div>

<script type="text/javascript">
$(".btn-primary:contains('취소')").click(function(){
	window.location.href = '/product/admin/listProduct';
});


	$(()=>{
		$(".partSearch").on("click",()=>{
			$.ajax({
				url:"/product/api/getPartsName/"+$(".search").val(),
				method:"GET",
		        headers : {
		            "Accept" : "application/json",
		            "Content-Type" : "application/json"
		        },
		        dataType : "json",
		        success : function(data){	        	
		        	console.log(data);
		        	const parts = "<div> <input type='hidden' name='partsNo' value='"+data.partsNo+"' /> <input type='hidden' name='partsName' value='"+data.name+"' />"
		                +"<div class='part' data-parts='"+data.partsNo+"'>"+ data.name +"</div>"
		                +"</div>"
		        	$(".parts").append(parts);
		        }
			})
		})
	})

	//fileUploadTag
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
	
	$(document).ready(function () {
		
		$('#summernote').summernote({
			height: 700,                // 에디터 높이
			minHeight: 700,            // 최소 높이
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
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
		            // 파일 업로드(다중업로드를 위해 반복문 사용)
		            for (var i = files.length - 1; i >= 0; i--) {
		            uploadSummernoteImageFile(files[i],
		            this);
		            		}
		            	}
			}
		});
		
		$('#summernote').summernote(setting);
		
		function uploadSummernoteImageFile(file, el){	    	
			const data = new FormData;
			data.append("file",file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/uploadSummernoteImgFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);					
					jsonArray.push(data.url);
					jsonFn(jsonArray);
				},
				error : function(e){
					console.log(e);
				}
			})
		}
		
		
		function jsonFn(jsonArray){
			console.log(jsonArray)
		}
				
    });
</script>
</body>
</html>