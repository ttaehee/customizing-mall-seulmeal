<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>음식 카테고리</title>    

</head>
<style>


</style>

<script>
function check() {
    if( insert.insertText.value == "") {
        window.alert("카테고리명을 작성하지 않으셨습니다.");
        document.getElementById('insertText').select();
        return false;
    }
}
</script>
<body>

<jsp:include page="../layer/header.jsp"></jsp:include>

<table class="table table-hover text-center" style="height: autopx; width: 500px; margin-left:auto; margin-right:auto;">
			<form id="insert" action="/product/insertFoodCategory" onsubmit="return check()" method="POST">
				<p style="font-size: 35px; text-align: center;">음식 카테고리 설정</p>
				<hr style="padding:-5%; border: solid 2px #ff4500; width:520px">
				<tr>
					<th><input type="text" class="form-control" id="insertText" placeholder="카테고리명을 입력하세요" style="border: none; background-color: #fff;"/></th>
					<th><button type="button" onclick="insertFoodCategory()" class="btn btn-primary" style="width:100%; height:100%;  border: none; background-color: #fff;">등록</button></th>
				</tr>
			</form>
			</thead>
			
				<tr style="background-color: #ff4500; color: #fff;">
					<th>카테고리명</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody class="foodTable">
				<c:forEach var="foodCategory" items="${list}" varStatus="status">
				<tr>
					<th style="text-align: center;">[${foodCategory.foodCategoryNo}] ${foodCategory.name}</th>
					<th>
					<c:if test="${foodCategory.status == 0 }">
						<div data-value="${foodCategory.foodCategoryNo}" class="btn-delete" id="delete" style="cursor: pointer;">
						끄기</div>
					</c:if>
					<c:if test="${foodCategory.status == 1 }">
						<div data-value="${foodCategory.foodCategoryNo}" class="btn-restore" id="restore" style="cursor: pointer;">
						켜기</div>
					</c:if>
					</th>
				</tr>
				</c:forEach>
			</tbody>
		</table>
<jsp:include page="../layer/footer.jsp"></jsp:include>

<script type="text/javascript"> 
	function insertFoodCategory(){		
		
		$.ajax({
			url : "/product/api/insertFoodCategory",
			method : "POST",
			data : JSON.stringify({
				name : $("#insertText").val()
			}),
			dataType : "json",
			contentType : "application/json; charset=utf-8",
	        success : function(data,status){
	        	const card = `<tr>
					<th style="text-align: center;">[] ${data.name}</th>
					<th>
						<div data-value="${foodCategory.foodCategoryNo}" class="btn-delete" id="delete" style="cursor: pointer;">
						끄기</div>
					</th>
				</tr>`
				
	        	$(".foodTable").append(card);
	        }
		})
	}

$(function() {
	
	  $(".btn-delete").click(function(){
		  const no =$(this).data("value");
		window.location.href = '/product/deleteFoodCategory/'+no;
	  });
	  
	  $(".btn-restore").click(function(){
		  const no =$(this).data("value");
		window.location.href = '/product/restoreFoodCategory/'+no;
	  });

});
</script>
</body>
</html>