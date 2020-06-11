<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="js" tagdir="/WEB-INF/tags/main"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% String context = request.getContextPath(); %>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="css/Position.css">
<js:passwordCheck/>
<script type="text/javascript">
	//패스워드 조건이 맞으면 실행
	function pwChk(){
		if(chkPass() != false){
			var PassSearchStart = document.PassSearchStart;
			PassSearchStart.submit();
		}
	}
	//이메일의 존재 유무
	function emailChk(){
	var isM_email = $("#m_email").val();
		if(isM_email != ""){
			$.ajax({
				type : "POST",
				url : "<%=context%>/emailNumSearch",
				data:{m_email : $('#m_email').val()},
				dataType:'text',
				success:function(data){
						var sertification = document.serCu;
						$("#ms_num").val(data);
						history.go(1);
						sertification.submit();
				},
					error:function(){
						$("#emailMsg").text("이메일 값이 없습니다.");
				}
			});
		}else if(isM_email == ""){
				$("#emailMsg").text("값을 입력해주세요");
		}
	}
</script>
<title>공부하랑 비밀번호 찾기</title>
</head>
<body>
	
<c:if test="${resultNum == 0 }">
			<h5 class="PassSearchFont">비밀번호 찾기</h5>
	<div class="FormDiv">
		<form action="sertification" method="post" name="serCu">
			<input type="hidden" name="actionPass" value="${actionPass }">
			<input type="hidden" name="m_num" id="ms_num">
			이메일 &emsp;<input type="text" id="m_email" name="m_email" class="LoginTextBar"><br/>
			<font color="red"><div class="ErrorMsg" id="emailMsg"></div></font>
			<br/><input type="button" value="확인" onclick="emailChk()" class="PassSearchButton btn-primary">
			<input type="reset" value="다시쓰기" class="PassSearchButton btn-primary"><br/><br/>
		</form>
	</div>
</c:if>

<c:if test="${resultNum == 1 }">
	<h5 class="PassSearchFont">새 비밀번호 입력</h5>
		<div class="FormDiv">
			<form action="PassSearchStart" method="post" name="PassSearchStart">
						<input type="hidden" name="m_num" value="${member.m_num }">
						<input type="hidden" name="actionPass" value="${actionPass }">
						새 비밀번호 입력 &emsp;<input type="password" id="password" name="m_password" class="myInfoTextBar" onmouseout="chkPass()">
					<div class="SertificationBottom ErrorMsg">
						<font color="red"><div id="passwordMsg"></div></font><br/>
					</div>
						새 비밀번호 확인  &emsp;<input type="password" id="rePassword" class="myInfoTextBar" onmouseout="chkPass()"><p><br/>
					<div class="SertificationBottom">
						<input type="button" value="확인" class="btn-primary" onclick="pwChk()"> &emsp; &emsp;
						<input type="reset" value="다시쓰기" class="btn-primary" class="">
					</div><br/>
			</form>
		</div>
</c:if>
</body>
</html>