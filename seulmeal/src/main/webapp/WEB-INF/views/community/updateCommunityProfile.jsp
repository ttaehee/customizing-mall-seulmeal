<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 정보 수정</title>


<script type="text/javascript">
function count_check(obj){
	var chkBox = document.getElementsByName("foodCategoryName");
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
</script>


</head>
<body>

	<jsp:include page="../layer/header.jsp"></jsp:include>

	<div class="container">
	
		<form class="" action="/community/updateProfile" method="POST">
		
		<!-- 프로필 이미지 -->
		<label for="profileImg" class="col-sm-2 control-label">프로필 이미지</label>
		<img name="profileImage" style="width: 80px; height: 80px"
			src="/resources/attachments/profile_image/${sessionScope.user.profileImage}" />
			
		
		<!-- 모달창 실행 버튼 -->
		<button id="updateProfileImageModal_Btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateProfileImageModal">
	  		프로필 이미지 변경
		</button>
		<!-- Modal -->
		<div id="updateProfileImageModal" class="modal fade"  aria-labelledby="staticBackdropLabel" aria-hidden="true" data-backdrop="static" tabindex="-1" role="dialog">
			<div class="modal-dialog" >
				<div class="modal-content">
					<!-- 외부 모달 창 load 되는 곳 -->
				</div>
			</div>
		</div>
	
		
		<!-- 닉네임 -->	
		
		  <div class="form-group">
		  	<label for="inputNickName" class="col-sm-2 control-label">닉네임</label>
		  	<div class="col-sm-7">
		  	  <input type="text" name="nickName" id="nickName" class="form-control mx-sm-3"  value="${sessionScope.user.nickName}">
		    </div>
		  </div>
			
		<!-- 상태메시지 -->	 
		  <div class="form-group">
		    <label for="inputProfileMessage" class="col-sm-2 control-label">상태메시지</label>
			<div class="col-sm-7">
			    <input type="text" name="profileMessage" id="profileMessage" class="form-control mx-sm-3" aria-describedby="nickNameHelpInline" value="${sessionScope.user.profileMessage}">
			    <small id="nickNameHelpInline" class="text-muted col-sm-7">
			      60자 이내로 입력해주세요.
		    </small>
		    </div>
		  </div>
			
		<!-- 선호음식 -->
		<label for="inputProfileMessage" class="col-sm-2 control-label">선호음식 카테고리</label>
		<div class="form-check form-check-inline">
		
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox1" value="한식">
		  <label class="form-check-label" for="inlineCheckbox1">한식</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox2" value="중식">
		  <label class="form-check-label" for="inlineCheckbox2">중식</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox3" value="일식" >
		  <label class="form-check-label" for="inlineCheckbox3">일식</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox4" value="양식">
		  <label class="form-check-label" for="inlineCheckbox4">양식</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox5" value="동남아">
		  <label class="form-check-label" for="inlineCheckbox5">동남아</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox6" value="분식/야식" >
		  <label class="form-check-label" for="inlineCheckbox6">분식/야식</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox7" value="비건">
		  <label class="form-check-label" for="inlineCheckbox7">비건</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox8" value="다이어트">
		  <label class="form-check-label" for="inlineCheckbox8">다이어트</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox9" value="캠핑" >
		  <label class="form-check-label" for="inlineCheckbox9">캠핑</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" name="foodCategoryName" onclick="count_check(this);" type="checkbox" id="inlineCheckbox10" value="세트">
		  <label class="form-check-label" for="inlineCheckbox10">세트</label>
		</div>	
		
		<!-- 수정버튼 -->
		<div>
			<button id="updateProfileBtn" type="submit" class="btn btn-primary">
				수정</button>
			<button id="cancelBtn" type="button" class="btn btn-primary" onclick="history.back()">
				취소</button>
		</div>
		
		</form>	
	</div>


	<!-- 버튼 클릭 : 모달창 실행 -->
	<script>
	$("#deleteProfileImageBtn").on(
			"click",
			function() {

				$.ajax({
					url : "/community/api/deleteProfileImage",
					method : "POST",
					//data : JSON.stringify(jsonReq),
					//data : jsonReq,
					//dataType : "json",
					//contentType : "application/json; charset=utf-8",
					/*
					headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
					 */
					success : function(DTORes,status) {

						//(status : sucess or err)
						alert("status: " + status);
						console.log("status: " + status);
						
						alert("DTORes : " + DTORes);
						console.log("DTORes : " + DTORes);

						// 응답받은 dto 객체의 value 값 꺼내기
						var result = DTORes["profileImage"];

						alert("result: " + result);
						console.log("result : " + result);

						//$("#" + postNo + "").html(displayValue);
					}
				});

			});
	
	$(".modal-content").load("/community/updateCommunityProfileImageModal");
	//$(".modal-content").load($(this).data("remote"));  모달창 실행 버튼에 data-remote = "load 할 url" ... 실패.. 
	
	
</script>


</body>
</html>