<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lnag="ko">

<head>
	<meta charset="UTF-8">
	<title>슬밀 로그인</title>
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
#input-pw{
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
	background-color: #4b6cb7;
    color: #fff;
    cursor: pointer;
}
/*로그인버튼*/
#login-btn{
    width:100px;
    height: 50px;
    background-color: #4b6cb7;
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
    background: #4b6cb7;
    border-color: #4b6cb7;
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
		<form class="form-signin"  method="post" action="/user/login" target="_self">
		<section class="login-wrap">
			<h1>슬밀</h1>
			<div class="login-id-wrap">
				<input id="input-id" name="userId" placeholder="아이디" type="text"></input>
			</div>
			<div class="login-pw-wrap">
				<input id="input-pw" name="password" placeholder="비밀번호" type="password"></input>
			</div>
			<div class="login-btn-wrap">
				<button id="login-btn" type="submit">로그인</button>
			</div>
			<div class="under-login">
				<span class="stay-check">
					<input id="stay-checkbox" type="checkbox" name="checkLogin" value="1"></input>
					<label for="stay-checkbox" id="stay-text" >로그인 상태 유지</label>
				</span>
			</div>

		</section>
</form>
		<!--간편한 로그인 부분-->
		<section id="easy-login-wrap">
			<div id="easy-login-wrap-ko">
				<div class="easy-login-box">
					<div class="qr-login">
						<a href="https://nid.naver.com/nidlogin.login?mode=qrcode" target="_blank" title="QR코드 로그인">QR
							코드 로그인</a>
					</div>

					<div class="onetime-login">
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=972aafa79be1ef957c5ab9ed1149b0e7&redirect_uri=http://localhost:7100/user/kakaoLogin&response_type=code">
						<img src = "/resources/attachments/image/kakao_login_large_narrow.png" width="210px" height="60px">
						</a>
					</div>
				</div>
			</div>
		</section>

		<!--class,PW 찾기 및 회원가입 부분-->
		<section class="find-signup-wrap">

			<div id="find-signup-wrap-ko">
				<span class="find-id">
					<a href="/user/findUserIdView">아이디 찾기</a>
				</span>

				<span class="find-pw">
					<a href="https://nid.naver.com/user2/help/pwInquiry?lang=ko_KR" target="_blank"
						title="일회용번호 로그인">비밀번호 찾기</a>
				</span>

				<span class="sign-up">
					<a href="./signup.html" target="_blank"
						title="일회용번호 로그인">회원가입</a>
				</span>
			</div>
		</section>

	</div>

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