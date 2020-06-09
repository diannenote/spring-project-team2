<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Board</title>
<!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js--> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<body>
	<div id="wrap">
		<form action="boardWrite"method="post">
			<input type="hidden" name="b_type" value="${board.b_type }">
			<input type="hidden" name="m_num" value="${board.m_num }">
	
		<table>
			<h2>게시판 글쓰기</h2>
			<tr>
				<td>		
					<input type="text" name="b_title" required="required" placeholder="게시글 제목을 입력해주세요" 
						size="100">
				</td>
			</tr>		
			
			<tr>
				<td><textarea  id= "summernote" name="b_content"
						required="required"></textarea>
					


				</td>
			</tr>		
					
			<tr>
				<td>
					<input type="submit" value="확인">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>	
				
			</table>		
		</form>
	</div>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height: 300, 
			lang : 'ko-KR', 
			placeholder: '내용을 입력해주세요'
		}); 
	}); 
</script>

	
</body>
</html>	
	<%-- <%@ include file="../footer.jsp" %> --%>