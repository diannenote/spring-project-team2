<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 (부트스트랩보다 위로) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>관리자 사이트</title>

</head>
<body>
	<%
		Object userID = null;
		if (session.getAttribute("loginUser") != null) {
			userID = session.getAttribute("loginUser");
		}
	%>
	<!-- 네비게이션 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="RoomMain">공부하랑</a>
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
				<%
					if (userID == null) {
				%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">접속하기</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="roomLogin">로그인</a> 
							<a class="dropdown-item" href="roomJoin">회원가입</a>
							<a class="dropdown-item" href="roomInsertGo">방등록</a>
						</div>
				</li>
				<%
					} else {
				%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">회원관리</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">마이페이지</a>
							<%-- <c:url value="/login/logout" var="logoutUrl" /> --%>
							<a class="dropdown-item" href="#">로그아웃</a>
						</div>
				</li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>


	<div class="container">
		<!-- 점보트론 -->
		<div class="jumbotron" style="padding-top: 20px; margin-top: 30px;">
			<!-- 도서 검색 post -->
			<form method="post" action="#">
				<h3 style="text-align: center;">스터디룸 검색</h3>
				<div class="form-group">
					<input type="text" class="form-control"
						placeholder="이름 / 지역" name="item" maxlength="30">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="검색">
			</form>
		</div>
	</div>
	<div class="container">
		<div class="jumbotron" style="padding-top: 20px; margin-top: 30px;">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3 style="text-align: center">주간 인기 스터디룸</h3><br>
					</div>
					<div class="col-sm-offset-0 col-sm-1"></div>
					<c:forEach items="${books }" var="book">
						<div class="col-md-2">
							<img src="${book.bookImageURL }" width="100px" height="150px"><br>
							${book.bookName }<br> ${book.authors }<br>
							${book.publisher }<br>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
			<div id="piechart1" style="width: 700px; height: 350px;"></div>
			</div>
			<div class="col-md-6">
			<div id="piechart2" style="width: 700px; height: 350px;"></div>	
			</div>
		</div>
	</div>

</body>
</html>



