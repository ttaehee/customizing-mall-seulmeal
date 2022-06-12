<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>insertUser</title>
<style type="text/css">
	.inputBar{
		display: flex;
		justify-content: space-between;
	}
</style>
</head>
<body>

<jsp:include page="../layer/header.jsp"></jsp:include>

 <div class="container" style="margin-top:20px;">
	<h2>회원가입</h2>
	<form class="form-horizontal" method="post" action="/user/insertUser" target="_self">
	  <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">아이디</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="userId" name="userId"  placeholder="아이디를 입력하세요">
	      <div id="checkUserId"></div>
	      <div style="font-size: 15px;">아이디는 8글자 이상 공백,특수문자,한글이 불가능 합니다.</div>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="Password3" class="col-sm-2 control-label">Password</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
	      <div id="passResult" style="color:crimson;"></div>
	      <div style="font-size: 15px;">비밀번호는 8글자 이상 특수문자1개, 알파벳 대문자 1개를 포함하고 공백과 아이디가 포함되지 않아야 합니다.</div>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="Password3" class="col-sm-2 control-label">비밀번호 확인</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="confirmPassword"  placeholder="Password">
	      <div id="passCheck" style="color:crimson;"></div>
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
	      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="nickName">
	      <div id="checknickName" style="color:crimson;"></div>
	      <div style="font-size: 15px;">닉네임은 5글자 이상 입력해 주세요.</div>
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">이메일</label>
	    <div class="col-sm-10">	    	
		    <div class="inputBar">
				<input style="width: 100%;" type="text" class="form-control" id="email" name="email" placeholder="Email">
				<input id="emailBtn" onclick="emailCheck()" value="인증하기" type="button" class="btn btn-default" disabled="disabled">
		    </div>
	    </div>
	   
	    <div class="col-sm-10" id="emailCheckForm" style="display: none;">
			<div class="inputBar">
				<input style="width: 100%;" type="text" class="form-control" id="emailCode" name="email" placeholder="인증번호를 입력하세요">
				<input type="button" onclick="confirmEmail()" class="btn btn-default" value="인증확인">
			</div>
	    </div>
	    
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">휴대폰</label>	    
	    <div class="col-sm-10">
	   		<div class="inputBar">
				<input style="width: 100%;" type="text" class="form-control" id="phone" name="phone" placeholder="01000000000" maxlength=13>
				<input id="phoneBtn" type="button" onclick="phoneCheck()" class="btn btn-default" value="인증하기" disabled="disabled">
	    	</div>
	    </div>
	    
	    <div class="col-sm-10" id="phoneCheckForm" style="display: none;">
	    	<div class="inputBar">
				<input style="width: 100%;" type="text" class="form-control" id="phoneCode" name="phone" placeholder="인증번호를 입력하세요">
				<input type="button" onclick="confirmPhone()" class="btn btn-default" value="인증하기">
	    	</div>
	    </div>
	    
	  </div>
	   <div class="form-group">
	    <label for="Email3" class="col-sm-2 control-label">주소</label>
	    <div class="col-sm-10">
	    	<!-- 주소 -->
	    	<div style="display: flex; justify-content: space-between;">
	    	<input type="text" class="form-control" id="sample3_postcode" placeholder="우편번호" style="width: 100%;" readonly>
			<input class="btn btn-default" type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기">
			</div>
			<input type="text" class="form-control" id="sample3_address" placeholder="주소" readonly><br>
			<input type="text" class="form-control" id="address" name="address" placeholder="상세주소">
			
			<div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>
			
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
	      <button id="insertUserIdBtn" disabled="disabled" type="submit" class="btn btn-default">가입하기</button>
	    </div>
	  </div>
	</form>
</div>
    <jsp:include page="../layer/footer.jsp"></jsp:include>
<!-- 주소록 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/javascript/user/address.js"></script>
<script type="text/javascript">
	//아이디 중복체크
	$("#userId").on("keyup",()=>{
		const hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		const reg = /(?=.*?[\'\";`:><,.+=/{}#?!@$%^&*-])/;
		
		if($("#userId").val().search(/\s/) !== -1){
			$("#checkUserId").css("color","crimson").text("아이디는 공백 없이 입력해주세요.");
			return;
		}
		
		if(hangulcheck.test($("#userId").val())){
			$("#checkUserId").css("color","crimson").text("아이디는 한글을 사용할수 없습니다.");
			return;
		}
		
		if(reg.test($("#userId").val())){
			$("#checkUserId").css("color","crimson").text("아이디는 특수문자를 사용할수 없습니다.");
			return;
		}
		
		if($("#userId").val().length < 8){
			$("#checkUserId").css("color","crimson").text("아이디를 8글자 이상입력하세요.");
			return;
		}
		
		if($("#userId").val() !==''){
			$.ajax({
				url: "/user/api/confirmUserId/"+$("#userId").val(),
				method: "GET",
				headers : {
		            "Accept" : "application/json",
		            "Content-Type" : "application/json"
		        },
		        dataType : "json",
		        success : function(data){
		        	console.log(data)
		        	if(data.result ==="fail"){
		        		$("#checkUserId").css("color","crimson").text("중복된 아이디입니다.");
		        	} else if(data.result ==="success") {
		        		$("#checkUserId").css("color","#4b6cb7").text("사용가능한 아이디입니다.");
		        	} else {
		        		alert(data);
		        		alert("서버오류");
		        	}
		        }
			})
		} else {
			$("#checkUserId").css("color","crimson").text("아이디를 입력하세요.");
		}
		
	})
	
	// 비밀번호 검증
	$("#password").on("keyup",()=>{
		const pw = $("#password").val();
		const id = $("#userId").val();
			
		const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		const hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;		
		
		if(id===''){
			$("#passResult").css("color","crimson").text("아이디를 먼저 입력하세요.");
			return
		}
		
		if(false === reg.test(pw)) {
			$("#passResult").css("color","crimson").text("비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.");
			
			if(/(\w)\1\1\1/.test(pw)){
				$("#passResult").css("color","crimson").text("같은 문자를 4번 이상 사용하실 수 없습니다.");
			}else if(pw.search(id) > -1){			
				$("#passResult").css("color","crimson").text("비밀번호에 아이디가 포함되었습니다.");
			}else if(pw.search(/\s/) != -1){
				$("#passResult").css("color","crimson").text("비밀번호는 공백 없이 입력해주세요.");
			}else if(hangulcheck.test(pw)){
				$("#passResult").css("color","crimson").text("비밀번호에 한글을 사용 할 수 없습니다.");
			}else if(pw === ''){
				$("#passResult").css("color","crimson").text("비밀번호를 입력하세요.");
			} 
		} else {
			$("#passResult").css("color","#4b6cb7").text("사용가능한 비밀번호 입니다.");
			
			if(/(\w)\1\1\1/.test(pw)){
				$("#passResult").css("color","crimson").text("같은 문자를 4번 이상 사용하실 수 없습니다.");
			}else if(pw.search(id) > -1){			
				$("#passResult").css("color","crimson").text("비밀번호에 아이디가 포함되었습니다.");
			}else if(pw.search(/\s/) != -1){
				$("#passResult").css("color","crimson").text("비밀번호는 공백 없이 입력해주세요.");
			}else if(hangulcheck.test(pw)){
				$("#passResult").css("color","crimson").text("비밀번호에 한글을 사용 할 수 없습니다.");
			}else if(pw === ''){
				$("#passResult").css("color","crimson").text("비밀번호를 입력하세요.");
			} 
		}
		
	})
	
	// 비밀번호 동일 체크
	$("#confirmPassword").on("keyup",()=>{
		const pw = $("#password").val();
		const pwC = $("#confirmPassword").val();
		
		if(pw === pwC){
			$("#passCheck").css("color","#4b6cb7").text("비밀번호가 동일 합니다.");
		} else {
			$("#passCheck").css("color","crimson").text("비밀번호가 일치하지 않습니다.");
		}
	})
	
	$("#nickName").on("keyup",()=>{
		const nickName = $("#nickName").val();
		if(nickName.length < 5){
			$("#checknickName").css("color","crimson").text("닉네임은 5글자 이상 입력해주세요.");
		} else {
			$.ajax({
				url: "/user/api/confirmUserNickname/"+nickName,
				method: "GET",
				headers : {
		            "Accept" : "application/json",
		            "Content-Type" : "application/json"
		        },
		        dataType : "json",
		        success : function(data){
		        	if(data.result === "success"){
		        		$("#checknickName").css("color","#4b6cb7").text("사용가능한 닉네임 입니다.");
		        		return;
		        	}
		        	if(data.result === "fail"){
		        		$("#checknickName").css("color","crimson").text("닉네임이 중복입니다.");
		        		return;
		        	}
		        }
			})
		}
	})
	
	// 핸드폰 유효성 체크	
	$("#phone").on("keyup",()=>{
		const phonNum = $("#phone").val();
		const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		if (regPhone.test(phonNum) === true) {
			$("#phoneBtn").removeAttr("disabled");
		} else {
			$("#phoneBtn").attr("disabled","disabled");
		}
	})
	
	// 이메일 유효성 체크
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
	        		$("#phoneCheckForm").css("display","block");
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
	        		$("#emailCheckForm").css("display","block");
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
	        	$("#phoneBtn").attr("disabled","disabled");
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
	        	$("#emailBtn").attr("disabled","disabled");
	        	$("#emailCheckForm").css("display","none");
	        }
		})
	}
	
	$(()=>{
		$("input").on("change",()=>{
			const id = ($("#checkUserId").css("color")==="rgb(75, 108, 183)");
			const pw = ($("#passResult").css("color")==="rgb(75, 108, 183)");
			const pwC = ($("#passCheck").css("color")==="rgb(75, 108, 183)");
			const nickName = ($("#checknickName").css("color")==="rgb(75, 108, 183)");
			const phone = ($("#phone").attr("disabled")==="disabled");
			const email = ($("#email").attr("disabled")==="disabled");
			const address = ($("#address").val() !== '');
			const birth = ($("#birth").val() !== '');
			
			console.log(address)
			if(id && pw && pwC && nickName && phone && email && address && birth){
				console.log("성공")
				$("#insertUserIdBtn").removeAttr("disabled");
			} else {
				console.log("실패")
				$("#insertUserIdBtn").attr("disabled","disabled");
			}
		})
		
	});
	
</script>
</body>
</html>