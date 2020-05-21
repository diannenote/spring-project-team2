<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.btn-group button {
    background-color: #4CAF50;
    border: 5px solid green;
    color: white;
    padding: 10px 24px;
    cursor: pointer;
    float: left;
}

.btn-group button:not(:last-child) {
    border-right: none;
}

.btn-group button:hover {
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
 
 
</style>

<script type="text/javascript">
var contextPath='${pageContext.request.contextPath}';
	function getNoticeList() {
		$.ajax({
			url: contextPath + "/noticeList",
			success:function(data){
				console.log(data)
				$("#board-list > tr").remove();
				var content = "";
				for(var i = 0; i < data.length; i++) {
					content += "<tr>";
					content += 		"<td>" + data[i].b_num + "</td>";
					content += 		"<td>" + data[i].b_title + "</td>";
					content += 		"<td>" + "관리자 "+ "</td>";
					content += 		"<td>" + data[i].b_regDate + "</td>";
					content += 		"<td>" + data[i].b_hit + "</td>";
					content += 		"<td>" + data[i].b_likeCnt + "</td>";
					content += "</tr>";
				}
				$("#board-list").html(content);
			}
		})
		
	}

</script>
</head>

<body>

	
	<div id="board-wrap">
		<div class="board-con1">
			<div class="btn-group btn-group-lg">
	   			<button class="btn btn-primary" onclick="getNoticeList()">공지사항</button>
			    <button class="btn btn-primary" onclick="#">스터디모집</button>
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
					<tbody id="board-list">
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
					</tbody>
					
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
</body>
	
</html>