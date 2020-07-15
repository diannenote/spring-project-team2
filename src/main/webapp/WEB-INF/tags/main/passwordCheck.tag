<%@ tag language="java" pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<script type="text/javascript">
	//패스워드 최소조건
	function chkPass(){
		 var pw = $("#password").val();
		 var isRePassword = $('#rePassword').val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		 if(pw.length < 8 || pw.length > 20){
			 $("#passwordMsg").text("8자리 ~ 20자리 이내로 입력해주세요.");
		  	return false;
		 }else if(pw.search(/\s/) != -1){
			 $("#passwordMsg").text("비밀번호는 공백 없이 입력해주세요.");
		  	return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
			 $("#passwordMsg").text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		  	return false;
		 }else if(pw != isRePassword){
			 $("#passwordMsg").text("패스워드 확인이 일치하지 않습니다.");
			 return false;
		 }
		 else {
			 $("#passwordMsg").text("패스워드가 일치합니다.");
		    return true;
		 }
	}
</script>