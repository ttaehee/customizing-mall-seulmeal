<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/summernote/summernote-lite.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<title>문의사항 상세정보</title>
</head>
<script type="text/javascript">
	function insertAnswer(){
		$(".answerForm").css('display','block');
		//$(".answerForm").attr('class','answerForm not')
	}
	
	function ajaxAnswer(){
		const form = $("#answerForm")[0];
		
		const formData = new FormData(form);
		
		$.ajax({
			url : "/operation/api/insertAnswer",
			method : "POST",
			enctype: 'multipart/form-data',
			data : formData,
			processData: false,
			contentType: false,
			cache: false,
	        success : function(data){
	        	console.log(data)
	        	const answer = "<div><div>"+data.userId+"</div><div>"+data.content+"</div></div>"
	        	$(".answer").append(data.content);
	        }
		})
	}
</script>
<body>

	<jsp:include page="../layer/header.jsp"></jsp:include>
<script src="/resources/javascript/summernote/summernote-lite.js"></script>
<script src="/resources/javascript/summernote/lang/summernote-ko-KR.js"></script>	
	<div class="container">
        <div class="row">
            <div class="col" style="border-bottom: 2px solid; margin-top:20px; ">            	
            	<h1>${post.title}<c:if test="${post.publicStatus==1}"><i class="bi bi-lock-fill"></i></c:if></h1>
            </div>            
        </div>
        <div class="row" style="text-align: center;">
            <div class="col-2">${post.postNo}</div>
            <div class="col-2">${post.regDate}</div>
        </div>
        <div class="row" style="border-bottom: 2px solid; text-align: center;">
            <div class="col-2">${post.user.userId}</div>
            <div class="col-3" style="display: flex;">
            <div style="margin-right: 10px;">
	            <c:if test="${post.answerStatus ==0}">
	            	답변 대기중
	            </c:if>
	            <c:if test="${post.answerStatus ==1}">
	            	답변 완료
	            </c:if>
            </div>
            <div>삭제</div>
        </div>
        </div>
        <div class="row justify-content-end">
        	<div class="col-1">
	        	<ul class="navbar-nav">
			      	<li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            첨부파일
			          </a>
			          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			          	<c:forEach var="attachments" items="${post.attachments}">		          	
			            <li><a class="dropdown-item" href="/download/${attachments.attachmentName}">${attachments.attachmentName }</a></li>
			            </c:forEach>
			          </ul>
			        </li>
		        </ul>
        	</div>		
        </div>
        <div class="row" style="border-bottom: 2px solid; min-height: 400px;">
            <div class="col">${post.content}</div>            
        </div>
        <div class="row justify-content-end">
            <div class="col-2"><button id="answerInsert">답변등록</button></div>
        </div>
        <c:forEach var="comment" items="${post.comments}">
			<c:set var="i" value="${i+1}" />
			<div class="row" style="margin-bottom: 10px;">
	            <div class="col-2">${comment.commentNo}</div>
	            <div class="col-2">${comment.regDate}</div>
	            <div class="col-2">${comment.user.userId}</div>
	        </div>
	        <div class="row justify-content-end">        	
	        	<c:forEach var="attachments" items="${comment.attachments}">
	        		<div class="col-1">
						<a href="/download/${attachments.attachmentName}">${attachments.attachmentName}</a>
					</div>			
				</c:forEach>		
	        </div>
	        <div class="row">
	            <div class="col" style="background-color: crimson; min-height: 100px;">${comment.content}</div>
	        </div>
	        <div class="row justify-content-end">
	            <div class="col-2">답변 수정</div>
	        </div>
		</c:forEach>        
    </div>
    	
	<div class="answer" style="display:none;">
		<form method="POST" enctype="multipart/form-data" id="answerForm">
			<div class="row answerForm">
				<input id="postNo" type="hidden" name="postNo" value="${post.postNo}" />
				<div class="col-md-12">
					답변등록자 ID : <input id="userId" name="userId" />
				</div>
				<div class="col-md-12">
					<textarea id="summernote" name="content"></textarea>		
				</div>
				첨부 파일 : <input type="file" name="uploadfile" multiple="multiple" />
				<button onClick="ajaxAnswer()">저장</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../layer/footer.jsp"></jsp:include>
	
<script type="text/javascript">
	$("#answerInsert").on("click",function(){
		$(".answer").dialog({
			title : "문의 답변 입력",
			width : 500,
			height : 700,
			modal : true
		})
	})
	
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