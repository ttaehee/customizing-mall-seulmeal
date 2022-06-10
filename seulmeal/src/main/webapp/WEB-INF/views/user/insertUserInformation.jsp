<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>insertUserInformation</title>
</head>
<body>

<jsp:include page="../layer/header.jsp"></jsp:include>

 <div class="container">
 
  <form class="form-horizontal" method="post" action="/user/insertUser" target="_self" enctype="multipart/form-data">
  <h2>추가 정보 입력</h2>
	
	<div class="btn-group" data-toggle="buttons">
  <label class="btn btn-primary active">
    <input type="checkbox" name="foodCategoryName1" checked> 한식
  </label>
  <label class="btn btn-primary">
    <input type="checkbox" name="foodCategoryName2" > 중식
  </label>
  <label class="btn btn-primary">
    <input type="checkbox" name="foodCategoryName3" > 양식
  </label>
   <label class="btn btn-primary">
    <input type="checkbox"> 분식
  </label>
   <label class="btn btn-primary">
    <input type="checkbox"> 일식
  </label>
  </div>
  <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">싫어하는 재료</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="profileMessage" name="profileMessage"  placeholder="Email">
	    </div>
	  </div>
   
    <div class="form-group">
    <label for="exampleInputFile">File input</label>
    <img src="..." alt="..." class="img-rounded">
    <input type="file" id="exampleInputFile" name="profileImage">
    <p class="help-block">Example block-level help text here.</p>
  </div>
  <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">상태메세지</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="profileMessage" name="profileMessage"  placeholder="Email">
	    </div>
	  </div>
  
  
  </form>
	
  </div>
  
    <jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>