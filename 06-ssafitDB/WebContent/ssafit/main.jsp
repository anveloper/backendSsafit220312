<%@ page import="com.ssafit.model.Member"%>
<%@ page import="com.ssafit.model.Video"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	session.setAttribute("logonMember", (Member) request.getAttribute("logonMember"));

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
	<jsp:include page="header.jsp" flush="false">
		<jsp:param name="pageTitle" value="SSAFIT" />
	</jsp:include>
	<jsp:include page="slide.jsp" flush="false" />	
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
						id="btnradio1" autocomplete="off" value="전신">
					<!--  -->
					<label class="btn btn-outline-secondary" for="btnradio1">전신</label>
					<!--  -->
					<input type="radio" class="btn-check" name="btnradio"
						id="btnradio2" autocomplete="off" value="상체">
					<!--  -->
					<label class="btn btn-outline-secondary" for="btnradio2">상체</label>
					<!--  -->
					<input type="radio" class="btn-check" name="btnradio"
						id="btnradio3" autocomplete="off" value="하체">
					<!--  -->
					<label class="btn btn-outline-secondary" for="btnradio3">하체</label>
					<input type="radio" class="btn-check" name="btnradio"
						id="btnradio4" autocomplete="off" value="복부">
					<!--  -->
					<label class="btn btn-outline-secondary" for="btnradio4">복부</label>
				</div>
			</div>

			<!-- 버튼 밸류에 따라 전신 : wlist, 상체 : ulist, 하체 : llist 바꾸기 -->
			<div class="d-flex justify-content-start flex-row overflow-auto"
				id="fitPart">
				<c:forEach var="v2" items="${wlist}">
					<div class="p-2 w-380" style="width: 390px;">
						<div>
							<iframe width="380" height="230"
								src="https://www.youtube.com/embed/${v2.youtubeId}"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
						<div class="row" style="width: 380px;">
							<a class="col video-title"
								href="detail?youtubeId=${v2.youtubeId}">${v2.title}</a>
						</div>
					</div>
				</c:forEach>
			</div>

			<br>
		</div>
	</div>

	</main>
	<jsp:include page="footer.jsp" flush="false" />

	<script src="/03-ssafit/js/selectPart.js">/* js로 만들어둠 아래 실행 안됨*/		
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