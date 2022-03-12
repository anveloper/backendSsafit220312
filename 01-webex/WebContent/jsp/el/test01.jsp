<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>연산자</h2>
	<hr>
	<div>
		5 + 5 =
		<%=5 + 5%>
	</div>
	<div>5 + 5 = ${ 5 + 5 }</div>
	<hr>
	<div>
		5 == 5 :
		<%=5 == 5%>
	</div>
	<div>5 == 5 : ${ 5 == 5 }</div>
	<div>5 == 5 : ${ 5 eq 5 }</div>
	<hr>
	<div>5 > 5 : ${ 5 > 5 }</div>
	<div>5 > 5 : ${ 5 gt 5 }</div>
	<hr>
	<div>empty "a" : ${empty "a" }</div>
	<div>empty "" : ${empty "" }</div>
	<div>empty !"" : ${!empty "" }</div>
	<div>empty !"" : ${not empty "" }</div>
</body>
</html>