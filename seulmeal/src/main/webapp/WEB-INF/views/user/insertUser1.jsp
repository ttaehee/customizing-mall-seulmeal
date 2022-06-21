<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lnag="ko">
    <head>
        <meta charset="UTF-8">
        <title>네이버 : 회원가입</title>
        <link rel="stylesheet" href="new_main.css">
        <style type="text/css">
        /* 레이아웃 틀 */
html {
    height: 100%  !important;
}

body {
    margin: 0 !important;
    height: 100% !important;
   /*  background: #f5f6f7 !important; */
    font-family: Dotum,'돋움',Helvetica,sans-serif !important;
}
#logo {
    width: 240px !important;
    height: 44px !important;
    cursor: pointer !important;
}

#header {
    padding-top: 62px !important;
    padding-bottom: 20px !important;
    text-align: center !important;
}
#wrapper {
    position: relative !important;
    height: 100% !important;
}

#content {
    position: absolute !important;
    left: 50% !important;
    transform: translate(-50%) !important;
    width: 460px !important;
}




/* 입력폼 */

input:focus {
    outline: none !important;
}


h3 {
    margin: 19px 0px -5px 0px !important;
    font-size: 20px !important;
    font-weight: 700 !important;
}


.box {
    display: block !important;
    width: 100% !important;
    height: 51px !important;
    border: solid 1px #dadada !important;
    padding: 10px 14px 10px 14px !important;
    box-sizing: border-box !important;
    background: #fff !important;
    position: relative !important;
}

.int {
    display: block !important;
    position: relative !important;
    width: 100% !important;
    height: 29px !important;
    border: none !important;
    background: #fff !important;
    font-size: 15px !important;
}

input {
    font-family: Dotum,'돋움',Helvetica,sans-serif !important;    
}

.box.int_id {
    padding-right: 110px !important;
}

.box.int_pass {
    padding-right: 40px !important;
}

.box.int_pass_check {
    padding-right: 40px !important;
}

.step_url {
    /*@naver.com*/
    position: absolute !important;
    top: 16px !important;
    right: 13px !important;
    font-size: 15px !important;
    color: #8e8e8e !important;
}

.pswdImg {
    width: 18px !important;
    height: 20px !important;
    display: inline-block !important;
    position: absolute !important;
    top: 50% !important;
    right: 16px !important;
    margin-top: -10px !important;
    cursor: pointer !important;
}

#bir_wrap {
    display: table !important;
    width: 100% !important;
}

#bir_yy {
    display: table-cell !important;
    width: 147px !important;
    
}

#bir_mm {
    display: table-cell !important;
    width: 147px !important;
    vertical-align: middle !important;
}

#bir_dd {
    display: table-cell !important;
    width: 147px !important;
}

#bir_mm, #bir_dd {
    padding-left: 10px !important;
}

select {
    width: 100% !important;
    height: 29px !important;
    font-size: 15px !important;
    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat !important;
    background-size: 20px 8px !important;
    -webkit-appearance: none !important;
    display: inline-block !important;
    text-align: start !important;
    border: none !important;
    cursor: default !important;
    font-family: Dotum,'돋움',Helvetica,sans-serif !important;
}

/* 에러메세지 */

.error_next_box {
    margin-top: 9px !important;
    font-size: 12px !important;
    color: red !important;    
    display: none !important;
}

#alertTxt {
    position: absolute !important;
    top: 19px !important;
    right: 38px !important;
    font-size: 12px !important;
    color: red !important;
    display: none !important;
}

/* 버튼 */

.btn_area {
    margin: 30px 0 91px !important;
}

#btnJoin {
    width: 100% !important;
    padding: 21px 0 17px !important;
    border: 0 !important;
    cursor: pointer !important;
    color: #fff !important;
    background-color: #08a600 !important;
    font-size: 20px !important;
    font-weight: 400 !important;
    font-family: Dotum,'돋움',Helvetica,sans-serif !important;
}
        </style>
    </head>
    
    <body>
    <jsp:include page="../layer/header.jsp"></jsp:include>
        <!-- header -->
        <div id="header">
           <h1>회원가입</h1>
        </div>


        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">

                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="userId" name="userId" class="int" maxlength="20">
                        <span class="step_url"></span>
                    </span>
                    <div id="checkUserId"></div>
	      			<div style="font-size: 15px;">아이디는 8글자 이상 공백,특수문자,한글이 불가능 합니다.</div>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="password" name="password" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
      
                    </span>
                    <span class="error_next_box"></span>
                    <div id="passResult" style="color:crimson;"></div>
	      			<div style="font-size: 15px;">비밀번호는 8글자 이상 특수문자1개, 알파벳 대문자 1개를 포함하고 공백과 아이디가 포함되지 않아야 합니다.</div>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="confirmPassword" class="int" maxlength="20">
                        
                    </span>
                    <span class="error_next_box"></span>
                     <div id="passCheck" style="color:crimson;"></div>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="userName" name="userName" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                 <div>
                    <h3 class="join_title"><label for="name">닉네임</label></h3>
                    <span class="box int_name">
                        <input type="text" id="nickName" name="nickName" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                    <div id="checknickName" style="color:crimson;"></div>
	      <div style="font-size: 15px;">닉네임은 5글자 이상 입력해 주세요.</div>
                </div>
                <div>
                <div>
                    <h3 class="join_title"><label for="name">이메일</label></h3>
                    <span class="box int_name">
                        <input type="text" id="email" name="emaile" class="int" maxlength="20">
                        
                    </span>
                    <input id="emailBtn" onclick="emailCheck()" value="인증하기" type="button" class="btn btn-default" disabled="disabled">
                    <span class="error_next_box"></span>
                </div>
                 <div class="col-sm-10" id="emailCheckForm" style="display: none;">
			<div class="inputBar">
				<input name="email" style="width: 100%;" type="text" class="form-control" id="emailCode" placeholder="인증번호를 입력하세요">
				<input type="button" onclick="confirmEmail()" class="btn btn-default" value="인증확인">
			</div>
	    </div>
                </div>
                

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="yy">생년월일</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
                                <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                            </span>
                        </div>

                        <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
                                <select id="mm" class="sel">
                                    <option>월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>                                    
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </span>
                        </div>

                        <!-- BIRTH_DD -->
                        <div id="bir_dd">
                            <span class="box">
                                <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                            </span>
                        </div>

                    </div>
                    <span class="error_next_box"></span>    
                </div>

                <!-- GENDER -->
                <div>
                    <h3 class="join_title"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" class="sel">
                            <option>성별</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>                            
                    </span>
                    <span class="error_next_box">필수 정보입니다.</span>
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(선택)</span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" placeholder="선택입력">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="error_next_box"></span>    
                </div>


                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" id="btnJoin">
                        <span>가입하기</span>
                    </button>
                </div>

                

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
    <script src="main.js"></script>
    <jsp:include page="../layer/footer.jsp"></jsp:include>
    </body>
</html>