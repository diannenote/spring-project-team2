<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<style>
body {
	font-family: BMDOHYEON_TTF; 
	background-color: #f8f9fa;
}
.hangang {
	font-family: SEOULHANGANGB;
}
.jalnan {
	font-family: JALNAN;
}
th, td {
	text-align: center;
}
.itemTable tr:hover td{
	background-color: #ddd;
}
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: black;}
a:hover {text-decoration: none; color: black;}
.resBox {
	width: 1100px;
	min-height: 500px;
	border: 1px #ddd solid; 
	margin: auto;
	margin-top: 20px;
	padding: 20px;
}
.itemTable {
	width: 1050px;
	height: 100%;
}
.resItems {
	margin-top: 3px;
}
.tr {
	margin-top: 3px;
	padding-top: 3px;
}
</style>
<title>공부하랑 나의 예약현황</title>
</head>
<body> 
<div class="container">
	<h3 class="jalnan" style="text-align:center; margin-top: 30px;">나의 예약 현황</h3>
	<div class="resBox">
		<div class="resList">
			<div class="resItems">
				<table class="itemTable">
					<tr>
						<th>예약 번호</th><th>스터디룸 명</th><th>예약자</th><th>예약 가격</th><th>예약 날짜</th><th>예약 시간</th>
					</tr>
					<c:forEach items="${reservation }" var="list">
						<tr class="tr">
							<td>${list.re_num }</td>
							<td><a href="roomContent?ro_num=${list.ro_num }">${list.ro_title }</a></td>
							<td>${list.m_nickname }</td><td>${list.re_totalCost }</td><td>${list.re_rvDate }</td>
							<c:choose>
								<c:when test="${list.re_morning == 1 }"><td>오전</td></c:when>
								<c:when test="${list.re_afternoon == 1 }"><td>오후</td></c:when>
								<c:when test="${list.re_night == 1 }"><td>밤</td></c:when>
							</c:choose>
						</tr>	
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>



