<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<!-- 제이쿼리 (부트스트랩보다 위로) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<style>
th, td {
	text-align: center;
}
</style>
<title>관리자 사이트</title>
</head>
<body>
<%
		Object userID = null;
		if (session.getAttribute("loginUser") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='../login/login'");
			script.println("</script>");
		}else if(session.getAttribute("loginUser") != null) {
			userID = session.getAttribute("loginUser");
		}
	%>
<!-- 네비게이션 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="../index/index.jsp">관리자 페이지</a>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynav1">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="mynav1">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="../bookManage/manage">도서관리</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">대출현황</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="../login/login">대출</a> 
						<a class="dropdown-item" href="../join/join">반납</a>
						<a class="dropdown-item" href="../join/join">예약</a>
					</div>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<%
					if (userID == null) {
				%>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown"> 접속하기 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="../login/login">로그인</a> 
						<a class="dropdown-item" href="../join/join">회원가입</a>
					</div>
				</li>
				<%
					} else {
				%>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown"> 회원관리 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="../login/view">회원정보</a>
						<c:url value="/login/logout" var="logoutUrl" />
						<a class="dropdown-item" href="${logoutUrl }">로그아웃</a>
					</div>
				</li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div>
			<!-- 점보트론 -->
			<div class="jumbotron" style="min-width: 90%;">
				<!-- 도서 검색 결과 -->
				<!-- <c:if test="${empty book }">
				<script>
				alert("정보를 입력해주세요.");
				history.back();
				</script>;
				</c:if> -->
			</div>
		</div>
	</div>
</body>
</html>



