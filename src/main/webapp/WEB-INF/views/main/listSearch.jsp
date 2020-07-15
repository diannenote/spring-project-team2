<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트 검색</title>
<style>
body {
	font-family: BMDOHYEON_TTF; 
}
.hangang {
	font-family: SEOULHANGANGB;
}
.jalnan {
	font-family: JALNAN;
}
</style>
</head>
<body>
<!-- 방 게시판 검색 결과 -->
	<article>
	<div class="container">
		<!-- 점보트론 -->
		<div class="jumbotron center-block" style="min-width: 100%;">
			<h2>방 게시판에서 "${keyword }"검색결과</h2>
			<div class="row">
			<c:choose>
				<c:when test="${empty listSearch }">
					<tr>
						<td colspan="5" align="center">검색 결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:when test="${!empty listSearch}">
					<c:forEach var="SearchRoomList" items="${listSearch }">
						<div class="room_box" class="col-sm-3 col-md-3" style="width: 30%; float:none; margin:0 auto">
							<div class="room_item" class="thumbnail">
								<a href="roomContent?ro_num=${SearchRoomList.ro_num }">
										<br> 
																				<img width="300px" height="200px" src="${pageContext.request.contextPath }
										/upload/${SearchRoomList.ro_img }"  alt="img">
										<br>
										<p>${SearchRoomList.ro_title }</p>
								</a>
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
			</div>
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
			<c:if test="${roomListPG.startPage > roomListPG.pageBlock }">
				<a href="listSearch?currentPage=${i}&keyword=${roomListPG.startPage-roomListPG.pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${roomListPG.startPage }" end="${roomListPG.endPage }">
				<a href="listSearch?currentBlock=1&currentPage=${i}&keyword=${keyword}">[${i}]</a>
			</c:forEach>
			<c:if test="${roomListPG.endPage < roomListPG.totalPage }">
				<a href="listSearch?currentPage=${i}&keyword=${roomListPG.startPage+roomListPG.pageBlock}">[다음]</a>
			</c:if>
			</ul>
			</nav>
			</div>
		</div>
	</div>
	</article>


<!-- 커뮤니티 게시판 검색 결과 -->
	<article>
	<div class="container">
		<div class="table-responsive">
			<h2>커뮤니티 게시판에서 "${keyword }" 검색결과</h2>
			<table class="table-striped table-sm">
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: auto;" />
					<col style="width: 15%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty boardSearchList }">
							<tr>
								<td colspan="5" align="center">검색 결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty boardSearchList}">
							<c:forEach var="board" items="${boardSearchList }">
								<tr>
									<td><a href="board/boardContent?b_num=${board.b_num}">${board.b_num}</a></td>
									<td><a href="board/boardContent?b_num=${board.b_num}">${board.b_title}</a></td>
									<td>${board.m_num}</td>
									<td>${board.b_regDate}</td>
									<td>${board.b_hit}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
			<c:if test="${boardListPG.startPage > boardListPG.pageBlock }">
				<a href="listSearch?currentPage=${i}&keyword=${boardListPG.startPage-boardListPG.pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${boardListPG.startPage }" end="${boardListPG.endPage }">
				<a href="listSearch?currentBlock=2&currentPage=${i}&keyword=${keyword}">[${i}]</a>
			</c:forEach>
			<c:if test="${boardListPG.endPage < boardListPG.totalPage }">
				<a href="listSearch?currentPage=${i}&keyword=${boardListPG.startPage+boardListPG.pageBlock}">[다음]</a>
			</c:if>
			</ul>
			</nav>

		</div>
	</div>
	</article>
</body>
</html>