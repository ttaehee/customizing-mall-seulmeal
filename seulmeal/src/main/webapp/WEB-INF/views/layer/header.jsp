<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jquery/js-->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js" integrity="sha256-xH4q8N0pEzrZMaRmd7gQVcTZiFei+HfRTBPJ1OGXC0k=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!-- 
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
 -->

<!-- bootStrap/js -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<!-- bootStrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- bootStrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<link rel="stylesheet" href="../../../resources/css/body.css">

<style>
	.header{
		transition: background 0.6s;
		text-align: center;	
	}	
	
	.navbar.fixed {
		z-index: 100;
		position: fixed;
		left: 0;
		top: 0;
		width: 100%;
	}
	
	ul.nav li.dropdown:hover > ul.dropdown-menu { display:block; margin:0; }
</style>
	<!-- 어드민 -->
	<c:if test="${user.role == 1}">
		<div style="background:#BAD7DF; display:flex; justify-content:space-between;">
			<h3>오늘 할일</h3>
			<h4>신규 주문</h4>
			<h4>교환/반품 승인</h4>
			<h4>게시글 신고</h4>
			<h4>재고 소진</h4>
			<h4>문의 답변대기</h4>
		</div>
	</c:if>
	<div class="header" style="background:#fff; padding-top:10px; ">
	<div style="display:flex; justify-content:space-between; margin-left:10px; margin-right:10px;">
		<div id="google_translate_element" class="hd_lang"></div>
	    <script>
	      function googleTranslateElementInit() {
	        new google.translate.TranslateElement({
	          pageLanguage: 'ko',
	          includedLanguages: 'ko,zh-CN,zh-TW,ja,vi,th,tl,km,my,mn,ru,en,fr,ar',
	          //layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
	          autoDisplay: false
	        }, 'google_translate_element');
	      }
	    </script>
	    <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	    <div class="float-right" style="margin-right: 30px;">
        	
        	<c:if test="${ empty user }">
	        	<button type="button" class="btn btn-outline-primary me-2" onclick="login()">Login</button>
	        	<button type="button" class="btn btn-primary" onclick="join()">Sign-up</button>
        	</c:if>
        	
        	<c:if test="${ !empty user }">

        		<div class="dropdown show">
					<a class="d-flex align-items-center text-decoration-none dropdown-toggle" href="#"  id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<c:if test="${user.profileImage == null}">
							<img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
						</c:if>
						<c:if test="${user.profileImage != null}">
							<img src="../../../resources/attachments/profile_image/${user.profileImage}" alt="hugenerd" width="30" height="30" class="rounded-circle">
						</c:if>
	               		<span class="d-none d-sm-inline mx-1" style="color:black;">${user.userName}</span>					
					</a>					
					<div class="dropdown-menu dropdown-menu-right dropdown-menu-dark text-small shadow" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="user/getUpdateUser/{user.userId}">내 정보</a>
						<a class="dropdown-item" href="user/listUserPoint/{currentPage}">내 포인트</a>
						<a class="dropdown-item" href="#">내 구매내역</a>
						<a class="dropdown-item" href="#">내 게시글</a>
						<c:if test="${user.role == 1}">
							<a class="dropdown-item" href="#">관리자페이지</a>
						</c:if>
						<a class="dropdown-item" href="/user/logout">로그아웃</a>
					</div>
				</div>
        	</c:if>        	

        	
      	</div>
	</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light" style="background:#fff; box-shadow: 5px 5px 5px gray;">		
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/">seulMeal</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav nav">
	      	<li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            전체카테고리
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	          	<c:forEach var="foodcategory" items="${fList}">
	          		<li><a class="dropdown-item" href="/product/getListProduct/${foodcategory.foodCategoryNo}">${foodcategory.name}</a></li>
				</c:forEach>
	          </ul>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="/product/getListProduct">신상품</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/community/communityMain">게시판</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">베스트</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/operation/getListOperation/2">특가/이벤트</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            고객센터
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href="/operation/getListOperation/1">공지사항</a></li>
	            <li><a class="dropdown-item" href="/operation/getListOperation/3">문의관리</a></li>
	            <li><a class="dropdown-item" href="#">사이트 문의</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	    <!-- 검색창 -->
		<form class="searchProduct">
			<div style="display:flex;">	
				<div class="form-outline">
					<input name="searchKeyword" type="search" class="form-control searchP" />
				</div>		  
				<button onclick="searchProduct()" type="button" class="btn btn-primary">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>        
	  </div>
	</nav> 
	


	
<script type="text/javascript">
	console.log($(".searchP").val())
	
	$(".searchP").on("keypress",(e)=>{
		if(e.keyCode === 13){
			$(".searchProduct").attr("action","/product/getListProduct").submit();
		}
	})
	
	function searchProduct(){
		let url = "/product/getListProduct";
		if('${searchCondition}' !== ''){
			url += "/${searchCondition}";
		}
		
		if($(".searchP").val() !== ''){
			$(".searchProduct").attr("action",url).submit();
		}
		
	}
	
	function join(){
		window.location.href = '/user/insertUser';
	}
	
	function login(){
		window.location.href = '/user/login';
	}
	
	const nav = $(".navbar").offset().top;
	
	$(window).scroll(function(){
		const window = $(this).scrollTop();
		
		if(nav <= window){
			$(".navbar").addClass("fixed");
		} else {
			$(".navbar").removeClass("fixed");
		}
	})
	
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	  return new bootstrap.Tooltip(tooltipTriggerEl)
	})
</script>	    
