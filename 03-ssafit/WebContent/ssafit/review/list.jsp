<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlet Board List JSP</title>

<link rel="stylesheet" href="/02-board/css/font.css">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2>SSAFY 게시판 글 목록</h2>
		<table class="table">
			<tr class="row">
				<th class="col-1">번호</th>
				<th class="col-7">제목 (이동 : click)</th>
				<th class="col-2">작성자</th>
				<th class="col-2">조회수</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<tr class="row">
					<td class="col-1"><c:out value="${b.no}" /></td>
					<td class="col-7"><a href="detail?no=${b.no}"
						style="color: black; text-decoration-line: none;">
						<c:out value="${b.title}" /></a></td>
					<td class="col-2"><c:out value="${b.writer}" /></td>
					<td class="col-2"><c:out value="${b.viewCnt}" /></td>
				</tr>
			</c:forEach>
		</table>

		<div>
			<!-- <a href="/02-board/board/write">글쓰기</a> -->
			<a class="btn btn-secondary" href="write">글쓰기</a>
		</div>

	</div>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>