<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- bootStrap css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- bootStrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- 우리 css, font -->
<link href="../../resources/css/body.css">


<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js" integrity="sha256-xH4q8N0pEzrZMaRmd7gQVcTZiFei+HfRTBPJ1OGXC0k=" crossorigin="anonymous"></script>

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
	<div class="header" style="background:#BAD7DF;">
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
	    <div class="col-md-3 text-end">
        	<button type="button" class="btn btn-outline-primary me-2" onclick="login()">Login</button>
        	<button type="button" class="btn btn-primary" onclick="join()">Sign-up</button>
      	</div>
	</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light" style="background:#BAD7DF;">		
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/">seulMeal</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav">
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
	          <a class="nav-link" href="#">게시판</a>
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
	    
	    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 searchProduct">
          <input type="search" class="form-control form-control-dark searchP" name="searchKeyword" placeholder="Search..." aria-label="Search">
          <button onclick="searchProduct()">검색</button> 
          <!--<button type="submit">검색</button>-->
        </form>
        
	  </div>
	</nav> 
	
<script type="text/javascript">
	console.log($(".searchP").val())
	
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
	
</script>	    
