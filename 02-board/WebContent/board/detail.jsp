<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlet Board Write JSP</title>

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
		<h2>SSAFY 게시판 글보기</h2>
		<form>
			<div class="container">
				<div class="row">
					<label class="col-3">제목</label>
					<div class="col-9">
						<c:out value="${board.title}" />
					</div>
				</div>
				<div class="row">
					<label class="col-3">작성자</label>
					<div class="col-9">
						<c:out value="${board.writer}" />
					</div>
				</div>
				<div class="row">
					<label>내용</label>
					<div style="border: 1px solid; width: 800px; height: 250px;">
						<c:out value="${board.content}" />
					</div>
				</div>
				<div style="padding-top: 10px;">
					<a class="btn btn-secondary" href='update?no=${board.no}'">수정</a> <a
						class="btn btn-secondary" onclick="deleteConfirm()">삭제</a> <a
						class="btn btn-secondary" href='list'">돌아가기</a>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function deleteConfirm() {
			if (!confirm("삭제 하시겠습니까?"))
				return false;
			else
				location.href = "delete?no=${board.no}";
		}
	</script>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>