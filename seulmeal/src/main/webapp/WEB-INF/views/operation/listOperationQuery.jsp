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
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js" integrity="sha256-xH4q8N0pEzrZMaRmd7gQVcTZiFei+HfRTBPJ1OGXC0k=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(function(){
		$(".psBtn").on("click",function(){
			const pNo = $(this).data('value');
			$(".pNo").val(pNo);
			$("#ps").dialog({
				title : "비공개문의 비밀번호 입력창",
				width : 500,
				height : 300,
				modal : false
			})
		})
		
		$(".psSearch").click(function(){
			$.ajax({
				url:"/operation/api/confirmQueryPassword",
				method:"POST",
				data:JSON.stringify({
		            postNo : $(".pNo").val(),
		            password : $(".password").val()
		        }),
				headers : {
		            "Accept" : "application/json",
		            "Content-Type" : "application/json"
		        },
		        dataType : "json",
		        success : function(data){
		        	if(data.result === 'true') {
		        		window.location.href = '/operation/getOperation/'+$(".pNo").val();
		        	} else {
		        		alert("비밀번호 틀림");
		        	}
		        }
			})
		})
	})
</script>
<title>문의 목록</title>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="container">
		<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
		    문의관련
		  </button>
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
		    <li><a href="/operation/getListOperation/3/0/0">답변중인 문의</a></li>
		    <li><a href="/operation/getListOperation/3/0/1">답변완료 문의</a></li>
		    <li><a href="/operation/insertOperation/3">문의 등록</a></li>
		  </ul>
		</div>
		<div class="row">
			<div class="col-md-1">번호</div>
			<div class="col-md-3">제목</div>
			<div class="col-md-3">등록날짜</div>
			<div class="col-md-2">답변여부</div>
		</div>
		<c:forEach var="post" items="${list}">
			<c:set var="i" value="${i+1}" />
			<div class="row">
				<div class="col-md-1">${i}</div>
				<div class="col-md-3">
					<c:if test="${post.publicStatus ==0}">
						<a href="/operation/getOperation/${post.postNo}">${post.title}</a>
					</c:if>
					<c:if test="${post.publicStatus ==1}">
						<div class="psBtn" data-value="${post.postNo}">${post.title }<i class="bi bi-lock-fill"></i></div>						
					</c:if>					
				</div>
				<div class="col-md-3">${post.regDate}</div>
				<div class="col-md-2">
					<c:if test="${post.answerStatus == 0}">X</c:if>
					<c:if test="${post.answerStatus == 1}">O</c:if>
				</div>
				<hr/>
			</div>
		</c:forEach>
	</div>
	<div class="container">
	<div class="row">
		<div class="col-md-3"></div>
			<div class="col-md-6">
				<nav aria-label="...">
				  <ul class="pagination">
			  		<li class="page-item disabled">
				      <span class="page-link" data-value="1">Previous</span>
				    </li>
				  	<c:forEach var="i" begin="${page.beginUnitPage}" end="${page.endUnitPage}">
				  		<li class="page-item"><a class="page-link" href="/operation/getListOperation/3/${i}">${i}</a></li>
				  	</c:forEach>
				  	<li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>	
	</div>
	
	<!-- modal -->
	<div id="ps" style="display:none;">
		<input type="hidden" class="pNo" />
		<div>비밀번호 : <input class="password" name="password" /></div>
		<div class="psSearch">확인</div>
	</div>
	
<jsp:include page="../layer/footer.jsp"></jsp:include>

</body>
</html>