<%@ page import="com.ssafit.model.Member"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pageTitle = request.getParameter("pageTitle");
	if (session.getAttribute("logonMember") != null) {
		Member member = (Member) session.getAttribute("logonMember");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 메인 네비게이션 -->
	<div class="container">
		<header
			class="d-flex align-items-end justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
			<a href="/06-ssafitDB/ssafit/main"
				class="d-flex align-items-center   text-dark text-decoration-none">
				<h1><%=pageTitle%></h1>
			</a>

			<c:if test="${sessionScope.logonMember==null }">
				<!-- 로그인/회원가입 -->
				<div id="logoutHeader">
					<div class=" d-flex flex-row justify-content-end"">
						<div class="p-2">
							<button type="button" class="btn btn-outline-secondary me-2"
								data-bs-toggle="modal" data-bs-target="#login">로그인</button>
						</div>
						<div class="p-2">
							<button type="button" class="btn btn-secondary"
								data-bs-toggle="modal" data-bs-target="#sighIn">회원가입</button>
						</div>
					</div>
					<jsp:include page="member/loginModal.jsp" flush="false" />
					<jsp:include page="member/joinModal.jsp" flush="false" />
				</div>
			</c:if>
			<c:if test="${sessionScope.logonMember!=null }">
				<!-- 로그아웃/마이페이지 style="display: none;" -->
				<div id="logonHeader">
					<div class=" d-flex flex-row justify-content-end">
						<div class="p-2">
							<button type="button" class="btn btn-outline-secondary me-2"
								onclick="logout()">로그아웃</button>
						</div>
						<div class="p-2">
							<button type="button" class="btn btn-secondary" data-bs-toggle=""
								data-bs-target="#mypage">${logonMember.nickname}</button>
						</div>
						<!-- data-bs-toggle="modal" -->
					</div>

					<jsp:include page="member/mypageModal.jsp" flush="false" />
				</div>
			</c:if>
		</header>
	</div>
</body>
</html>