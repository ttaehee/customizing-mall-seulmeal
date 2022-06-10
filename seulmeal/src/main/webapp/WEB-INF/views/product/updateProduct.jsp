<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
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
<form action="/product/updateProduct" method="POST">
	품번 : ${product.productNo }<br/>
	<select name="no">
		<c:forEach var="foodcategory" items="${list}">
			<c:set var="i" value="${i+1}" />
			<option value="${foodcategory.foodCategoryNo}">${foodcategory.name}</option>
		</c:forEach>
	</select><br/>
	이름 : <input name="name" value="${product.name }"/><br/>
	짧은 내용 : <input name="subContent" value="${product.subContent}"/><br/>
	가격 : <input name="price" value="${product.price}"/><br/>
	썸네일 : <input type=file name="thumbnail" value="${product.thumbnail}"/><br/>
	칼로리 : <input name="calorie" value="${product.calorie}" /><br/>
	내용 : <input name="content"  value="${product.content}"/><br/>
	생성일 : ${product.regDate }<br/>
	판매상태 : ${product.status }<br/>
	재고 : <input name="stock" value="${product.stock}"/><br/>
	별점 평균 : ${product.averageRating }<br/>
	좋아요 수 : ${product.likeCount }<br/>
	리뷰 수 : ${product.reviewCount }<br/>
	<button type="submit">저장</button>
	
	
	<div>
		재료 검색 : <input class="search" /><div class="partSearch">검색</div>
		<div class="parts"></div>
	</div>
	</form>
</body>
</html>