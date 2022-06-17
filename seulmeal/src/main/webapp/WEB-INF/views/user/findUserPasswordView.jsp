<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lnag="ko">

<head>
	<meta charset="UTF-8">
	<title>슬밀 비밀번호 찾기</title>
	<link rel="stylesheet" href="style.css">
	<script src="login.js"></script>
<style type="text/css">
body{
    background-color: #f5f6f7;
}
select{
    width:85px;
    height:25px;
    outline: none;
    background: #f5f6f7;
    border: 1px solid #999;
}
a{
    color: black;
    text-decoration: none;
}
.main{
    text-align: center;
	margin-top: 20px;
}
input{
    cursor: pointer
}

/*input 아이디박스*/
.login-id-wrap{

    margin: 0px 10px 8px 10px;
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
}
/*input 아이디 form*/
#input-id{
    border: none;
    outline:none;
    width:100%;
}
/*input 패스워드박스*/
.login-pw-wrap{

    margin: 0px 10px 8px 10px;
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
}
/*input 패스워드 form*/
#email{
    border: none;
    outline:none;
    width:100%;
}
#emailCode{
    border: none;
    outline:none;
    width:100%;
}
/*로그인버튼박스*/
 .login-btn-wrap{
    height: 52px;
    line-height: 55px;
    margin: 0px 10px 8px 10px;
    border: solid 1px rgba(0,0,0,.1);
	background-color: #ff4500;
    color: #fff;
    cursor: pointer; 
}
/*로그인버튼*/
#login-btn{
    width:200px;
    height: 50px;
    background-color: #ff4500;
    border: none;
    color:#fff;
    font-size: 18px;
    outline:none;
    cursor: pointer;
}
/*로그인 아래 박스*/
.under-login{
    height: 50px;
    border-bottom: 1px solid gainsboro;
    margin: 0px 10px 35px 10px;
}
/*로그인상태유지*/
.stay-check{
    margin-left: 7px;
    float: left;
}
/*로그인상태유지 체크박스*/
.stay-check input[type="checkbox"] {
    /*기존 체크박스 숨기기*/
    position: absolute;
    width: 0px;
    position: absolute;
}
.stay-check input[type="checkbox"] + label {
    display: inline-block;
    position: relative;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    }
.stay-check input[type="checkbox"] + label::before {
    content: ' ';
    display: inline-block;
    width: 22px;
    height: 22px;
    line-height: 18px;
    margin: -2px 8px 0 0;
    text-align: center;
    vertical-align: middle;
    background: #fafafa;
    border: 1px solid #cacece;
    border-radius: 50%;
    box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.stay-check input[type="checkbox"]:checked + label::before {
    content: '\2713';
    color: white;
    text-shadow: 1px 1px white;
    background: #ff4500;
    border-color: #ff4500;
    box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}

/*간편한 로그인 구역*/
#easy-login-wrap{
    height: 90px;
    margin: 0px 10px 35px 10px;
}
/*간편한 로그인 텍스트*/
.easy-login{
    font-size: 20px;
    font-weight: 500;
}
/*QR & 일회용 로그인 박스 구역*/
.easy-login-box{
    display: grid;
    grid-template-columns: 1fr 1fr;
}
/*QR코드 로그인*/
.qr-login{
    float: left;
    border: 1px solid #03c75a;
    background-color: #fff;
    margin: 0px 4px 0px 0px;
    line-height: 55px;
}
/*일회용 번호 로그인*/
/* .onetime-login{
    float: right;
    border: 1px solid #03c75a;
    background-color: #fff;
    margin: 0px 0px 0px 4px;
    line-height: 55px;
} */
/*더욱 간편한 로그인-en모드*/
.qr-login-en, .facebook-login, .line-login{
    font-family: Helvetica,Dotum,sans-serif;
    font-size: 18px;
    font-weight: 400;
    text-align: left;
    line-height: 55px;
    border: solid 1px #dadada;
    background: #fff;
    margin-bottom: 10px;
}
/*더욱 간편한 로그인 이미지-en모드*/
.easy-login-box-en img{
    display: inline-block;
    vertical-align: middle;
    margin: 0 10px 0 10px;
}
/*찾기 및 회원가입*/
.find-signup-wrap{
    height: 100px;
    grid-template-columns: 1fr 1fr 1fr;
}
/*찾기 및 회원가입 글자 희미하게 바꾸기*/
.find-signup-wrap a{
    color: rgb(150, 150, 150);
    text-decoration: none;
    font-weight: 500;
}
.find-signup-wrap span{
    color: rgb(150, 150, 150);
    font-weight: 500;
}
/*아이디 찾기*/
.find-id{
    margin: 3px;
    font-size: 14px;
    border-right: 1px solid gainsboro;
}
/*아이디 찾기-en모드*/
.find-id-en{
    font-size: 14px;
}
/*비밀번호 찾기*/
.find-pw{
    margin: 3px;
    font-size: 14px;
    border-right: 1px solid gainsboro;
}
/*회원가입*/
.sign-up{
    margin: 3px;
    font-size: 14px;
}

/*가로 800px 이상일때*/
@media(min-width : 800px)
{
    .main{
        width: 460px;
        margin: auto;
    }



}

</style>
</head>

<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="main">
		<!--로그인 부분-->
		<form class="form-signin" method="post" action="/user/findUserPasswordView" target="_self">
			<section class="login-wrap">
				<h2>비밀번호 찾기</h2>
				<div class="login-id-wrap">
					<input id="input-id" name="userId" placeholder="아이디" type="text"></input>
				</div>
				<div class="login-pw-wrap">
					<input id="email" name="email" placeholder="이메일" type="text"></input>
				</div>
				<div class="login-pw-wrap" id="emailCheckForm" style="display: none;">
					<input id="emailCode" name="email" placeholder="인증번호를 입력하세요" type="text"></input>
				</div>
				<div class="login-btn-wrap" id="confirm">
					<button id="login-btn" type="button" onclick="idSearch()">인증 하기</button>
				</div>
				<div class="login-btn-wrap" id="reset" style="display: none;">
					<button id="login-btn" type="button" onclick="confirmEmail()" >비밀번호 재설정</button>
				</div>

			</section>
		</form>
</div>

		<jsp:include page="../layer/footer.jsp"></jsp:include>
<script type="text/javascript">

//이메일 중복체크
function idSearch(){
	const idSearch = {
			id: $("#input-id").val(),
			email: $("#email").val(),
			idSearch: "0"
	}
	
	console.log(idSearch)
	
	 $.ajax({
		url: "/user/api/confirmUserEmail",
		method: "GET", 
		data: idSearch,
		headers : {
            "Accept" : "application/json",
            "Content-Type" : "application/json"
        },
        dataType : "json",
        success : function(data){
        	if(data.result === "success"){
        		alert("인증번호를 입력하세요");
        		$("#emailCheckForm").css("display","block");
        		$("#reset").css("display","block");
        		$("#confirm").css("display","none");
        		return;
        	}
        	if(data.result === "fail"){
        		alert("가입시 등록한 정보가 맞는지 다시 확인해주세요");
        		return;
        	}
        }
	})		 
}


//이메일인증 확인
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
        	if(data.result === "인증완료"){
        		location.href='/user/resetUserPassword'
        		return;
        	}
        	if(data.result === "인증실패"){
        		alert("인증번호가 틀렸습니다 다시 입력해주세요");
        		return;
        }
	})
}

</script>

</body>
</html>