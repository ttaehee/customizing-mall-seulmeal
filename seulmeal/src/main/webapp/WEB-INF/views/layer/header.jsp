<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="../../resources/css/body.css">
<script type="text/javascript">
	function join(){
		window.location.href = '/user/addUser';
	}
	
	function login(){
		window.location.href = '/user/login';
	}
</script>
	<div style="background:#BAD7DF; display:flex; justify-content:space-between;">
		<h3>오늘 할일</h3>
		<h4>신규 주문</h4>
		<h4>교환/반품 승인</h4>
		<h4>게시글 신고</h4>
		<h4>재고 소진</h4>
		<h4>문의 답변대기</h4>
	</div>

	<div style="background:#BAD7DF;">
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
	    <div>
			<span style="margin-right:10px;" onClick="join()">회원가입</span>
			<span style="margin-right:10px;"onClick="login()">로그인</span>
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
	          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">특가/이벤트</a>
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
	  </div>
	</nav> 	    
