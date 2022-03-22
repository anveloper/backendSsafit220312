<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<%@ include file="/common/header.jsp" %>
</head>
<body>
	<div class="container">
	<h2>글 상세보기</h2>
	<hr>
	<form action="board" method="POST">
			<div class="mb-3">
			  <label for="title" class="form-label">글제목</label>
			  <input type="text" class="form-control" id="title" name="title" readonly value="${board.title}">
			</div>
			<div class="mb-3">
			  <label for="writer" class="form-label">글쓴이</label>
			  <input type="text" class="form-control" id="writer" name="writer" readonly value="${board.writer}">
			</div>
			<div class="mb-3">
			  <label for="content" class="form-label">글내용</label>
			  <textarea class="form-control" id="content" name="content" rows="10" readonly><c:out value="${board.content}"/></textarea>
			</div>
			<a class="btn btn-secondary" href ="board?act=updateform&id=${board.id}">수정</a>
			<a class="btn btn-secondary" href ="board?act=delete&id=${board.id}">삭제</a>
			<a class="btn btn-secondary" href ="board?act=list">목록</a>
		</form>
	</div>
</body>
</html>