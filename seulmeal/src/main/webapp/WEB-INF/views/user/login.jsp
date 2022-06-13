<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>login</title>
</head>
<body>

	<jsp:include page="../layer/header.jsp"></jsp:include>
	<br />
	<br />
	<div class="container container-table" >


      <form class="form-signin"  method="post" action="/user/login" target="_self">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">ID</label>
        <input type="text" id="userId" name ="userId" class="form-control" placeholder="ID" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="password" name="password"  class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="1" id="checkLogin" name="checkLogin"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

	</div>
	<!-- /container -->

	<jsp:include page="../layer/footer.jsp"></jsp:include>
    

<jsp:include page="../layer/footer.jsp"></jsp:include>
<script type="text/javascript">
	$("#checkLogin").on("change",()=>{
		const result = document.querySelector("#checkLogin");
		if(result.checked){
			result.value = "1";
		} else {
			result.value = "0";
		}
	})
</script>

</body>
</html>