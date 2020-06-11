<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="css/Position.css">
<script type="text/javascript">
function sertificationChk(){
	var sertificationNum = $('#sertificationNum').val();
	var mySertificationNum = $('#mySertificationNum').val();
	var sertificationType = $('#sertificationType').val();
	var memberInsert = document.memberInsert;
	(sertificationNum + "," + mySertificationNum)
	if(sertificationNum == mySertificationNum){
		if(sertificationType == "memberInsert"){
			alert("회원가입이 완료되었습니다.");
		}
			memberInsert.submit();
	}else{
		$('#sertificationMsg').text("인증번호가 맞지 않습니다.");
	}
}
</script>
<title>공부하랑 회원가입 인증</title>
</head>
<body>
<h5 class="PassSearchFont">공부하랑 이메일인증</h5>
<input type="hidden" id="sertificationNum" value="${sertificationNum }">
<input type="hidden" id="sertificationType" value="${actionPass}">
<div id="sertificationDiv">
<div class="FormDiv">
	<form action="${actionPass }" name="memberInsert" method="post">
		<input type="hidden" name="sertificationEmail" value="${numberStr}">
		인증번호 <input type="text" id="mySertificationNum"class="LoginTextBar">
		<font color="red"><div class="ErrorMsg" id="sertificationMsg"></div></font><br/>
		<input type="button" value="확인" onclick="sertificationChk();" class="PassSearchButton btn-primary">&emsp;&emsp;
		<input type="reset" value="다시쓰기" class="PassSearchButton btn-primary"><br/><br/>
		
		<input type="hidden" name="m_email" value="${member.m_email }">
		<input type="hidden" name="m_num" value="${member.m_num }">
		<input type="hidden" name="m_name" value="${member.m_name }">
		<input type="hidden" name=m_password value="${member.m_password }">
		<input type="hidden" name=m_nickname value="${member.m_nickname }">
		<input type="hidden" name=m_phone value="${member.m_phone }">
		<input type="hidden" name=m_bizname value="${member.m_bizname }">
		<input type="hidden" name=m_biznum value="${member.m_biznum }">
	</form>
</div>
</body>
</html>