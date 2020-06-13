<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<html>
<style>
.form-inline .form-control {
width: 40vw;
}
#gongback {
height: 70px;
}
#navbg {
	background-color: white;
}

/* .navbar {
	border-bottom: solid 1px #0275d8;
} */
</style>
<body>
	<nav class="navbar fixed-top navbar-expand-lg navbar-light" id="navbg">
		<a class="navebar-brand" href="/s20200502/main"><img class="logoimg" alt="brand" src="/s20200502/resources/Image/harang5.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav mr-auto ml-auto">
			<li>
				<form class="form-inline" action="/s20200502/listSearch" method="GET">
					<input class="form-control" type="text" name="keyword" value="${keyword}" placeholder="검색어">
					<input class="btn btn-primary" type="submit" value="검색">
				</form>
			</li>
		</ul>
			<!-- 메인 메뉴 -->
			<ul class="navbar-nav navbar-dark">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">메뉴</a>
					<div class="dropdown-menu ml-auto dropdown-menu-right"><!-- dropdown-menu-right 화면밖으로 안나감-->
						<c:if test="${memberInfo.m_num == null }">
							<a class="dropdown-item" href="/s20200502/loginForm">로그인 / 회원가입</a>
						</c:if>
						<a class="dropdown-item" href="/s20200502/roomList">스터디룸 검색</a>
						<a class="dropdown-item" href="/s20200502/board/boardList">공지사항 & 스터디그룹</a>
						<c:if test="${memberInfo.m_num != null }">
							<a class="dropdown-item" href="/s20200502/logout">로그아웃</a>
							<a class="dropdown-item" href="/s20200502/myInfo">마이페이지</a>
							<c:if test="${memberInfo.m_type != 0 }">
								--------------------------------
								<a class="dropdown-item" href="/s20200502/roomInsertGo">스터디룸 등록</a>
							</c:if>
							<c:if test="${memberInfo.m_type == 2}">
								--------------------------------
								<a class="dropdown-item" href="/s20200502/levelList">등록 승인(관리자)</a>
							</c:if>
						</c:if>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<div id="gongback"></div>
</body>
</html>