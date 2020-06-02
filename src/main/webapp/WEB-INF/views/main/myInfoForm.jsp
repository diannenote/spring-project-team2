<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String context = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
	//패스워드 체크
	function pwChk(){
		var m_password = $('#m_password').val();
		var checkPass = $('#checkPass').val();
		var myInfoSave = document.myInfoSave;
		if(m_password == checkPass){
			alert("회원정보 수정이 완료되었습니다.");
			myInfoSave.submit();
		}else{
			$('#passCheckMsg').text("비밀번호가 일치하지 않습니다.");
		}
	}
</script>
<title>공부하랑 회원정보</title>
</head>
<body>
<!-- 회원정보 수정 -->
<input type="hidden" id="Check">
<input type="hidden" id="m_password" value="${memberInfo.m_password }">
<form action="myInfoSave" name="myInfoSave" method="post">
		<input type="hidden" name="m_num" value="${memberInfo.m_num }">
		<input type="hidden" name="m_type" value="${memberInfo.m_type }">
		닉네임:<input type="text" name=m_nickname value="${memberInfo.m_nickname }"><br/>
		휴대폰번호:<input type="text" name=m_phone value="${memberInfo.m_phone }"><br/>
	<c:if test="${memberInfo.m_type == 1}">
		회사명<input type="text" name=m_bizname value="${memberInfo.m_bizname }"><br/>
		사업자번호:<input type="text" name=m_biznum value="${memberInfo.m_biznum }"><br/>
	</c:if>
	비밀번호 확인 : <input type="password" id="checkPass"><font color="red"><div id="passCheckMsg"></div></font>
		<input type="button" value="회원정보 수정" onclick="pwChk();">
		<input type="button" value="메인으로" onclick="location.href='mainForm'">
		<a href="passwordChg">비밀번호 변경하기</a>
		<a href="memberDelete">회원탈퇴</a>
</form>
</body>
</html>