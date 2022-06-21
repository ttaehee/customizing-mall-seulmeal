<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>insertUser</title>
</head>
<style>  
body { background: #fff; }

  table {
    width: 700px;
     margin-left:auto; 
    margin-right:auto;
  }

.modal-title{
 display: flex; 
 justify-content: center;
}  
  
.bluetop {
  border-collapse: collapse;
  border-top: 3px solid #168;
}  
.bluetop th {
  color: #168;
  background: #f0f6f9;
}
.bluetop th, .bluetop td {
  padding: 10px;
  border: 1px solid #ddd;
}
.bluetop th:first-child, .bluetop td:first-child {
  border-left: 0;
}
.bluetop th:last-child, .bluetop td:last-child {
  border-right: 0;
}
</style>
<script type="text/javascript">
	
$(()=>{
	$(".partSearch").on("click",()=>{
		$.ajax({
			url:"/product/api/getPartsName/"+$(".search").val(),
			method:"GET",
	        headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	        },
	        dataType : "json",
	        success : function(data){	        	
	        	console.log(data);
	        	const parts = "<div> <input type='hidden' name='partsNo' value='"+data.partsNo+"' /> <input type='hidden' name='partsName' value='"+data.name+"' />"
	                +"<div class='part' data-parts='"+data.partsNo+"'>"+ data.name +"</div>"
	                +"</div>"
	        	$(".parts").append(parts);
	        }
		})
	})
})
	
	
</script>
<body>

	<jsp:include page="../layer/header.jsp"></jsp:include>

	<div class="container">
		<br /> <br /> <br /> <br />
		<h2>내 정보</h2>
		<form class="form-horizontal" method="post" action="/user/getUpdateUser" target="_self">
			<div class="form-group">
				<label for="Email3" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
				<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="중복확인하세요"  readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="Password3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password" name="password" placeholder="">
				</div>
			</div>
			<div class="form-group">
				<label for="Password3" class="col-sm-2 control-label">새 비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="NewPassword" placeholder="">
				</div>
			</div>
			<div class="form-group">
				<label for="Password3" class="col-sm-2 control-label">비밀번호 확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="confirmPassword" placeholder="">
				</div>
			</div>
			<div class="form-group">
				<label for="Email3" class="col-sm-2 control-label">이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="userName" name="userName" value="${user.userName }" placeholder="">
				</div>
			</div>
			<div class="form-group">
				<label for="Email3" class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName }" placeholder="">
				</div>
			</div>
			<div class="form-group">
				<label for="Email3" class="col-sm-2 control-label">회원등급</label>
				<div class="col-sm-10" data-toggle="modal" data-target="#exampleModalCenter">
				
				
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					 <c:choose>
						<c:when test="${user.grade eq '0'}">슬밀프랜즈</c:when>
						<c:when test="${user.grade eq '1'}">슬밀패밀리</c:when>
						<c:when test="${user.grade eq '2'}">슬밀히어로</c:when>
						<c:when test="${user.grade eq '3'}">슬밀마스터</c:when>
					</c:choose>
				
					</button>
					 
				</div>
			</div>
			<div class="form-group">
				<label for="Email3" class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email" name="email" value="${user.email }" placeholder="">
				</div>
			</div>
			<div class="form-group">
				<label for="Email3" class="col-sm-2 control-label">휴대폰</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="phone" name="phone" value="${user.phone }" placeholder="">
				</div>
			</div>
			<div class="form-group">
				<label for="Email3" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="address" name="address" value="${user.address }" placeholder="">
				</div>
			</div>
			<div class="form-group">
				<label for="Email3" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-10">
					<%-- ${user.birth } --%>
				</div>
				
				
			</div>
			
			<div class="btn-group" data-toggle="buttons">
				<c:forEach var="foodcategory" items="${foodcategoryList}">
					<label class="btn btn-primary active">
						<input type="checkbox" name="foodcategory" value="${foodcategory.name }"> ${foodcategory.name }
					</label>
				</c:forEach>
			</div>
			<div>
				재료 검색 : <input class="search" />
				<div class="partSearch">검색</div>
				<div class="parts"></div>
			</div>

			<div class="form-group">
				<label for="exampleInputFile"></label>
				<input type="file" id="imageFile" name="imageFile" multiple="multiple">
				<p class="help-block">프로필 이미지를 선택해주세요</p>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-2 control-label">상태메세지</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="profilemessage" name="profilemessage" placeholder="내용을 입력해 주세요">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">저장</button>
					<button type="button" onclick="location.href='/user/deleteUser'" class="btn btn-default">탈퇴</button>
				</div>
			</div>
		</form>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원등급 안내</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="bluetop">
           <%--  <caption>표 제목</caption> --%>
            <thead>
                <tr align="center" bgcolor="white">
                    <td></td>
                    <th>슬밀프렌드</th>
                    <th>슬밀패밀리</th>
                    <th>슬밀히어로</th>
                    <th>슬밀마스터</th>
                </tr>
            </thead>

            <tbody>
                <tr align="center" bgcolor="white">
                    <td>조건</td>
                    <td>회원가입</td>
                    <td>월 3회 구매</td>
                    <td>월 5회 구매</td>
                    <td>월 10회 구매</td>
                </tr>
                <tr align="center" bgcolor="white">
                  <td>혜택</td>
                  <td>구매액 0.5% 적립</td>
                  <td>구매액 1% 적립</td>
                  <td>구매액 3% 적립</td>
                  <td>구매액 5% 적립</td>
                </tr>
            </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
	

	

</body>
</html>