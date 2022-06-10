<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<style>
    table, th, tr, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
        
    th, td {
        padding: 15px;
    }
        
    td {
        text-align: center;
    }
</style>
</head>
<body>


<table>
	<tr>
    	<th>음식 카테고리 순번</th>
        <th>음식 카테고리명</th>
        <th>상태</th>
    </tr>
<c:forEach var="foodCategory" items="${list}">    
    <tr>
    	<td>${foodCategory.foodCategoryNo} </td>
        <td>${foodCategory.name}</td>
        <td>${foodCategory.status}</td>
    </tr>
</c:forEach>
</table>

<script type="text/javascript">

</script>
</body>
</html>