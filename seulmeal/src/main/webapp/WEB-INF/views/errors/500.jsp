<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>500 Error</h1>
	<p>request_uri : <c:out value="${requestScope['javax.servlet.error.request_uri']}"/></p>
    <p>status_code : <c:out value="${requestScope['javax.servlet.error.status_code']}"/></p>
    <p>servlet_name : <c:out value="${requestScope['javax.servlet.error.servlet_name']}"/></p>
    <p>exception : <c:out value="${requestScope['javax.servlet.error.exception']}"/></p>
    <p>servlet_name : <c:out value="${requestScope['javax.servlet.error.servlet_name']}"/></p>
    <p>message : <c:out value="${requestScope['javax.servlet.error.message']}"/></p>
</body>
</html>