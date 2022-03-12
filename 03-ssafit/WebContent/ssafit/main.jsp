<%@ page import="com.ssafit.model.Video"%>
<%@ page import="java.util.List"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
	<!-- 메인 네비게이션 -->
	<div class="container">
		<header
			class="d-flex align-items-end justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
			<a href="#"
				class="d-flex align-items-center   text-dark text-decoration-none">
				<h1>SSAFIT</h1>
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
	<!-- 메인화면 배너 슬라이드 -->
	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel" style="height: 450px; overflow: hidden;">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://cdn.mindgil.com/news/photo/202006/69358_3455_1528.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="https://www.ftimes.kr/news/photo/202110/13399_15007_15.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="https://i0.wp.com/pusyap.com/wp-content/uploads/2020/02/%EC%9A%B4%EB%8F%99_%EC%9E%98%EB%AA%BB%EB%90%9C-%EC%83%9D%EA%B0%81.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- 여기서부터 메인 시작 -->
	<main>
	<div class="container">

		<!-- 여기 서치바 넣기(추후) -->

		<div class="container">
			<br>

			<div class="h3">최근 가장 많이 본 영상</div>
			<div class="d-flex flex-row overflow-auto ">
				<c:forEach var="v" items="${requestScope.ilist}">
					<div class="p-2 " style="width: 390px;">
						<div>
							<iframe width="380" height="230"
								src="https://www.youtube.com/embed/${v.youtubeId}"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
						<div class="row">
							<a class="col-10 video-title"
								href="detail?youtubeId=${v.youtubeId}">${v.title}</a>
							<div class="col-2 text-end">
								<i class="bi bi-eye"></i> ${v.viewCnt}
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<br>

			<!-- 버튼 기능 아직 못만듬.(현재 하체로 선택된 목록 뜸) AJAX 도전 예정 -->
			<div class="h3">
				운동 부위 선택
				<div class="btn-group" role="group"
					aria-label="Basic radio toggle button group" id="partSelect">
					<!--  -->
					<input type="radio" class="btn-check" name="btnradio"
						id="btnradio1" autocomplete="off" value="wlist">
					<!--  -->
					<label class="btn btn-outline-secondary" for="btnradio1">전신</label>
					<!--  -->
					<input type="radio" class="btn-check" name="btnradio"
						id="btnradio2" autocomplete="off" value="ulist">
					<!--  -->
					<label class="btn btn-outline-secondary" for="btnradio2">상체</label>
					<!--  -->
					<input type="radio" class="btn-check" name="btnradio"
						id="btnradio3" autocomplete="off" value="llist">
					<!--  -->
					<label class="btn btn-outline-secondary" for="btnradio3">하체</label>
				</div>
			</div>

			<!-- 버튼 밸류에 따라 전신 : wlist, 상체 : ulist, 하체 : llist 바꾸기 -->
			<div class="d-flex justify-content-start flex-row overflow-auto" id="fitPart">
				<c:forEach var="v2" items="${ulist}">
					<div class="p-2 w-380" style="width: 390px;">
						<div>
							<iframe width="380" height="230"
								src="https://www.youtube.com/embed/${v2.youtubeId}"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
						<div class="row" style="width: 380px;">
							<a class="col video-title" href="detail?youtubeId=${v2.youtubeId}">${v2.title}</a>
						</div>
					</div>
				</c:forEach>
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

	<script>
				document.getElementsByName("btnradio").forEach(btn => btn.addEventListener('click',()=>{
					console.log(btn.value);
					console.log("\${"+btn.value+"}");
					document.getElementById("fitPart").firstChild.items = "\${"+btn.value+"}";
					/* $('#fitPart').load(location.href+' #fitPart'); */
					/* selectPart(btn.value); */
				}));
				// AJAX 연습..
				function selectPart(fitPart) {
					let xhr = new XMLHttpRequest();
					xhr.onreadystatechange = () => {
						if (xhr.readyState == 4 && xhr.status == 200) {
							let part = "wlist";
							console.log(xhr.responseText);
							if(xhr.responseText=='wlist'){
								part = "wlist";
							} else if(xhr.responseText=='ulist'){
								part = "ulist";
							} else if(xhr.responseText=='llist'){
								part = "llist";
							}	
							document.getElementById("fitPart").firstChild.items = "\${"+part+"}";
							console.log(document.getElementById("fitPart").firstChild.items)
							$('#fitPart').load(location.href+' #fitPart');
						}
					}
					xhr.open("GET", "selectpart?fitPart=" + fitPart);
					xhr.send(null);					
				};
			</script>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>