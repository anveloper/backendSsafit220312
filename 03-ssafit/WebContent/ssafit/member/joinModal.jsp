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
	<div class="modal fade" id="sighIn" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">회원가입</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- post형식으로 전송 -->
					<form id="joinForm" method="post"
						action="/03-ssafit/ssafit/member/join">
						<!-- ID 4자 이상, 소문자/숫자만 사용, 중복확인 기능 만들기 -->
						<div class="row mb-3">
							<label for="signinId" class="col-sm-2 col-form-label">ID</label>
							<div class="col-sm-10">
								<input type="id" class="form-control" name="userId"
									id="signinId" placeholder="(영문 소문자, 숫자 5~16자)">
							</div>
							<div id="idCheckMsg" style="color: red;"></div>
						</div>

						<!-- PW 최소길이 체크하기 -->
						<div class="row mb-3">
							<label for="signinPassword" class="col-sm-2 col-form-label">P/W</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="password"
									id="signinPassword" readonly>
							</div>
							<div id="passCheckMsg" style="color: red;"></div>
						</div>

						<!-- PWc랑 PW와 같은 지 체크하기 -->
						<div class="row mb-3">
							<label for="signinPasswordc" class="col-sm-2 col-form-label">P/W
								confirm </label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="signinPasswordc"
									readonly>
							</div>
							<div id="passCCheckMsg" style="color: red;"></div>
						</div>
						<!-- id확인과 같은 매커니즘으로 진행, 회원가입 버튼 활성화 -->
						<div class="row mb-3">
							<label for="signinNickname" class="col-sm-2 col-form-label">닉네임</label>
							<div class="col-sm-10">
								<input type="name" class="form-control" name="nickname"
									id="signinNickname" readonly>
							</div>
							<div id="nameCheckMsg" style="color: red;"></div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button id="joinSubmit" form="joinForm" type="submit"
						class="btn btn-dark" disabled="disabled">회원가입</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 가입 가능한 지 확인 js -->
	<script type="text/javascript" src="/03-ssafit/js/joinCheck.js"></script>

</body>
</html>