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

<style>
th, td {
	text-align: center;
	border: 1px solid black;
}
</style>
<title>관리자 사이트</title>
<script>
$(function() {
    $("#오전").on("click", function() {
        $.ajax({
        	url: "Mcalendar",
        	data: {ro_num: ${room.ro_num }}
        })
        ne(function() {
            $("#calendar").html()
        })
    });
    $("#오후").on("click", function() {
    	$.ajax({
        	url: "Acalendar",
        	data: {ro_num: ${room.ro_num }}
        })
    });
    $("#밤").on("click", function() {
    	$.ajax({
        	url: "Ncalendar",
        	data: {ro_num: ${room.ro_num }}
        })
    });
});
</script>
</head>
<body>
	<div class="container">
		<!-- 점보트론 -->
		<div class="jumbotron" style="min-width: 100%;">
			<div class="room_box">
				<div class="room_item">
					방번호 : ${room.ro_num }<br>
					멤버번호 : ${room.m_num }<br>
					방제목 : ${room.ro_title }<br>
					방내용 : ${room.ro_content }<br>
					조회수 : ${room.ro_hit }<br>
					위도 : ${room.ro_spot1 }<br>
					경도 : ${room.ro_spot2 }<br>
					오전가 : ${room.ro_mReservation }<br>
					오후가 : ${room.ro_aftReservation }<br>
					밤가 : ${room.ro_nitReservation }<br>
					<c:forEach items="#{roomImg }" var="img">
						<img src="${pageContext.request.contextPath }/upload/${img }" alt="img">
					</c:forEach>
				</div>
			</div>
			<button class="btn btn-primary" type="button" onclick="location.href='updateGo?ro_num=${room.ro_num}'">수정하기</button>
			<button class="btn btn-primary" type="button" onclick="location.href='delete?ro_num=${room.ro_num}'">삭제하기</button>
			<!-- 예약 -->
			<div class="calendar">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-primary active"> 
					<input type="radio" id="오전" checked >오전
				</label> 
				<label class="btn btn-primary"> 
					<input type="radio" id="오후">오후
				</label>
				<label class="btn btn-primary"> 
					<input type="radio" id="밤">밤
				</label>
				</div>
				<table style="border:1px solid black; width:800px; height:700px;" id="calendar">
					<tr>
						<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
					</tr>
					<tr>
						<td></td>
						<td name="day" value="0601">1<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="0602">2<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="0603">3<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="0604">4<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="0605">5<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="0606">6<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
					</tr>
					<tr>
						<td name="day" value="0607">7<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="0608">8<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="0609">9<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06010">10<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06011">11<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06012">12<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06013">13<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
					
					</tr>
					<tr>
						<td name="day" value="06014">14<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						
						<td name="day" value="06015">15<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						
						<td name="day" value="06016">16<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						
						<td name="day" value="06017">17<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						
						<td name="day" value="06018">18<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						
						<td name="day" value="06019">19<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						
						<td name="day" value="06020">20<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
					</tr>
					<tr>
						<td name="day" value="06021">21<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06022">22<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06023">23<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06024">24<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06025">25<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06026">26<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06027">27<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
					</tr>
					<tr>
						<td name="day" value="06028">28<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06029">29<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td name="day" value="06030">30<br><c:if test="${reservation.re_morning > 1 }">예약중</c:if>
														 <c:if test="${reservation.re_morning < 1 }">예약가능</c:if></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>



