<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String context = request.getContextPath();
%>
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
 
 .board-con1 {
 text-align: center;
 margin-bottom: 50px;
 }

.btn-group a {
    background-color: #4CAF50; 
    color: white;
    padding: 10px 24px;
    cursor: pointer;
    float: left;
}

.btn-group a:not(:last-child) {
    border-right: none;
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


</head>

<body>

	
	<div id="board-wrap">
		<div class="board-con1">
			<div class="btn-group btn-group-lg">
	   			<a class="btn btn-primary" href="noticeList" id="notice-btn">공지사항</a>
			    <a class="btn btn-primary" href="boardList" id="board-btn">스터디그룹</a>
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
						<th>작성일</th><th>조회수</th>
						<c:if test="${board.b_type == 1 }">
						<th style="display:none;" id="likeTh">좋아요♥</th>
						</c:if>
					</tr>
					
					<c:forEach items="${boardList}" var="boardList">
						<tr>
							<td>${ boardList.b_num} </td>
							<td><a href='boardContent?b_num=${boardList.b_num }&currentPage=${paging.currentPage}&b_type=${boardList.b_type}'>${boardList.b_title}</a></td>
							<td>${ boardList.m_nickname}</td>
							<td>${ boardList.b_regDate}</td>				
							<td>${ boardList.b_hit}</td>
							<td style="display: none;" id="likeTd">${ boardList.b_likeCnt}</td>
						</tr>
					</c:forEach>
			</table>
			
		</div>
		<div class="board-con3">
		<%-- <% String url; %>
		<%= %> --%>
			<div id="WriteBtnDiv1" style="display: none;">
			 	<c:if test="${m_type == 2 }">
					<a onclick="boardType()" class="write-btn">글쓰기</a>
			 	</c:if>
			</div>
			<div id="WriteBtnDiv2" style="display: none;">
				<a onclick="boardType()" class="write-btn">글쓰기</a>
			</div>
			
		</div>
		<div>
			<form action="#" id="icon">
						<div style=text-align:right;>
							<input type="text" name="keyword" required="required" placeholder="검색"> 
							<i class="fa fa-search" onclick="submit();"></i>
						</div>
			</form>
		</div>
		<div style="text-align: center;">
		
			<c:if test="${paging.before eq true }">
				<a onclick="goBefore(${paging.startPage - 1})"> ◀ PREV</a>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<a onclick="goPage(${i})">[${i}]</a>
			</c:forEach>
			<c:if test="${paging.next eq true}">
				<a onclick="goNext(${paging.endPage + 1})"> NEXT ▶</a>
			</c:if>
		</div>
		
	</div>
	
	<script type="text/javascript">
		var loc = location.href.split("/")[5];
		// 공지/스터디게시판 버튼 css 
		$(document).ready(function() {
			if(loc.indexOf('noticeList') === 0) {
				$("#notice-btn").css("background", "#0652DD");
			} else {
				$("#board-btn").css("background", "#0652DD");
			}
		})
		// 글쓰기 버튼(공지/스터디)
		$(document).ready(function() {
			if(loc.indexOf('noticeList') === 0) {
				$("#WriteBtnDiv1").css("display", "inline");
			}
			if(loc.indexOf('boardList') === 0) {
				$("#WriteBtnDiv2").css("display", "inline");
			}
		})
		//likes table
		$(document).ready(function() {
			if(loc.indexOf('boardList') === 0) {
				$("#likeTh").css("display", "block");
				$("#likeTd").css("display", "block");
			}
		})
		//페이징(페이지이동 게시판별로 나눔)
		function goPage(pageNum) {
			if(loc.indexOf('noticeList') === 0) {
				location.href = "noticeList?currentPage=" + pageNum;
			} else {
				location.href = "boardList?currentPage=" + pageNum;
			}
		}
		//페이징(이전블록 게시판별로 나눔)
		function goBefore(prevPage) {
			if(loc.indexOf('noticeList') === 0) {
				location.href = "noticeList?currentPage=" + prevPage;
			} else {
				location.href = "boardList?currentPage=" + prevPage;
			}
		}
		//페이징(다음블록 게시판별로 나눔)
		function goNext(nextPage) {
			if(loc.indexOf('noticeList') === 0) {
				location.href = "noticeList?currentPage=" + nextPage;
			} else {
				location.href = "boardList?currentPage=" + nextPage;
			}
		} 
		//게시판 타입주기
		function boardType() {
			if(loc.indexOf('boardList') === 0) {
				location.href = "boardWriteForm?b_type=1";
			}  else {
				location.href = "boardWriteForm?b_type=0";
			}
		}
		
	</script>
		
	
</body>
	
</html>