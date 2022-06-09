<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>커스터마이징상품 등록</title>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>

	<jsp:include page="../layer/header.jsp"></jsp:include>
	<form action="/operation/insertOperation" method="POST" enctype="multipart/form-data">
		<input type="text" name="name"/>${product.name}
		<input type="text" name="price" />${product.price}
		
		<c:set var="i" value="0" />
		<c:forEach var="purchase" items="${list}">
		<tr class="ct_list_pop">
			<td align="center">${productParts.name}</a></td>
			<td></td>
			<td align="left">1</td>
			<td></td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
          <input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:20px" > 
      </td>


		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetUserList('1');">검색</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
	
		<input type="text" name="price" value="${product.price}+parts.price" /> 
		
		<input type="hidden" name="cartStatus" value="0" />
		<button type="submit">바로구매하기</button>
		<input type="hidden" name="cartStatus" value="1" />
		<button type="submit">장바구니담기</button>
	</form>
	<jsp:include page="../layer/footer.jsp"></jsp:include>	
 	
</body>
</html>