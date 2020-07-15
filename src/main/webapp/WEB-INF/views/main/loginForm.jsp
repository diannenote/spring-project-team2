<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String context = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/Position.css">
<title>로그인 페이지</title>
<style>
body {
	font-family: BMDOHYEON_TTF; 
}
.hangang {
	font-family: SEOULHANGANGB;
}
.jalnan {
	font-family: JALNAN;
}
</style>
</head>
<body>
<div class="loginFont"><h5>공부하랑 로그인</h5></div>
	<div class="FormDiv">
		<form action="loginChk" method="post">
			<div>
				<input type="text" name="m_email" placeholder="이메일" class="LoginTextBar">
			<div class="ErrorMsg">
				<font color="red">${msg}</font></div>
			</div>
			<div>
				<input type="password" name="m_password" placeholder="비밀번호" class="LoginTextBar"></div><br/>
			<div>
				<a href="idSearchForm">아이디찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<a href="PassSearchForm">비밀번호찾기</a>
			</div>
			<div>
				<input type="submit" value="로그인" class="LoginTextBar btn-primary"><br/>
			</div>
			<p>아직 회원이 아니신가요?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="memberShip">회원가입</a></p> 
		</form>
	</div>
</body>
</html>