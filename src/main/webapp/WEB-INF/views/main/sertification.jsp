<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>공부하랑 회원가입 인증</title>
</head>
<body>
<script type="text/javascript">
function sertificationChk(){
	var sertificationNum = $('#sertificationNum').val();
	var mySertificationNum = $('#mySertificationNum').val();
	var memberInsert = document.memberInsert;
	(sertificationNum + "," + mySertificationNum)
	if(sertificationNum == mySertificationNum){
		memberInsert.submit();
	}else{
		$('#sertificationMsg').text("인증번호가 맞지 않습니다.");
	}
}


</script>
<input type="hidden" id="sertificationNum" value="${sertificationNum }">
<div id="sertificationDiv">
	<form action="memberInsert" name="memberInsert" method="post">
		<input type="hidden" name="sertificationEmail" value="${numberStr}">
		인증번호 : <input type="text" id="mySertificationNum"><font color="red"><div id="sertificationMsg"></div></font>
		<input type="button" value="확인" onclick="sertificationChk();">
		<input type="reset" value="지우기">
		
		<input type="hidden" name="m_email" value="${member.m_email }">
		<input type="hidden" name=m_password value="${member.m_password }"><br/>
		<input type="hidden" name=m_nickname value="${member.m_nickname }"><br/>
		<input type="hidden" name=m_phone value="${member.m_phone }"><br/>
		<input type="hidden" name=m_bizname value="${member.m_bizname }"><br/>
		<input type="hidden" name=m_biznum value="${member.m_biznum }"><br/>
	</form>
</div>
</body>
</html>