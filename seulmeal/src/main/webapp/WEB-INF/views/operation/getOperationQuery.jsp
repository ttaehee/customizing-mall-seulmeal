<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>문의사항 상세정보</title>
</head>
<script type="text/javascript">
	function insertAnswer(){
		$(".answerForm").css('display','block');
		//$(".answerForm").attr('class','answerForm not')
	}
	
	function ajaxAnswer(){
		console.log($("#userId").val())
		$.ajax({
			url : "/operation/api/insertAnswer",
			method : "POST",
			data:JSON.stringify({
	            userId : $("#userId").val(),
	            postNo : $("#postNo").val(),
	            content: $("#content").val()
	        }),
			headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	        },
	        dataType : "json",
	        success : function(data){
	        	const answer = "<div><div>"+data.userId+"</div><div>"+data.content+"</div></div>"
	        	$(".answer").append(data.content);
	        }
		})
	}
</script>
<body>
	<jsp:include page="../layer/header.jsp"></jsp:include>
	<input id="postNo" type="hidden" name="postNo" value="${post.postNo}" />
	<div>${post}</div>
	<button onClick="insertAnswer()">답변등록</button>
	<div class="answerForm" style="display:none;">
		답변등록자 ID : <input id="userId" name="userId" />
		답변 내용 : <input id="content" name="content" />
		<button onClick="ajaxAnswer()">저장</button>
	</div>
	<div class="answer"></div>
	<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>