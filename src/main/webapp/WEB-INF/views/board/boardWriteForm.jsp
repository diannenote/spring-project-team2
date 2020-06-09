<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Board</title>

<%@ include file="../header.jsp" %>
<script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
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
				<td><textarea  id= "editor1" style="resize: none" rows="20" cols="105" name="b_content"
						required="required" placeholder="내용을 입력하세요"></textarea>
						<script>
               			 CKEDITOR.replace( 'editor1' );
            			</script>
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
	
</body>
</html>	
	<%-- <%@ include file="../footer.jsp" %> --%>