<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		param(id) :	<%=request.getParameter("id")%>
	</div>
	<div>param(id) : ${param.id }</div>
</body>
</html>