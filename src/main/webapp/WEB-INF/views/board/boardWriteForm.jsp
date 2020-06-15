<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<title>Board</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/board-form.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="lang/summernote-ko-KR.js"></script>

<body>
	<div id="wrap">
		<form action="boardWrite"method="post">
			<input type="hidden" name="b_type" value="${board.b_type }">
			<input type="hidden" name="m_num" value="${board.m_num }">
		
			<h3>게시판 글쓰기</h3>
			<hr>
				<div class="title-div">
					<input type="text" name="b_title" required="required" 
						placeholder="게시글 제목을 입력해주세요" class="title-input">
				</div>		
			
				<div>
					<textarea id= "summernote" name="b_content"
							required="required"></textarea>
				</div>		
				
			<div class="insert-btn">
				<input class="submit-btn" type="submit" value="확인">
				<input class="cnxl-btn" type="button" value="취소" onclick="history.back()">
			</div>
		</form>
	</div>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
	        placeholder: '내용을 입력해주세요',
	        lang: 'ko-KR',
	        tabsize: 2,
	        height: 600,
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