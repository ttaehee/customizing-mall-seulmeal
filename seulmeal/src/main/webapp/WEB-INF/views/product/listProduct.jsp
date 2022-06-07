<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>상품목록</title>
<style type="text/css">
	.b-example-divider {
	  height: 3rem;
	  background-color: rgba(0, 0, 0, .1);
	  border: solid rgba(0, 0, 0, .15);
	  border-width: 1px 0;
	  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
	}
	
	.bi {
	  vertical-align: -.125em;
	  fill: currentColor;
	}
	
	.feature-icon {
	  display: inline-flex;
	  align-items: center;
	  justify-content: center;
	  width: 4rem;
	  height: 4rem;
	  margin-bottom: 1rem;
	  font-size: 2rem;
	  color: #fff;
	  border-radius: .75rem;
	}
	
	.icon-link {
	  display: inline-flex;
	  align-items: center;
	}
	.icon-link > .bi {
	  margin-top: .125rem;
	  margin-left: .125rem;
	  transition: transform .25s ease-in-out;
	  fill: currentColor;
	}
	.icon-link:hover > .bi {
	  transform: translate(.25rem);
	}
	
	.icon-square {
	  display: inline-flex;
	  align-items: center;
	  justify-content: center;
	  width: 3rem;
	  height: 3rem;
	  font-size: 1.5rem;
	  border-radius: .75rem;
	}
	
	.rounded-4 { border-radius: .5rem; }
	.rounded-5 { border-radius: 1rem; }
	
	.text-shadow-1 { text-shadow: 0 .125rem .25rem rgba(0, 0, 0, .25); }
	.text-shadow-2 { text-shadow: 0 .25rem .5rem rgba(0, 0, 0, .25); }
	.text-shadow-3 { text-shadow: 0 .5rem 1.5rem rgba(0, 0, 0, .25); }
	
	.card-cover {
	  background-repeat: no-repeat;
	  background-position: center center;
	  background-size: cover;
	}
	
	.bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
</style>
</head>
<body>
<jsp:include page="../layer/header.jsp"></jsp:include>
	<div class="row">
		<div class="col-2"></div>
		<c:forEach var="product" items="${list}">
			<div class="col-2">
				<div style="width:200px; height:200px;">${product.thumbnail}</div>
				<div><h3><a href="/product/getProduct/${product.productNo}">${product.name}</a></h3></div>
				<div>
					<span>${product.price}</span>
				</div>
				<div>${product.subContent}</div>
				<div>
					<c:forEach var="parts" items="${product.parts}">							
						<span>${parts.name}</span>					
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="container px-4 py-5" id="custom-cards">
    <h2 class="pb-2 border-bottom">Custom cards</h2>

    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
      <div class="col">
        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('../../resources/attachments/image/tetris.png');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Short title, long jacket</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"/></svg>
                <small>Earth</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                <small>3d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('unsplash-photo-2.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Much longer title that wraps to multiple lines</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"/></svg>
                <small>Pakistan</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                <small>4d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('unsplash-photo-3.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Another longer title belongs here</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"/></svg>
                <small>California</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                <small>5d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>
      
      <div class="col">
        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('unsplash-photo-2.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Much longer title that wraps to multiple lines</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"/></svg>
                <small>Pakistan</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                <small>4d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>
      
      <div class="col">
        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('unsplash-photo-2.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Much longer title that wraps to multiple lines</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"/></svg>
                <small>Pakistan</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                <small>4d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>
      
    </div>
  </div>
	
					
	
	
<jsp:include page="../layer/footer.jsp"></jsp:include>
</body>
</html>