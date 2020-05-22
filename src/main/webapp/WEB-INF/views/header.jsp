<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<html>
<body>
	<nav class="navbar bg-dark navbar-dark">
		<!-- Brand/logo -->
		<a class="navebar-brand" href="main"><h2>공부하랑</h2></a>
		<!-- 검색창 -->
		<form class="form-inline" action="#">
			<input class="form-control mr-sm-2" type="text" placeholder="검색어">
			<button class="btn btn-success" type="submit"><a href="searchList">검색</a></button>
		</form>
		<!-- 메뉴 -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">

			<!-- 메인 메뉴 -->
			<ul class="navbar-nav navbar-dark">
				<li class="nav-item active"><a class="nav-link" href="#">로그인/회원가입</a></li>
				<li class="nav-item active"><a class="nav-link" href="boardList">공지사항&스터디모집</a></li>
				<li class="nav-item active"><a class="nav-link" href="#">Q&A</a></li>
				<li class="nav-item active"><a class="nav-link" href="#">마이페이지</a></li>
				<li class="nav-item active"><a class="nav-link" href="#">방등록하기(사업자)</a></li>
			</ul>
	</nav>
</body>
</html>