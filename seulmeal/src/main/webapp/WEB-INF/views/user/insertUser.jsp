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
	    <div class="col-sm-10" style="display: flex;">
	      <input style="width: 90%;" type="text" class="form-control" id="email" name="email" placeholder="Email">
	      <button id="emailBtn" onclick="emailCheck()" type="button" class="btn btn-default" disabled="disabled">인증하기</button>
	    </div>
	   
	    <div class="col-sm-10" id="emailCheckForm" style="display: none;">
	      <input style="width: 90%;" type="text" class="form-control" id="emailCode" name="email" placeholder="인증번호를 입력하세요">
	      <button type="button" onclick="confirmEmail()" class="btn btn-default">인증확인</button>
	    </div>
	    
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">휴대폰</label>	    
	    <div class="col-sm-10" style="display: flex;">
	      <input style="width: 90%;" type="text" class="form-control" id="phone" name="phone" placeholder="01000000000" maxlength=13>
	      <button id="phoneBtn" type="button" onclick="phoneCheck()" class="btn btn-default" disabled="disabled">인증하기</button>
	    </div>
	    
	    <div class="col-sm-10" id="phoneCheckForm" style="display: none;">
	      <input style="width: 90%;" type="text" class="form-control" id="phoneCode" name="phone" placeholder="인증번호를 입력하세요">
	      <button type="button" onclick="confirmPhone()" class="btn btn-default">인증확인</button>
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
	      <input type="date" class="form-control" id="birth" name="birth" placeholder="Email">
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
<script type="text/javascript">
	$("#phone").on("keyup",()=>{
		const phonNum = $("#phone").val();
		const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		if (regPhone.test(phonNum) === true) {
			$("#phoneBtn").removeAttr("disabled");
		} else {
			$("#phoneBtn").attr("disabled","disabled");
		}
	})
	
	$("#email").on("keyup",()=>{
		const email = $("#email").val()
		const regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if(regEmail.test(email) === true){
			$("#emailBtn").removeAttr("disabled");
		} else {
			$("#emailBtn").attr("disabled","disabled");
		}
	})
	
	// 핸드폰 중복체크
	function phoneCheck(){
		const phonNum = $("#phone").val();
		
		$.ajax({
			url: "/user/api/confirmUserPhone/"+phonNum,
			method: "GET",
			headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	        },
	        dataType : "json",
	        success : function(data){
	        	if(data.result === "success"){
	        		alert("인증번호를 입력하세요");
	        		$("#phoneCheckForm").css("display","flex");
	        		return;
	        	}
	        	if(data.result === "fail"){
	        		alert("번호가 중복되어 있습니다");
	        		return;
	        	}
	        }
		})		
	}
	
	// 이메일 중복체크
	function emailCheck(){
		const emailNum = $("#email").val();
		
		$.ajax({
			url: "/user/api/confirmUserEmail/"+emailNum,
			method: "GET",
			headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	        },
	        dataType : "json",
	        success : function(data){
	        	if(data.result === "success"){
	        		alert("인증번호를 입력하세요");
	        		$("#emailCheckForm").css("display","flex");
	        		return;
	        	}
	        	if(data.result === "fail"){
	        		alert("번호가 중복되어 있습니다");
	        		return;
	        	}
	        }
		})		
	}
	
	// 핸드폰 인증
	function confirmPhone(){
		const confrimNum = $("#phoneCode").val();
		const phoneNum = $("#phone").val();
		console.log(phoneNum)
		let url = "/user/api/confirmCode/"+phoneNum+"/"+confrimNum;
		$.ajax({
			url: url,
			method: "GET",
			headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	        },
	        dataType : "json",
	        success : function(data){
	        	alert(data.result);	        	
	        	$("#phone").attr("disabled","disabled");
	        	$("#phoneCheckForm").css("display","none");
	        }
		})
	}
	
	// 이메일인증 확인
	function confirmEmail(){
		const confrimNum = $("#emailCode").val();
		const emailNum = $("#email").val();
		
		let url = "/user/api/confirmCode/"+emailNum+"/"+confrimNum;
		$.ajax({
			url: url,
			method: "GET",
			headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	        },
	        dataType : "json",
	        success : function(data){
	        	alert(data.result);	        	
	        	$("#email").attr("disabled","disabled");
	        	$("#emailCheckForm").css("display","none");
	        }
		})
	}
</script>
</body>
</html>