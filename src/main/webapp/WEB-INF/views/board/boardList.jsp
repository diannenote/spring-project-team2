<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardList</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
 

</head>

<body>

	
	<div id="board-wrap">
		<div class="board-con1">
			<h2 >자유게시판</h2>
			
				
		</div>
		<div class="board-con2">
		
			<table class="board-tb">
				<colgroup>
					<col width="5%">
					<col width="40%">
					<col width="10%">
					<col width="8%">
					<col width="5%">
					<col width="7%">
				</colgroup>	
					<tr>
						<th>NO.</th><th>제목</th><th>작성자</th>
						<th>작성일</th><th>조회수</th><th>좋아요♥</th>
					</tr>
					
						<c:forEach items="${boardList}" var="board">
							<tr>
								<td>${ board.b_num} </td>
								<td>${ board.b_title}</td>
								<td>강미리</td>
				<td><fmt:formatDate value="${ board.b_regDate}" pattern="yyyy.MM.dd"/> </td>				
								<td>${ board.b_hit}</td>
								<td>${ board.b_likeCnt}</td>
							</tr>
							
							
						</c:forEach>
					
			</table>
		</div>
		<div class="board-con3">
			<div>
				<a href="boardWriteForm.do" class="write-btn">글쓰기</a>
			</div>
			
		</div>
		<form action="boardList.do" id="icon">
					<div style=text-align:right;>
						<input type="text" name="keyword" required="required" placeholder="검색"> 
						<i class="fa fa-search" onclick="submit();"></i>
					</div>
		</form>
	</div>
</body>
	
</html>