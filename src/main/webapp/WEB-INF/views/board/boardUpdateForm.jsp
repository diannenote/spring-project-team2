<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update</title>
<%@ include file="../header.jsp" %>
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
					<td><textarea  style="resize: none" rows="20" cols="105" name="b_content"
						required="required">${board.b_content }</textarea>
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

</body>
</html>