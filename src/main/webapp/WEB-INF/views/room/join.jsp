<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 제이쿼리 (부트스트랩보다 위로) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>관리자 사이트</title>
</head>
<body>
	<!-- 네비게이션 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="../index/index">관리자 페이지</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#mynav1">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="mynav1">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="../bookManage/manage">도서관리</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					data-toggle="dropdown">대출현황</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="../login/login">대출</a> <a
							class="dropdown-item" href="../join/join">반납</a> <a
							class="dropdown-item" href="../join/join">예약</a>
					</div></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					data-toggle="dropdown"> 접속하기 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="../login/login">로그인</a> <a
							class="dropdown-item" href="../join/join">회원가입</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<!-- 로그인 폼 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div>
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<c:url value="/join/join" var="joinUrl" />
				<form method="post" action="${joinUrl }">
					<h3 style="text-align: center;">회원 가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="adminID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="adminpw" maxlength="20">
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form group" style="text-align: center">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-primary active"> 
										<input type="radio" name="adminGender" autocomplete="off" value="M" checked>남자
									</label> <label class="btn btn-primary"> <input type="radio"
										name="adminGender" autocomplete="off" value="F">여자
									</label>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form group" style="text-align: center">
								<div class="form-group">
									<input type="date" class="form-contol" name="adminBirth">
								</div>
							</div>
						</div>
						<br>
					</div>
					<div class="form group">
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="message"></div>
</body>
</html>





















