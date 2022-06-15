<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


	<div id="button_area"> 
        <div id="naverIdLogin"></div>
      </div>
	</div>
	<!-- /container -->

    

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
	
	const naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "9v2VufeHsXfFnp8KaD49",
				callbackUrl: "localhost:7100/user/login",
				loginButton: {color: "green", type: 2, height: 40}
			}
		);
	
	naverLogin.init();
</script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</body>
</html>