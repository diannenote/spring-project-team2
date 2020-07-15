<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="js" tagdir="/WEB-INF/tags/main"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<%
	String context = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="css/Position.css">
<js:nickNameCheck/>
<js:phoneNumCheck/>
<script type="text/javascript">
	//패스워드 및 닉네임 중복 체크
	function pwChk(){
		var m_password = $('#m_password').val();
		var checkPass = $('#checkPass').val();
		var myInfoSave = document.myInfoSave;
		
		if(m_password == checkPass && nickNowChk() != false){
			alert("회원정보 수정이 완료되었습니다.");
			myInfoSave.submit();
		}else{
			$('#passCheckMsg').text("비밀번호가 일치하지 않습니다.");
		}
	}
	//현재 닉네임과 아닌닉네임 체크
	function nickNowChk(){
		var m_nickname = $('#m_nickname').val();
		var m_chkNickName = $('#chkNickName').val();
		if(m_nickname != m_chkNickName){
			nickNameCheck()
			if(nickNameCheck() != false){
				return true;
			}
		}else{
			return true;
		}
	}
	//계정삭제삭제
	function memberDel(){
		var m_password = $('#m_password').val();
		var checkPass = $('#checkPass').val();
		var memberDelete = document.memberDelete;
			if(m_password == checkPass){
				if(confirm("정말 삭제하시겠습니까?") == true){
						alert("삭제되었습니다.");
						memberDelete.submit();
					}else{
						window.history.back();
					}
				}else{
					$('#passCheckMsg').text("비밀번호가 일치하지 않습니다.");
				}
			}
</script>
<title>공부하랑 회원정보</title>
</head>
<body>
	<div class="loginFont"><h5>회원정보 수정</h5></div>
<!-- 회원정보 수정 -->
<input type="hidden" id="Check">
<input type="hidden" id="m_password" value="${memberInfo.m_password }">
<input type="hidden" id="m_nickname" value="${memberInfo.m_nickname }">
<div class="FormDiv myInfoForm">
	<form action="myInfoSave" name="myInfoSave" method="post">
		<input type="hidden" name="m_num" value="${memberInfo.m_num }">
		<input type="hidden" name="m_reNum" value="${memberInfo.m_num }">
		<input type="hidden" name="m_type" value="${memberInfo.m_type }">
			<div>
				닉네임&emsp;&emsp;<input type="text" id="chkNickName" onmouseout="nickNowChk()" name=m_nickname value="${memberInfo.m_nickname }" class="myInfoTextBar">
				<font color="red"><div id="nickNameMsg" class="ErrorMsg mhyInfoErrorMsg"></div></font>
			</div>
			<br/>
			<div>
			휴대폰번호&emsp;<input type="text" class="phone" name=m_phone onmouseout="phoneChk()" value="${memberInfo.m_phone }">&emsp;
			</div><br/>
	<c:if test="${memberInfo.m_type == 1}">
		<div>
			회사명&emsp;&emsp;<input type="text" name=m_bizname value="${memberInfo.m_bizname }" class="myInfoTextBar">
		</div><br/>
		<div>
			사업자번호&emsp;<input type="text" name=m_biznum value="${memberInfo.m_biznum }" class="myInfoTextBar">&emsp;
		</div><br/>
	</c:if>
		<div>
			비밀번호 확인 &emsp;
			<input type="password" id="checkPass" class="myInfoTextBar"><font color="red">
			&emsp;&emsp;
			<div id="passCheckMsg"  class="ErrorMsg mhyInfoErrorMsg"></div></font>
		</div><br/>
		<div class="myInfobottom">
			<input type="button" value="회원정보 수정" class="btn-primary" onclick="pwChk();">&emsp;&emsp;
			<input type="button" value="메인으로" class="btn-primary" onclick="location.href='main'" >
		<br/><br/>
			<a href="pwChange">비밀번호 변경하기</a>&emsp;&emsp;
			<a href="#" onclick="memberDel()">회원탈퇴</a>
		</div>
	</form>
</div>
<form action="memberDelete" name="memberDelete" method="post">
	<input type="hidden" name="m_num" value="${memberInfo.m_num }">
</form>
</body>
</html>