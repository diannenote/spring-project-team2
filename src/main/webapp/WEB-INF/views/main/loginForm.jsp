<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String context = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공부하랑\(^ㅁ^)/ 로그인페이지</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script>
</script>
</head>
<body>
<form action="loginChk" method="post">
	아이디 :<input type="text" name="m_email"><br/>
	패스워드  : <input type="text" name="m_password"><br/>
	<input type="submit" value="로그인"><br/>
	<a href="memberShip">회원가입</a> <a href="#">아이디/비밀번호 찾기</a>
</form>
<font color="red">${msg}</font>

</body>
</html>