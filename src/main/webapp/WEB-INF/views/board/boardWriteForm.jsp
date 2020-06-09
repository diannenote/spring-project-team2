<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<title>Board</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="lang/summernote-ko-KR.js"></script>

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
	        placeholder: '내용을 입력해라',
	        lang: 'ko-KR',
	        tabsize: 2,
	        height: 300,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear', 'color']],
	          ['fontname', ['fontname']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture', 'video']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ]
	      });
	}); 
</script>

	
</body>
</html>	
	<%-- <%@ include file="../footer.jsp" %> --%>