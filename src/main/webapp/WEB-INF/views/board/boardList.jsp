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
<link rel="stylesheet" type="text/css" href= "../css/board-list.css"> 

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
						<th class="board-only">좋아요♥</th>
						
					</tr>
					
					<c:forEach items="${boardList}" var="boardList">
						<tr>
							<td>${ boardList.rn} </td>
							<td><a href='boardContent?b_num=${boardList.b_num }&currentPage=${paging.currentPage}&b_type=${boardList.b_type}'>${boardList.b_title}</a>
							    <a style="display: none;" class="board-only"> &nbsp; [${boardList.b_replyCnt }] </a></td>
							<td>${ boardList.m_nickname}</td>
							<td>${ boardList.b_regDate}</td>				
							<td>${ boardList.b_hit}</td>
							<td style="display: none;" class="board-only">${ boardList.b_likeCnt}</td>
						</tr>
					</c:forEach>
			</table>
			
		</div>
		<div class="board-con3">
		
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
			<form action="boardList" id="boardSearch">
				<div id="boardKeyword" style="text-align:right; display: none;">
					<input type="text" name="keyword" required="required" placeholder="검색"> 
					<i class="fa fa-search" onclick="searchBtn()"></i>
				</div>
			</form>
			<form action="noticeList" id="noticeSearch">
				<div id="noticeKeyword" style="text-align:right; display: none;">
					<input type="text" name="keyword" required="required" placeholder="검색"> 
					<i class="fa fa-search" onclick="searchBtn()"></i>
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
		// 글쓰기 버튼(공지/스터디)
		// 스터디게시판 좋아요 테이블
		// 검색필터
		$(document).ready(function() {
			if(loc.indexOf('noticeList') === 0) {
				$("#notice-btn").css("background", "#0652DD");
				$("#WriteBtnDiv1").css("display", "inline");
				$(".board-only").hide();
				$("#noticeKeyword").css("display", "block");
			}
			if(loc.indexOf('boardList') === 0) {
				$("#board-btn").css("background", "#0652DD");
				$("#WriteBtnDiv2").css("display", "inline");
				$(".board-only").show();
				$("#boardKeyword").css("display", "block");
				
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
		//검색
		function searchBtn() {
			var formTag1 = document.getElementById("boardSearch");
			var formTag2 = document.getElementById("noticeSearch");
			if(loc.indexOf('boardList')===0) {
				formTag1.submit();
			} else {
				formTag2.submit();
			}
		}		
		
	</script>
		
	
</body>
	
</html>