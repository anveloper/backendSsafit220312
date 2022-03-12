<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String[] movies = { "아이언맨", "쇼생크탈출", "겨울왕국", "범죄도시", "어벤져스" };
	request.setAttribute("movies", movies);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<select>
		<c:forEach begin="0" end="5" items="${movies}" step="1" var="movie" varStatus="varStatus">
			<option>${varStatus.index} ::: ${varStatus.count} ::: ${movie} ::: ${varStatus.first} ::: ${varStatus.last}</option>
		</c:forEach>
	</select>
</body>
</html>