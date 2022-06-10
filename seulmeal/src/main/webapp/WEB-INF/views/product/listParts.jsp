<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<style type="text/css">

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
    	<th>재료순번</th>
        <th>재료명</th>
        <th>재료가격</th>
        <th>재료칼로리</th>
        <th>재료중량</th>
        <th>상태변경</th>
    </tr>
<c:forEach var="parts" items="${list}">    
    <tr>
    	<td>${parts.partsNo} </td>
        <td>${parts.name}</td>
        <td>${parts.price}</td>
        <td>${parts.calorie}</td>
        <td>100</td>
        <td>      </td>
    </tr>
</c:forEach>
</table>
<script type="text/javascript">
</script>
</body>
</html>