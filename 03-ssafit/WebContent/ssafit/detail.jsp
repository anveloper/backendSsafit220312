<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<!-- 메인 네비게이션 -->
	<div class="container">
		<header
			class="d-flex align-items-end justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
			<a href="main"
				class="d-flex align-items-center   text-dark text-decoration-none">
				<h1>SSAFIT 상세보기</h1>
			</a>

			<div class=" d-flex flex-row justify-content-end">
				<div class="p-2">
					<button type="button" class="btn btn-outline-secondary me-2"
						data-bs-toggle="modal" data-bs-target="#staticBackdropLogin">로그인</button>
				</div>
				<div class="p-2">
					<button type="button" class="btn btn-secondary"
						data-bs-toggle="modal" data-bs-target="#staticBackdropSighIn">회원가입</button>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdropLogin"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">로그인</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class="row mb-3">
									<label for="email-login" class="col-sm-2 col-form-label">ID</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" id="email-login">
									</div>
								</div>
								<div class="row mb-3">
									<label for="password-login" class="col-sm-2 col-form-label">P/W</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											id="password-login">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-10 offset-sm-2">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="gridCheck1"> <label class="form-check-label"
												for="gridCheck1"> 아이디 저장 </label>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-dark">로그인</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdropSighIn"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">회원가입</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class="row mb-3">
									<label for="email-signin" class="col-sm-2 col-form-label">ID</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" id="email-signin"
											placeholder="example@html.com">
									</div>
								</div>
								<div class="row mb-3">
									<label for="password-signin" class="col-sm-2 col-form-label">P/W</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											id="password-signin">
									</div>
								</div>

								<div class="row mb-3">
									<label for="passwordc-signin" class="col-sm-2 col-form-label">P/W
										confirm</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											id="passwordc-signin">
									</div>
								</div>

								<div class="row mb-3">
									<label for="name-signin" class="col-sm-2 col-form-label">닉네임</label>
									<div class="col-sm-10">
										<input type="name" class="form-control" id="name-signin">
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-dark">회원가입</button>
						</div>
					</div>
				</div>
			</div>

		</header>
	</div>
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
						<td class="col-7"><a href="review/detail?no=${r.no}"
							style="color: black; text-decoration-line: none;"> <c:out
									value="${r.title}" /></a></td>
						<td class="col-3"><c:out value="${r.writer}" /></td>
						<td class="col-2"><c:out value="${r.viewCnt}" /></td>
					</tr>
				</c:forEach>
			</table>
			
			<div>
				<!-- <a href="/02-board/board/write">글쓰기</a> -->
				<a class="btn btn-secondary" href="review/write">글쓰기</a>
			</div>
			<br>
		</div>
	</div>

	</main>

	<div>
		<footer>
			<!-- 정보 -->
			<ul>
				<li><a href="">개인정보처리방침</a></li>
				<li><a href="">이용약관</a></li>
				<li><a href="">오시는길</a></li>
				<li>ⓒ SSAFY SSAFIT_JAVA_대전_4반_4팀_박범수_안성진</li>
			</ul>
		</footer>
	</div>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>