<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>BoardList</title>

 

 <style>
 
.btn-group {
 position: relative;
 left:50%;
 margin-left:-150px;
 margin-bottom: 50px;
}
.btn-group a {
    background-color: #4CAF50;
    border: 5px solid green;
    color: white;
    padding: 10px 24px;
    cursor: pointer;
    float: left;
}

.btn-group a:not(:last-child) {
    border-right: none;
}

.btn-group a:hover {
    background-color: #3e8e41;
}

  
 .board-con1 {
 margin-top: 50px;
 }
 
 #board-wrap {
 	height: 100vh;
	width: 65%;
	margin: auto;
 }
 
 .blue {
 background-color: blue;
 }
 
</style>


</head>

<body>

	
	<div id="board-wrap">
		<div class="board-con1">
			<div class="btn-group btn-group-lg">
	   			<a class="btn btn-primary" href="noticeList" id="notice-btn">공지사항</a>
			    <a class="btn btn-primary" href="boardList" id="board-btn">스터디모집</a>
			</div>
			
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
							<td>관리자</td>
							<%-- <td><fmt:formatDate value="${ board.b_regDate}" pattern="yyyy.MM.dd"/></td> --%>				
							<td>${ board.b_regDate}</td>				
							<td>${ board.b_hit}</td>
							<td>${ board.b_likeCnt}</td>
						</tr>
					</c:forEach>
			</table>
		</div>
		<div class="board-con3">
			<div>
				<a href="#" class="write-btn">글쓰기</a>
			</div>
			
		</div>
		<form action="#" id="icon">
					<div style=text-align:right;>
						<input type="text" name="keyword" required="required" placeholder="검색"> 
						<i class="fa fa-search" onclick="submit();"></i>
					</div>
		</form>
	</div>
	
	<script type="text/javascript">
		var loc = location.href.split("/")[4].indexOf('noticeList');
		if(loc === 0) {
			console.log(loc);
			$("#notice-btn").addClass("blue");
		} 
		
	</script>	
</body>
	
</html>