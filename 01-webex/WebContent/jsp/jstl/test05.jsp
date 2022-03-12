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
	<c:set var="msg" value="<h2>hello</h2>" />
	<div>${msg}</div>
	<hr>
	<div>
		<c:choose>
			<c:when test="${empty msg}">
				메세지가 없습니다.
			</c:when>
			<c:otherwise>${msg}</c:otherwise>
		</c:choose>
	</div>
	<div><!-- null이면 default값을 출력한다. -->
		<c:out value="${msg}" default="메세지가 없다요."/>
		<!-- 주어진 텍스트를 그대로 텍스트로 출력해야한다. 사용자 접근 제한 -->
	</div>
</body>
</html>