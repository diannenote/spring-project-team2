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
.container {
	width: 100%;
	height: 100%;
}
.paging {
	width: 150px;
	height: 50px;
	margin-left: auto;
	margin-right: auto;
}
.paging li {
	list-style: none;
	float: left;
	text-align: center;
	margin-left: 20px;
}
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
.table td:hover {
	background-color: #ddd;
}

a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: black;}
a:hover {text-decoration: none; color: black;}

body {
	font-family: BMDOHYEON_TTF; 
	background-color: #f8f9fa;
}
#hangang {
	font-family: SEOULHANGANGB;
}
#jalnan {
	font-family: JALNAN;
}
#room_list {
	padding: 0px 0 0 0px;
}
.room_items {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	float: left;
	margin-left: 7px;
	margin-top: 10px;
	width: 280px;
	max-height: 100%;
}
.room_items li {
	margin-top: 3px;
	list-style: none;
}
.room_items img {
	width: 240px;
	height: 190px;
	border: solid white 1px;
	border-radius: 10px;
}
#room_box {
	position: relative;
	right: 50px;
	width: 1200px;
	height: 1100px;
	border: 1px solid white;
	border-radius: 10px;
	margin-bottom: 100px;
	background-color: #ddd;
	padding-top: 30px;
	padding-bottom: 30px;	
	text-align: center;
}
</style>
<title>관리자</title>
</head>
<body> 
<div class="container">
	<h3 class="jalnan" style="text-align: center; margin: 15px;">스터디룸 승인</h3>
	<div id="recipe_box">
		<div id="room_box">
			<div id="room_list">
				<c:forEach items="${list }" var="room" >
					<div class="room_items">
						<ul>
							<a href="roomContent?ro_num=${room.ro_num }">
								<label class="listItem">
									<li><img src="${pageContext.request.contextPath}/upload/${room.ro_img}" width="250px" height="200px" alt="..."></li>
									<li id="hangang"><b>${room.ro_title }</b></li>
								</label>
							</a>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="paging">
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
	</div><!-- box -->
</div>
</body>
</html>



