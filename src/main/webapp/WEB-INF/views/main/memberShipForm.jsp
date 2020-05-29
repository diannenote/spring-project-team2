<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공부하랑\(^ㅁ^)/회원가입페이지</title>
</head>
<body>
<form action="memberInsert" method="post">
	이메일:<input type="text" name=m_email><br/>
	패스워드:<input type="text" name=m_password><br/>
	닉네임:<input type="text" name=m_nickname><br/>
	휴대폰번호:<input type="text" name=m_phone><br/>
	회사명<input type="text" name=m_bizname><br/>
	사업자번호:<input type="text" name=m_biznum><br/>
	<input type="submit" value="회원가입">
</form>
	<input type="button" value="메인으로" onclick="location.href='main'">
</body>
</html>