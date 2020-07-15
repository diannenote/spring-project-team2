<%@ tag language="java" pageEncoding="UTF-8"%>
<% String context = request.getContextPath(); %>
<script type="text/javascript">
	//닉네임 중복확인
function nickNameCheck(){
	var isM_nickName = $("#nickName").val();
		if(isM_nickName != ""){
			$.ajax({
				type : "GET",
				url : "<%=context%>/nickNameCheck",
				data:{m_nickname : $('#nickName').val()},
				dataType:'text',
				success:function(data){
					if(data == '1'){
						$("#nickNameMsg").text("사용가능한 닉네임 입니다.");
						return true;
					}
					 else if(data == '0'){
						$("#nickNameMsg").text("중복된 닉네임 입니다.");
						return false;
					}
			}});
		}else{
				$("#nickNameMsg").text("닉네임을을 입력해주세요");
		}
	}
</script>