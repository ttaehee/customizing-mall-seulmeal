<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 목록</title>
<style type="text/css">
	.psBtn{
		cursor: pointer;
	}
	.psBtn:hover{
		color: #4b6cb7 !important;
	}
</style>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="container">
		<div class="row" style="border-top: thick double #4b6cb7; border-bottom: thick double #4b6cb7; margin-bottom: 1rem; margin-top: 2rem;">
			<div class="col-6">
				<h1 class="pt-5 mb-4 fw-bold">문의 목록</h1><h5 class="align-bottom">문의 목록입니다.</h5>				
			</div>
			<div class="dropdown pt-5 mb-4 col-6">		  
			<div class="float-right" style="display:flex;">
			
				<div class="dropdown show">
					<button class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						문의 관련
					</button>					
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="/operation/getListOperation/3/0/0">답변중인 문의</a>
						<a class="dropdown-item" href="/operation/getListOperation/3/0/1">답변완료 문의</a>
					</div>
				</div>
				
				
				<div class="form-outline">
					<input type="search" id="form1" class="form-control" placeholder="내용 혹은 제목을 입력" />
				</div>		  
					<button type="button" class="btn btn-primary">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</div>
		</div>
		
		
		<table class="table table-hover text-center">
			<thead style="background-color: #4b6cb7; color: #fff;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${list}">
				<tr>
					<th>${post.postNo}</th>
					<th>
						<c:if test="${post.publicStatus ==0}">
							<a href="/operation/getOperation/3/${post.postNo}" class="link-dark text-decoration-none">${post.title}</a>
						</c:if>
						<c:if test="${post.publicStatus ==1}">
							<div class="psBtn" data-value="${post.postNo}">${post.title }<i class="bi bi-lock-fill"></i></div>						
						</c:if>
					</th>
					<th style="font-weight: bolder;">${post.user.userId}</th>
					<th>${post.regDate}</th>
					<th>${post.views}</th>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<c:if test="${user !=null }">
			<button class="btn btn-primary float-right" onclick="insertQuery()">문의 작성</button>
		</c:if>		
		
		<div class="row">
			<div class="col-md-5"></div>
			<div class="col-md-4">
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
<script type="text/javascript">
	function insertQuery(){
		window.location.href = "/operation/insertOperation/3";
	}
	
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
		            password : $(".password").val(),
		            postStatus: 3
		        }),
				headers : {
		            "Accept" : "application/json",
		            "Content-Type" : "application/json"
		        },
		        dataType : "json",
		        success : function(data){
		        	console.log(data)
		        	if(data.result === 'true') {
		        		window.location.href = '/operation/getOperation/3/'+$(".pNo").val();
		        	} else {
		        		alert("비밀번호 틀림");
		        	}
		        }
			})
		})
	})
</script>
</body>
</html>