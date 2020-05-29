<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<!-- 제이쿼리 (부트스트랩보다 위로) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<style>
th, td {
	text-align: center;
}
</style>
<!-- <script>
	$(function() {
		$("#pw1, #pw2").keyup(function() {
			var pw1Value = $("#pw1").val();
			var pw2Value = $("#pw2").val();

			if (pw1Value != pw2Value) {
				$("#message").text("패스워드가 일치하지 않습니다.");
			} else {
				$("#message").text("패스워드가 일치합니다.");
			}
		})
	});
</script> -->
<title>관리자 사이트</title>
</head>
<body>
	<%-- <%
		Object userID = null;
		if (session.getAttribute("loginUser") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='../login/login'");
			script.println("</script>");
		} else if (session.getAttribute("loginUser") != null) {
			userID = session.getAttribute("loginUser");
		}
	%> --%>
	<!-- 네비게이션 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="RoomList">공부하랑</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynav1">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- id값으로 위의 navbar-toggler와 묶여짐 (collapse) -->
		<div class="collapse navbar-collapse" id="mynav1">   
			<ul class="navbar-nav mr-auto ml-auto">       <!-- mr -> margin right -->
				<!-- <li class="nav-item active">
					<a class="nav-link" href="#">메뉴1</a>
				</li>
				메뉴 드롭다운
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">드롭다운 메뉴</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">드롭1</a> 
							<a class="dropdown-item" href="#">드롭2</a> 
							<a class="dropdown-item" href="#">드롭3</a>
						</div>
				</li> -->
				<li>
					<form class="form-inline" action="#" method="post">
						<input class="form-control" type="search" placeholder="검색">
						<button class="btn btn-light" type="submit">검색</button>
					</form>
				</li>
			</ul>
			<ul class="navbar-nav">
<%-- 				<%
					if (userID == null) {
				%> --%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">접속하기</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="roomLogin">로그인</a> 
							<a class="dropdown-item" href="roomJoin">회원가입</a>
							<a class="dropdown-item" href="roomInsertGo">방등록</a>
						</div>
				</li>
<%-- 				<%
					} else {
				%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">회원관리</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">마이페이지</a>
							<c:url value="/login/logout" var="logoutUrl" />
							<a class="dropdown-item" href="#">로그아웃</a>
						</div>
				</li>
				<%
					}
				%> --%>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div>
			<!-- 점보트론 -->
			<div class="jumbotron" style="min-width: 100%;">
				<c:forEach items="${list }" var="room">
					<div class="room_box">
						<div class="room_item">
							<label>
								<a href="roomContent?ro_num=${room.ro_num }">
								${room.ro_num }
								<img src="${pageContext.request.contextPath }/upload/${room.ro_img }" alt="img">
								</a>
							</label>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>



