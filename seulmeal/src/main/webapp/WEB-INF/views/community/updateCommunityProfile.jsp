<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 정보 수정</title>

<style type="text/css">

.container{
    width:100%;
    height:100%;
}

.profile-form{
	padding: 30px;
	width:800px;
    margin:0 auto;
}

.form-group{
margin: 40px 0px 0px 0px;
}

#img_section{
	margin-left:10px;
	width:100px;
	height:100px;
	border: 2px solid #fff;
    border-radius: 7px;
    color: #fff;
}

#updateProfileImageModal_Btn {
    margin-top: 40px;
}

.form-check{
	margin-left: 20px;
}

.button-div{
	margin-top:35px;
	position:relative;
	left:70%;
}

/* 파일 업로드 - 파일선택 없애기*/
.filebox input[type="file"]{
	position: absolute;
	overflow: hidden;
	width: 0;
    height: 0;
    padding: 0;
    border: 0;
}

.filebox label {
    cursor: pointer;
}

.modal-content{
	position: fixed;
	left: 50%;
	top: 50%;
	margin-left: -229px;  
	margin-top: 130px;  
}

</style>
</head>
<body>

	<jsp:include page="../layer/header.jsp"></jsp:include>

	<div class="container">
	
		<form class="profile-form" action="/community/updateProfile" method="POST" enctype="multipart/form-data">
			<input type="hidden" name = "userId" value="${sessionScope.user.userId}">
		<!-- 프로필 이미지 -->
			<img id="img_section" name="profileImage" 
				src="/resources/attachments/profile_image/${sessionScope.user.profileImage}" />
							
			<!-- 모달창 실행 버튼 -->
			<button id="updateProfileImageModal_Btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateProfileImageModal">
		  		프로필 이미지 변경
			</button>
			<!-- 모달창 include -->
			<jsp:include page="updateCommunityProfileImageModal.jsp"/>
			
			<!-- 닉네임 -->	
			  <div class="form-group">
			  	<label for="inputNickName" class="col-sm-5 control-label" style="font-size: 20px;">닉네임</label>
			  	<div class="col-sm-7">
			  	  <input type="text" name="nickName" style="width:605px;" id="nickName" class="form-control mx-sm-3"  value="${sessionScope.user.nickName}">
			    </div>
			  </div>
				
			<!-- 상태메시지 -->	 
			  <div class="form-group">
			    <label for="inputProfileMessage" class="col-sm-5 control-label" style="font-size: 20px;">상태메시지</label>
				<div class="col-sm-7">
				    <input type="text" name="profileMessage" style="width:605px;" id="profileMessage" class="form-control mx-sm-3" aria-describedby="nickNameHelpInline" value="${sessionScope.user.profileMessage}">
				    <small id="nickNameHelpInline" class="text-muted col-sm-7">
				      60자 이내로 입력해주세요.
			    </small>
			    </div>
			  </div>
				
			<!-- 선호음식 -->
			<div class="form-group">
				<div class="col-sm-5 control-label" style="margin-bottom: 5px; font-size: 20px;" >선호음식 카테고리</div>
					<c:forEach var="foodcategory" items="${foodcategoryList}" >
						<div class="form-check form-check-inline" >
								<input class="form-check-input" name="foodcategory" value="${foodcategory.name}" onclick="count_check(this);" type="checkbox"> 
								<label class="form-check-label" for="inlineCheckbox1">${foodcategory.name}</label>		
						</div>
					</c:forEach>
			</div>
		
			<!-- 수정버튼 -->
			<div class = "button-div">
				<button id="updateProfileBtn" type="submit" class="btn btn-primary">
					수정</button>
				<button id="cancelBtn" type="button" class="btn btn-primary" onclick="history.back()">
					취소</button>
			</div>
		
		</form>	
	</div>

	<jsp:include page="../layer/footer.jsp"></jsp:include>

<script>
	$("#deleteProfileImageBtn").on(
			"click",
			function() {
				
				$.ajax({
					url : "/community/api/deleteProfileImage",
					method : "POST",
					success : function(data,status) {
						
						//(status : sucess or err)
						//alert("status: " + status);
						console.log("status: " + status);
						
						//alert("data : " + data);
						console.log("data : " + data);

						$("#img_section").attr("src",data);
						console.log($("#img_section"));
						
						//$('#updateProfileImageModal').off()
						$('#updateProfileImageModal').modal("hide"); //닫기 
					}
				});
			});


// 체크박스 3개만 선택가능
function count_check(obj){
	var chkBox = document.getElementsByName("foodcategory");
	var chkCnt = 0;
	
	for(var i = 0; i<chkBox.length; i++){
		if(chkBox[i].checked){
			chkCnt++;
		}
	}
	if(chkCnt > 3){
		alert("3개까지 체크할 수 있습니다.");
		obj.checked = false;
		return false;
	}
}


// 파일 미리보기
const reader = new FileReader();

reader.onload = (readerEvent) => {
    document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
};

$(function(){
	document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
		
	    const imgFile = changeEvent.target.files[0];
	    reader.readAsDataURL(imgFile);
	})
})

	
	
</script>


</body>
</html>