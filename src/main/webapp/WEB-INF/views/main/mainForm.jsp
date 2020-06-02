<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공부하랑\(^ㅁ^)/메인페이지</title>
</head>
<body>
<input type="hidden" name="m_num" value="${member.m_num }">
${memberInfo.m_email }님 환영합니다.
${memberInfo.m_password }님 환영합니다.
${memberInfo.m_nickname }님 환영합니다.
${memberInfo.m_ban }님 환영합니다.
${memberInfo.m_phone }님 환영합니다.
${memberInfo.m_biznum }님 환영합니다.
${memberInfo.m_bizname }님 환영합니다.
${memberInfo.m_type }님 환영합니다.
${memberInfo.m_num }님 환영합니다.
<a href="logout">로그아웃</a>
<a href="myInfo">회원정보 수정</a>
</body>
</html>