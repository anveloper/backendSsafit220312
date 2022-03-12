<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!String msg = "선언문 멤버변수";

	public String call() {
		return "call 호출됨";
	}%>
	<%
		for (int i = 1; i <= 10; i++) {
	%>
	<%=i%><br>
	<%=call()%><br>
	<%
		}
	%>
	<%-- JSP 주석문 --%>
	<%
		// JAVA 주석문
	%>
	<!-- HTML주석문 -->
</body>
</html>