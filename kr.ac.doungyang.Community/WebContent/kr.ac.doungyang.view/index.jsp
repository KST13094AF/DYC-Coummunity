<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<c:choose>
	<c:when test="${empty userId}">
		<jsp:forward page="login.do"/>
	</c:when>
	<c:when test="${!empty userId}">
		<jsp:forward page="main.jsp"/>
	</c:when>
</c:choose>
</body>
</html>