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

<title>insertUserInformation</title>
</head>
<script type="text/javascript">
	
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
	
	
	
</script>
<body>

<jsp:include page="../layer/header.jsp"></jsp:include>
 <br/>
 <br/>

	<div class="container">

		<form class="form-horizontal" method="post" action="/user/inserUserInformation"  enctype="multipart/form-data">
			<h2>추가 정보 입력</h2>

			<div class="btn-group" data-toggle="buttons">
				<c:forEach var="foodcategory" items="${foodcategoryList}">
					<label class="btn btn-primary active">
						<input type="checkbox" name="foodcategory" value="${foodcategory.name }"> ${foodcategory.name }
					</label>
				</c:forEach>
			</div>
			<div>
				<label for="" class="col-sm-2 control-label">싫어하는 재료</label>
				<div>
					재료 검색 : <input class="search" />
					<div class="partSearch">검색</div>
					<div class="parts"></div>
				</div>
			</div>


			<div class="form-group">
				<label for="exampleInputFile"></label>
				<input type="file" id="exampleInputFile" name="profileImage">
				<p class="help-block">프로필 이미지를 선택해주세요</p>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2 control-label">상태메세지</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="profileMessage" name="profileMessage" placeholder="내용을 입력해 주세요">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">저장</button>
				</div>
			</div>

		</form>
	</div>

	<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>