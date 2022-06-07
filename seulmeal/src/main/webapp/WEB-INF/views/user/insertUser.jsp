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
	<h2>회원가입</h2>
	<form class="form-horizontal" method="post" action="/user/insertUser" target="_self">
	  <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="userId" name="userId"  placeholder="Email">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="Password3" class="col-sm-2 control-label">Password</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="Password3" class="col-sm-2 control-label">비밀번호 확인</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="confirmPassword"  placeholder="Password">
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">이름</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="userName" name="userName" placeholder="Email">
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">닉네임</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="Email">
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">이메일</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="email" name="email" placeholder="Email">
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">휴대폰</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="phone" name="phone" placeholder="Email">
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">주소</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="address" name="address" placeholder="Email">
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">생년월일</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="birth" name="birth" placeholder="Email">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-default">가입하기</button>
	    </div>
	  </div>
	</form>
</div>
    <jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>