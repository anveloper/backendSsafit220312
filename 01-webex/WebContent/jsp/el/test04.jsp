<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("msg", "page 공유 msg");
	request.setAttribute("msg", "request 공유 msg");
	request.setAttribute("id", "request 공유 id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		page msg : ${pageScope.msg }<br> page msg : ${msg }<br>
	</div>
	<div>
		request id : ${requestScope.id }<br> request id : ${id }<br>
	</div>
	<div>
		page msg : ${msg }<br> request msg : ${requestScope.msg }<br>
	</div>
</body>
</html>