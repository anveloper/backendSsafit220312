<%@page import="com.ssafy.dto.Count"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set scope="request" var="name" value="ssafy" />
	<!-- request.setAttribute("name", "ssafy");와 같은 의미 -->
	<c:set var="user1" value="<%=new com.ssafy.dto.Count()%>" />
	<c:set target="${user1}" property="num" value="1223"></c:set>
	<!-- 객체를 밸류로 설정하고, 해당 멤버변수에 값을 부여 -->
</body>
</html>