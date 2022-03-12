<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2>SSAFY 게시판 글쓰기</h2>
		<form method="post" action="/02-board/board/write">
			<div class="container">
				<div class="row">
					<label class="col-3">제목</label> <input class="col-9" type="text"
						name="title" />
				</div>
				<div class="row">
					<label class="col-3">작성자</label> <input class="col-9" type="text"
						name="writer" />
				</div>
				<div class="row">
					<label>내용</label>
					<textarea name="content" rows="7" cols="80"></textarea>
				</div>
				<div style="padding-top: 10px;">
					<button class="btn btn-secondary">등록</button>
				</div>
			</div>
		</form>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>