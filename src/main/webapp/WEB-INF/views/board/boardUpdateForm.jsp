<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커뮤니티 게시판</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../css/board-form.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="lang/summernote-ko-KR.js"></script>

<body>
	<div id="wrap">
		<form action="boardUpdate" method="post">
			<input type="hidden" name="b_type" value="${board.b_type }">
			<input type="hidden" name="b_num" value="${board.b_num }">
			<input type="hidden" name="currentPage" value="${paging.currentPage }">
			
			<h3>게시글수정</h3>
			<hr>
				<div class="title-div">
					<input type="text" name="b_title" required="required" 
						value="${board.b_title }"  class="title-input">
				</div>		
				
				<div>
					<textarea  id="summernote" name="b_content">
						${board.b_content }
						</textarea>
				</tr>		
			<div class="insert-btn">
				<input class="submit-btn" type="submit" value="수정">
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