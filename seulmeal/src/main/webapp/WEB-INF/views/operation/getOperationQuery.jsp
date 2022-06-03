<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
	
	<div class="container">
        <div class="row">
            <div class="col">            	
            	<h1>${post.title}<c:if test="${post.publicStatus==1}"><i class="bi bi-lock-fill"></i></c:if></h1>
            </div>            
        </div>
        <div class="row">
            <div class="col-2">${post.postNo}</div>
            <div class="col-2">${post.regDate}</div>
        </div>
        <div class="row" style="border-bottom: 2px solid;">
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
        	<c:forEach var="attachments" items="${post.attachments}">
        		<div class="col-1">
					<a href="/download/${attachments.attachmentName}">${attachments.attachmentName }</a>
				</div>			
			</c:forEach>			
        </div>
        <div class="row" style="border-bottom: 2px solid; height: 700px;">
            <div class="col">${post.content}</div>            
        </div>
        <div class="row justify-content-end">
            <div class="col-2">답변 등록</div>
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
						<a href="/download/${attachments.attachmentName}">${attachments.attachmentName }</a>
					</div>			
				</c:forEach>		
	        </div>
	        <div class="row">
	            <div class="col" style="background-color: crimson; height: 200px;">${comment.content}</div>
	        </div>
	        <div class="row justify-content-end">
	            <div class="col-2">답변 수정</div>
	        </div>
		</c:forEach>        
    </div>
    	
	<button onClick="insertAnswer()">답변등록</button>
	<form method="POST" enctype="multipart/form-data" id="answerForm">
		<div class="answerForm" style="display:none;">
			<input id="postNo" type="hidden" name="postNo" value="${post.postNo}" />
			답변등록자 ID : <input id="userId" name="userId" />
			답변 내용 : <input id="content" name="content" />
			첨부 파일 : <input type="file" name="uploadfile" multiple="multiple" />
			<button onClick="ajaxAnswer()">저장</button>
		</div>
	</form>
	
	<div class="answer"></div>
	<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>