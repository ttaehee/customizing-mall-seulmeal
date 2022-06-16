<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>음식 카테고리</title>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.min.js" integrity="sha512-ksHM9XpigYGeRdXZfI4GddPsUjmLj6zd1MCNXL4fsfDwp1G+u6hC73uwDjlpjdX4tbEtj/N1AWkLo6WjDwQkyA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<style>


.sideBanner {
	  position: absolute;
	  width: 100px;
	  height: 100px;
	  top: 50px;
	  background-image: url('../../resources/attachments/image/foodCategory.png');
	  color: #fffffff;
	  margin-top:160px;
	  background-repeat: no-repeat;
	  background-position: center center;
	  background-size: cover;
	  border-radius: 100%;
	}

</style>
<body>

<div style="display:flex; justify-content:space-between; margin-left:90%;">
	<div class="sideBanner psBtn" >
	음식 카테고리
</div>

<div id="ps" style="display:none;">
<noscript><h2 style="color: #ff0000">Seems your browser doesn't support Javascript! Websocket relies on Javascript being
    enabled. Please enable
    Javascript and reload this page!</h2></noscript>
<div id="main-content" class="container">
<table class="table table-hover text-center">
			<form action="/product/insertFoodCategory" method="POST">
				<tr>
				<th><input type="text" class="form-control" name="name" placeholder="카테고리명을 입력하세요" style="border: none; background-color: #fff;"/></th>
				<th><button type="submit" class="btn btn-primary" style="width:auto; border: none; background-color: #fff;">등록</button></th>
				</tr>
				</form>
			</thead>
			
				<tr style="background-color: #4b6cb7; color: #fff;">
					<th>카테고리명</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="foodCategory" items="${food}" varStatus="status">
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

<script type="text/javascript"> 
$(function() {

	  $("#delete").click(function(){
		  const no =$(this).data("value");
		window.location.href = '/product/deleteFoodCategory/'+no;
	  });
	  
	  $("#restore").click(function(){
		  const no =$(this).data("value");
		window.location.href = '/product/restoreFoodCategory/'+no;
	  });
	  
});

//modal
$(function(){
	$(".psBtn").on("click",function(){
		const pNo = $(this).data('value');
		$(".pNo").val(pNo);
		$("#ps").dialog({
			title : "음식 카테고리 설정",
			width : 500,
			height : 700,
			modal : true
		})
	})
})

// 기본 위치(top)값
const floatPosition = parseInt($(".sideBanner").css('top'))

// scroll 인식
$(window).scroll(function() {
  
    // 현재 스크롤 위치
    const currentTop = $(window).scrollTop();
    const bannerTop = currentTop + 2*floatPosition + "px";

    //이동 애니메이션
    $(".sideBanner").stop().animate({
      "top" : bannerTop
    }, 500);

}).scroll();
</script>
</body>
</html>