<%@ tag language="java" pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<script type="text/javascript">
function duplicateCheck(){
	// 이메일 형식 체크
	var isM_email = $("#m_email").val();
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if(isM_email != null){
			if(regex.test( isM_email) === false) {
				$("#duplicateMsg").text("이메일 형식으로 입력해주세요");
			}else{
				$.ajax({
					type : "GET",
					url : "<%=context%>/duplicateCheck",
					data:{m_email : $('#m_email').val()},
					dataType:'text',
					success:function(data){
						if(data == '1'){
							$("#duplicateMsg").text("사용가능한 이메일 입니다.");
							return true;
						}else{
							$("#duplicateMsg").text("중복된 이메일 입니다.");
							return false;
						}
				}});
		}
	}else{
		$("#duplicateMsg").text("이메일을 입력해주세요");
	}
}
</script>