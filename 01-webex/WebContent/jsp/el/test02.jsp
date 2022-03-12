<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL 연산자</h2>
	<hr>
	<div>"100" + "200" : ${"100" + "200"}</div>
	<!-- 문자열 + 연산이 안된다..  -->
	<div>"hello "+= "ssafy" : ${"hello "+= "ssafy"}</div>
</body>
</html>