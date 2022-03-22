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
		<jsp:param name="pageTitle" value="SSAFIT 리뷰 상세보기" />
	</jsp:include>

	<!-- 여기서부터 메인 시작 -->
	<div class="container">
		<form>
			<div class="container">
				<div class="form-floating">
					<textarea class="form-control" placeholder="Leave a comment here"
						id="floatingTextarea" name="title" disabled readonly></textarea>
					<label for="floatingTextarea"><c:out
							value="제목 : ${review.title}" /></label>
				</div>
				<div class="form-floating">
					<textarea class="form-control" placeholder="Leave a comment here"
						id="floatingTextarea" name="userId" disabled readonly></textarea>
					<label for="floatingTextarea"><c:out
							value="작성자 : ${review.userId}" /></label>
				</div>

				<div class="form-floating">
					<textarea class="form-control" placeholder="Leave a comment here"
						id="floatingTextarea2" style="height: 400px" name="content"
						disabled readonly></textarea>
					<label for="floatingTextarea2"><c:out
							value="${review.content}" /></label>
				</div>

				<div style="padding-top: 10px;">
					<input name="youtubeId" value="${review.youtubeId}" hidden/>
					<a class="btn btn-secondary"
						href="review?act=updateForm&reviewNo=${review.reviewNo}">수정</a> <a
						class="btn btn-secondary" onclick="deleteConfirm()">삭제</a> <a
						class="btn btn-secondary"
						href="/06-ssafitDB/ssafit/main?act=detail&youtubeId=${review.youtubeId}">돌아가기</a>
				</div>
				<br>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function deleteConfirm() {
			if (!confirm("삭제 하시겠습니까?"))
				return false;
			else
				location.href = "review?act=delete&reviewNo=${review.reviewNo}";
		}
	</script>

	<jsp:include page="../footer.jsp" flush="false" />

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>