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
<title>공부하랑\(^ㅁ^)/회원가입페이지</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script type="text/javascript">
	//이메일 중복확인 처리 ajax
	function duplicateCheck(){
	var isM_email = $("#m_email").val();
		if(isM_email != null){
			$.ajax({
				type : "GET",
				url : "<%=context%>/duplicateCheck",
				data:{m_email : $('#m_email').val()},
				dataType:'text',
				success:function(data){
					if(data == '1'){
						$("#duplicateMsg").text("사용가능한 이메일 입니다.");
						$("#Check").val(data);
					}else{
						$("#duplicateMsg").text("중복된 이메일 입니다.");
						$("#Check").val(data);
					}
			}});
		}else if(isM_email == null){
				$("#duplicateMsg").text("값을 입력해주세요");
		}
	}
	//닉네임 중복확인
	function nickNameCheck(){
	var isM_nickName = $("#nickName").val();
		if(isM_nickName != null){
			$.ajax({
				type : "GET",
				url : "<%=context%>/nickNameCheck",
				data:{m_nickname : $('#nickName').val()},
				dataType:'text',
				success:function(data){
					if(data == '1'){
						$("#nickNameMsg").text("사용가능한 닉네임 입니다.");
						$("#nickNameChk").val(data);
					}else{
						$("#nickNameMsg").text("중복된 닉네임 입니다.");
						$("#nickNameChk").val(data);
					}
			}});
		}else if(isM_email == null){
				$("#nickNameMsg").text("값을 입력해주세요");
		}
	}
	//모든 조건 만족시에 인증번호 넘김
	function newMemberCheck(){
		var Check = $("#Check").val();
		var nickNameCheck = $("#nickNameChk").val();
		var isM_email = $("#m_email").val();
		var isPassword = $('#password').val();
		var isRePassword = $('#rePassword').val();
			if(isM_email != null){
				if(Check == "1" && nickNameCheck == "1"){
						if(isPassword == isRePassword){
							var newMember = document.newMember;
							newMember.submit();
						}else{
							$("#passwordMsg").text("패스워드 확인이 일치하지 않습니다.");
						}
					}			
			}else if(isM_email == null){
		 		$("#duplicateMsg").text("필수 정보 입력입니다.");
	 		}
	}
</script>
</head>
<body>
<input type="hidden" id="Check">
<input type="text" id="nickNameChk">
<form action="sertification" name="newMember" method="post">
	<div id="newMemberCertified">
	이메일:<input type="text" name="m_email" id="m_email"><input type="button" value="이메일 중복 확인" onclick="duplicateCheck();"><br>
	<font color="red"><div id="duplicateMsg"></div></font><br/>
	패스워드:<input type="password" id="password" name=m_password><font color="red"><div id="passwordMsg"></div></font>
	패스워드 확인 <input type="password" id="rePassword"><p>
	닉네임:<input type="text" name=m_nickname id="nickName"><input type="button" value="닉네임 중복확인" onclick="nickNameCheck();"><font color="red"><div id="nickNameMsg"></div></font><br/>
	휴대폰번호:<input type="text" name=m_phone><p>
	회사명<input type="text" name=m_bizname><p>
	사업자번호:<input type="text" name=m_biznum><p>
	<input type="button" value="회원가입" onclick="newMemberCheck();">	<!--"newMemberCheck();"-->
	<input type="button" value="메인으로" onclick="location.href='loginForm'">
	</div>
</form>
</body>
</html>