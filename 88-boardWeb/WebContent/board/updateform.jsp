<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<%@ include file="/common/header.jsp"%>
</head>
<body>
	<div class="container">
		<h2>글 수정하기</h2>
		<hr>
		<form action="board" method="POST">
			<input type="hidden" name="act" value="update">
			<input type="hidden" name="id" value="${board.id}">			
			<div class="mb-3">
				<label for="title" class="form-label">글제목</label> <input type="text"
					class="form-control" id="title" name="title" value="${board.title}">
			</div>
			<div class="mb-3">
				<label for="writer" class="form-label">글쓴이</label> <input
					type="text" class="form-control" id="writer" name="writer"
					value="${board.writer}" readonly>
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">글내용</label>
				<textarea class="form-control" id="content" name="content" rows="10"><c:out
						value="${board.content}" /></textarea>
			</div>
			<button class="btn btn-secondary">등록</button>
			<a class="btn btn-secondary" href ="board?act=list">목록</a>
		</form>
</body>
</html>