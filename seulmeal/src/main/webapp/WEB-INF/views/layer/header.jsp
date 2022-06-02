<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NavBar</title>
</head>
<body>
	<div>
		<span>회원가입</span>
		<span>로그인</span>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light" style="background:#BAD7DF;">		
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Navbar</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="#">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">게시판</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">공지사항</a>
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

</body>
</html>