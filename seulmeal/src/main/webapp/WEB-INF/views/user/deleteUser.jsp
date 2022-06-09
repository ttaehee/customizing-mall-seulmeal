<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>insertUser</title>
</head>
<body>

<jsp:include page="../layer/header.jsp"></jsp:include>

 <div class="container">
	
		<div class="page-header">
	       <h3 class=" text">회원탈퇴</h3>
	      
	    </div>
	    
	    <br/>
		<form class="form-horizontal" method="post" action="/user/deleteUser" target="_self">
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>회원탈퇴 안내</strong></div>
			<div class="col-xs-8 col-md-4">한번 가시면 다시 돌아올수 없으니까 잘생각하세여</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>비밀번호 확인</strong></div>
			<div class="col-xs-8 col-md-4"> <input type="password" class="form-control" id="password" name="password"></div>
		</div>
		
		<hr/>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>보안문자</strong></div>
			<div class="col-xs-8 col-md-4"> <input type="text" class="form-control" id="captcha" name="captcha"></div>
		</div>
		
		<hr/>
		
		
		<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-default">탈퇴</button>
	      <button type="button" onclick="location.href='/'" class="btn btn-default">취소</button>
	    </div>
	  </div>
	</form>
	
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

    <jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>