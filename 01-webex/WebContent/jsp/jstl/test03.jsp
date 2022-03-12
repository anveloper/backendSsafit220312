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
	<c:set var="menu" value="1" />
	<c:choose>
		<c:when test="${ menu == 1 }">
			<c:out value="한식" />
		</c:when>
		<c:when test="${ menu == 2 }">
			<c:out value="중식" />
		</c:when>
		<c:when test="${ menu == 3 }">
			<c:out value="양식" />
		</c:when>
		<c:otherwise>
			<c:out value="잡식" />
		</c:otherwise>
	</c:choose>
</body>
</html>