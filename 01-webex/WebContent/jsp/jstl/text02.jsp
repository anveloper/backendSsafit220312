<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="auth" value="U" />
	<c:set var="auth" value="A" />
	<c:if test="${ auth == 'A' }">
		<h2>당신은 관리자입니다.</h2>
	</c:if>
	<c:if test="${ auth == 'U' }">
		<h2>당신은 일반 사용자입니다.</h2>
	</c:if>
	
</body>
</html>