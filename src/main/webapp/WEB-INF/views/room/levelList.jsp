<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<!-- 제이쿼리 (부트스트랩보다 위로) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>관리자 사이트</title>
</head>
<body>
	<div class="container">
		<div>
			<!-- 점보트론 -->
			<div class="jumbotron" style="min-width: 100%;">
				<c:forEach items="${list }" var="room">
					<c:if test="${room.ro_level == 0 }">
						<div class="room_box">
							<div class="room_item">
								<label>
									<a href="roomContent?ro_num=${room.ro_num }">
									${room.ro_num }
									<img src="${pageContext.request.contextPath }/upload/${room.ro_img }" alt="img">
									</a>
								</label>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="levelList?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
					<a href="levelList?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="levelList?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>



