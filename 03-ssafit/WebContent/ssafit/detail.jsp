<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
      request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFIT</title>

<link href="/03-ssafit/css/main.css" rel="stylesheet" />
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="header.jsp" flush="false">
		<jsp:param name="pageTitle" value="SSAFIT 영상 상세보기" />
	</jsp:include>
	<!-- 여기서부터 메인 시작 -->
	<main>
	<div class="container">

		<!-- 여기 서치바 넣기(추후) -->
		<!-- 조회수 많은 영상 순 -->
		<div class="container"></div>

		<!-- 부위별 영상 목록 -->
		<div class="container">
			<br>
			<div class="ratio ratio-16x9">
				<iframe src="https://www.youtube.com/embed/${video.youtubeId}"
					title="YouTube video" allowfullscreen></iframe>
			</div>
			<br>
			<div class="h3">영상 리뷰</div>
			<table class="table">
				<tr class="row">
					<th class="col-7">제목 (이동 : click)</th>
					<th class="col-3">작성자</th>
					<th class="col-2">조회수</th>
				</tr>
				<c:forEach var="r" items="${rlist}">
					<tr class="row">
						<td class="col-7"><a
							href="review/detail?youtubeId=${video.youtubeId}&no=${r.no}"
							style="color: black; text-decoration-line: none;"> <c:out
									value="${r.title}" /></a></td>
						<td class="col-3"><c:out value="${r.writer}" /></td>
						<td class="col-2"><c:out value="${r.viewCnt}" /></td>
					</tr>
				</c:forEach>
			</table>

			<div>
				<!-- <a href="/02-board/board/write">글쓰기</a> -->
				<a class="btn btn-secondary"
					href="review/write?youtubeId=${video.youtubeId}">글쓰기</a>
			</div>
			<br>
		</div>
	</div>

	</main>

	<jsp:include page="footer.jsp" flush="false" />


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>