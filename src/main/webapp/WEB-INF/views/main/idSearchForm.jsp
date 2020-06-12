<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="js" tagdir="/WEB-INF/tags/main"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String context = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="css/Position.css">
<js:phoneNumCheck/>
<script type="text/javascript">
	function idEx(){
		var isM_id = $('#myName').val();
		var isM_phone = $('#myPhones').val();
		if(isM_id != "" && isM_phone != ""){
			$.ajax({
				type : "POST",
				url : "<%=context%>/idExistenceChk",
				data:{m_name : isM_id, m_phone : isM_phone},
				dataType:'text',
				success:function(data){		
					$("#myEmail").text(isM_id + "님이 가입한 이메일은[" + data + "]입니다");
				},
				error:function(){
					$("#myEmail").text("조회값이 없습니다.");
			}
			});
		}else{
			$("#idMsg").text("값을 입력해주세요");
		}
	}
</script>
<title>공부하랑 아이디 찾기</title>
</head>
<body>
	<h5 class="idSearchFont">아이디 찾기</h5>
	<div class="FormDiv idSearchDiv">
		&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		성명 &nbsp;&nbsp;&nbsp;<input type="text" id="myName" name="m_name" class="myInfoTextBar"><br/>
		휴대폰 번호 &nbsp;&nbsp;&nbsp;<input type="text" id="myPhones" name="m_phone" class="phone" onmouseout="phoneChk()"><br/>
		<div class="idErrorMSG"><font color="red"><div id="idMsg"></div></font><br/></div>
	<div class="idSearchBottom">
		<font color="red"><div class="ErrorMsg" id="myEmail"></div></font><br/>
		<input type="button" value="아이디 찾기"class="btn-primary" onclick="idEx()">&nbsp;&nbsp;&nbsp; 
		<input type="reset" value="다시쓰기" class="btn-primary">
	</div><br/>

</body>
</html>