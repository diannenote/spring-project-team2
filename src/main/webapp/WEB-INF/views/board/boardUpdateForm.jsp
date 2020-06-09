<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update</title>
<%@ include file="../header.jsp" %>
<!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js--> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
	<div id="wrap">
		<form action="boardUpdate" method="post">
			<input type="hidden" name="b_type" value="${board.b_type }">
			<input type="hidden" name="b_num" value="${board.b_num }">
			<input type="hidden" name="currentPage" value="${paging.currentPage }">
			
		<table>
			<h2>게시글수정</h2>
				<tr>
					<td>		
						<input type="text" name="b_title" required="required" 
							size="100" value="${board.b_title }" >
					</td>
				</tr>		
				
				<tr>
					<td><textarea  id="summernote" name="b_content">
						${board.b_content }
						</textarea>
					</td>
				</tr>		
						
				<tr>
					<td>
						<input type="submit" value="수정">
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