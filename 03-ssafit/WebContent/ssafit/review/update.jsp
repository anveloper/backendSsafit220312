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
	<jsp:include page="../header.jsp" flush="false">
		<jsp:param name="pageTitle" value="SSAFIT 리뷰 수정" />
	</jsp:include>
	<!-- 여기서부터 메인 시작 -->
	<div class="container">
		<form method="post"
			action="/03-ssafit/ssafit/review/update?youtubeId=${youtubeId}&no=${review.no}">
			<div class="container">
				<div class="form-floating">
					<textarea class="form-control" name="title" id="floatingTextarea1"><c:out
							value="${review.title}" /></textarea>
					<label for="floatingTextarea1">제목</label>
				</div>
				<div class="form-floating">
					<textarea class="form-control" name="writer" id="floatingTextarea2"><c:out
							value="${review.writer}" /></textarea>
					<label for="floatingTextarea2">작성자</label>
				</div>

				<div class="form-floating">
					<textarea class="form-control" style="height: 400px" name="content"
						id="floatingTextarea3"><c:out value="${review.content}" /></textarea>
					<label for="floatingTextarea3">내용</label>
				</div>
				<div style="padding-top: 10px;">
					<button class="btn btn-secondary">등록</button>
				</div>
			</div>
		</form>
	</div>
	
	<jsp:include page="../footer.jsp" flush="false" />
	
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>