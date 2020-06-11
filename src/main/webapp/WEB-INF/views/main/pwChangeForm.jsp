<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="js" tagdir="/WEB-INF/tags/main"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Position.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<js:passwordCheck/>
<script type="text/javascript">	  
	function memberpwChg(){
		var originalPw = $("#originalPw").val();
		var originalPwChk = $("#m_password").val();
			if(originalPw == originalPwChk){
				if(chkPass() != false){
						var pwChange = document.pwChange;
						alert("비밀번호 수정이 완료되었습니다.");
						pwChange.submit();
				}
			}else{
				$('#passwordMsg').text("현재 패스워드가 일치하지 않습니다.");
			}
	}
</script>
<title>공부하랑 비밀번호 변경</title>
</head>
<body>
<input type="hidden" id="m_password" value="${memberInfo.m_password }">
	<h5 class="loginFont pwChangeFormFont">비밀번호 변경</h5>
<div class="FormDiv pwChangeFormDiv">
<form action="pwChangeStart" name="pwChange" method="post">
	<input type="hidden" name="m_num" value="${memberInfo.m_num }">
	현재 비밀번호 &emsp; <input type="password" id="originalPw" class="myInfoTextBar"><br/> 
	<div class="pwChangePassBar">변경할 비밀번호&emsp;<input type="password" id="password" class="myInfoTextBar" name="m_password" onmouseout="chkPass()">
	</div>
	<div class="pwChangeRePassBar">
	변경할 비밀번호 확인&emsp; <input type="password" id="rePassword" class="myInfoTextBar" onmouseout="chkPass()">
	</div>
	<div><font color="red"><div class="pwChangeFont ErrorMsg" id="passwordMsg"></div></font></div><br/>
<div class="pwChangeBottom">
	<input type="button" value="변경하기" class="btn-primary" onclick="memberpwChg()">&emsp;&emsp;
	<input type="button" value="취소" class="btn-primary" onclick="location.href='myInfo'">
</div><br/>
</form>
</div>
</body>
</html>