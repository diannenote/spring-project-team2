<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<style>
th, td {
	text-align: center;
}

.form-inline .form-control {
width: 40vw;
}
.btn_location .txt_location {
padding: 10px 0 8px;
margin-left: 6px;
position: relative;
bottom: 30px;
left: 800px;
}
</style>
<title>관리자 사이트</title>
</head>
<body> 
<div class="container">
	<div>
		<!-- 점보트론 -->
		<div class="jumbotron" style="min-width: 100%;">
			<div class="btn_area">
				<!-- <a role="button" class="btn_location" href="map">
					<span class="txt_location"><img alt="map" src="resources/Image/map.png"> 지도</span>
				</a> -->
				<div class="row">
					<c:forEach items="${list }" var="room" >
						<div class="col-sm-6 col-md-3  ">
							<div class="thumbnail">
								<c:if test="${room.ro_level == 1 }">
									<a href="roomContent?ro_num=${room.ro_num }" class="thumbnail">
										<label>
											<img src="${pageContext.request.contextPath}/upload/${room.ro_img}" width="250px" height="200px" alt="...">
											<p>${room.ro_title }</p>
										</label>
									</a>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<c:if test="${pg.startPage > pg.pageBlock }">
				<a href="roomList?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
				<a href="roomList?currentPage=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${pg.endPage < pg.totalPage }">
				<a href="roomList?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
			</c:if>
		</div>
		<div class="room_box">
			<div class="room_item"></div>
		</div>
	</div>
</div>
</body>
</html>


