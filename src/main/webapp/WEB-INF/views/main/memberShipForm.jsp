<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="js" tagdir="/WEB-INF/tags/main"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String context = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공부하랑\(^ㅁ^)/회원가입페이지</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="css/Position.css">
<js:duplicateCheck/>
<js:nickNameCheck/>
<js:passwordCheck/>
<js:phoneNumCheck/>
<script type="text/javascript">
//모든 조건 만족시에 인증번호 넘김
	function newMemberCheck(){
			if(duplicateCheck() != false && chkPass() != false && nickNameCheck() != false){
				history.pushState(null, null, location.href);
			    window.onpopstate = function () {
			    history.go(1);
			};
				var newMember = document.newMember;
				newMember.submit();
			}
	}
</script>
</head>
<body>
<h5 class="idSearchFont">공부하랑 회원가입</h5>
<div class="FormDiv memberShipFormDiv">

<form action="sertification" name="newMember" method="post">
	<div id="newMemberCertified">
		이메일&emsp;<input type="text" name="m_email" id="m_email" class="myInfoTextBar" onmouseout="duplicateCheck()">
	<div class="memberShipNicMsg ErrorMsg"><font color="red"><div id="duplicateMsg"></div></font></div>
		<input type="hidden" name="actionPass" value="${actionPass }">
		패스워드<input type="password" id="password" name="m_password" class="myInfoTextBar" onmouseout="chkPass()"><br/>
	<div class="memberShipNicMsg ErrorMsg"><font color="red"><div id="passwordMsg"></div></font></div>
	<div class="memberShipPass">패스워드 확인 <input type="password" id="rePassword" class="myInfoTextBar" onmouseout="chkPass()"><br/></div>
	<div class="memberShipNcik">닉네임<input type="text" name=m_nickname id="nickName" class="myInfoTextBar" onmouseout="nickNameCheck()"></div>
	<div class="memberShipNicMsg ErrorMsg"><font color="red"><div id="nickNameMsg"></div></font></div>
	<div class="memberShipName">성명<input type="text" name="m_name" class="myInfoTextBar" ></div>
	<div class="memberShipPhone">휴대폰번호<input type="text" class="phone" name=m_phone class="myInfoTextBar" onmouseout="phoneChk()"></div>
	<div class="memberShipBizName">회사명<input type="text" name=m_bizname class="myInfoTextBar"></div>
	<div class="memberShipBizNum">사업자번호<input type="text" name=m_biznum class="myInfoTextBar"></div>
	<div class="idSearchBottom"><br/>
		<input type="button" value="회원가입" class="btn-primary" onclick="newMemberCheck();" >	<!--"newMemberCheck();"-->
		<input type="button" value="메인으로" class="btn-primary" onclick="location.href='loginForm'">
	</div><br/>
</div>
</form>

</div>
</body>
</html>