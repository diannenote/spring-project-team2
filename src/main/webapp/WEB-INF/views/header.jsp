<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<html>
<body>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
		<a class="navebar-brand" href="/s20200502/main">공부하랑</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav mr-auto ml-auto">
			<li>
				<form class="form-inline" action="/s20200502/listSearch" method="GET">
					<input class="form-control" type="text" name="keyword" value="${keyword}" placeholder="검색어">
					<input class="btn btn-success" type="submit" value="검색">
				</form>
			</li>
		</ul>
			<!-- 메인 메뉴 -->
			<ul class="navbar-nav navbar-dark">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">메뉴</a>
					<div class="dropdown-menu ml-auto">
						<a class="dropdown-item" href="/s20200502/loginForm">로그인/회원가입</a>
						<a class="dropdown-item" href="/s20200502/roomList">방 검색</a>
						<a class="dropdown-item" href="/s20200502/board/boardList">공지사항&스터디그룹</a>
						<a class="dropdown-item" href="#">Q&A</a>
						<a class="dropdown-item" href="myInfo">마이페이지</a>
						<a class="dropdown-item" href="roomInsertGo">방등록하기(사업자)</a>
						<a class="dropdown-item" href="levelList">방승인(사업자)</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>