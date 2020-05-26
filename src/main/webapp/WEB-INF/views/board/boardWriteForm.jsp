<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Board</title>

<%@ include file="../header.jsp" %>
<body>
	<div id="wrap">
		<c:if test="${msg != null }">${msg}</c:if>
		<form action="boardWrite?currentPage=${paging.currentPage }" method="post">
			<input type="hidden" name="b_num" value="${b_num }">
			<input type="hidden" name="b_type" value="${b_type }">
	
		<table>
			<h2>게시판 글쓰기</h2>
			<tr>
				<td>		
					<input type="text" name="b_title" required="required" placeholder="게시글 제목을 입력해주세요" 
						size="100">
				</td>
			</tr>		
			
			<tr>
				<td><textarea  style="resize: none" rows="20" cols="105" name="b_content"
						required="required" placeholder="내용을 입력하세요"></textarea>
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