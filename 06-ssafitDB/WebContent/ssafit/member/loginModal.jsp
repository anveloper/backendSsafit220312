<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="login" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">로그인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="loginForm" name="loginForm" method="post"
						action="member/login">
						<div class="row mb-3">
							<label for="loginId" class="col-sm-2 col-form-label">ID</label>
							<div class="col-sm-10">
								<input type="id" class="form-control" id="loginId" name="userId">
							</div>
							<div id="loginIdMsg" style="color: red;"></div>
						</div>
						<div class="row mb-3">
							<label for="loginPassword" class="col-sm-2 col-form-label">P/W</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="loginPassword"
									name="password">
							</div>
							<div id="loginPwMsg" style="color: red;"></div>
						</div>
						<div class="row mb-3">
							<div class="col-sm-10 offset-sm-2">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="saveIdBtn"
										name="checkId"> <label class="form-check-label"
										for="saveIdBtn"> 아이디 저장 </label>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button id="loginBtn" type="button" class="btn btn-dark"
						onclick="sendIt()">로그인</button>
				</div>
			</div>
		</div>
	</div>
	<script src="/03-ssafit/js/userLogin.js"></script>
</body>
</html>