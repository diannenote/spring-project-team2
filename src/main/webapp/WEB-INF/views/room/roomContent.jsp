<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
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
<!-- <script>
	$(function() {
		$("#pw1, #pw2").keyup(function() {
			var pw1Value = $("#pw1").val();
			var pw2Value = $("#pw2").val();

			if (pw1Value != pw2Value) {
				$("#message").text("패스워드가 일치하지 않습니다.");
			} else {
				$("#message").text("패스워드가 일치합니다.");
			}
		})
	});
</script> -->
<title>관리자 사이트</title>
<script>
$(function() {
    $("#오전").on("click", function() {
        $.ajax({
        	url: "Mcalendar",
        	data: {ro_num: ${room.ro_num }}
        })
        .done(function() {
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
	<%-- <%
		Object userID = null;
		if (session.getAttribute("loginUser") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='../login/login'");
			script.println("</script>");
		} else if (session.getAttribute("loginUser") != null) {
			userID = session.getAttribute("loginUser");
		}
	%> --%>
	<!-- 네비게이션 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="roomList">공부하랑</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynav1">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- id값으로 위의 navbar-toggler와 묶여짐 (collapse) -->
		<div class="collapse navbar-collapse" id="mynav1">   
			<ul class="navbar-nav mr-auto ml-auto">       <!-- mr -> margin right -->
				<!-- <li class="nav-item active">
					<a class="nav-link" href="#">메뉴1</a>
				</li>
				메뉴 드롭다운
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">드롭다운 메뉴</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">드롭1</a> 
							<a class="dropdown-item" href="#">드롭2</a> 
							<a class="dropdown-item" href="#">드롭3</a>
						</div>
				</li> -->
				<li>
					<form class="form-inline" action="#" method="post">
						<input class="form-control" type="search" placeholder="검색">
						<button class="btn btn-light" type="submit">검색</button>
					</form>
				</li>
			</ul>
			<ul class="navbar-nav">
<%-- 				<%
					if (userID == null) {
				%> --%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">접속하기</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="roomLogin">로그인</a> 
							<a class="dropdown-item" href="roomJoin">회원가입</a>
							<a class="dropdown-item" href="roomInsertGo">방등록</a>
						</div>
				</li>
<%-- 				<%
					} else {
				%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown">회원관리</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">마이페이지</a>
							<c:url value="/login/logout" var="logoutUrl" />
							<a class="dropdown-item" href="#">로그아웃</a>
						</div>
				</li>
				<%
					}
				%> --%>
			</ul>
		</div>
	</nav>

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
			<button class="btn btn-primary" type="button" onclick="location.href='roomUpdateGo?ro_num=${room.ro_num}'">수정하기</button>
			<button class="btn btn-primary" type="button" onclick="location.href='roomDelete?ro_num=${room.ro_num}'">삭제하기</button>
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



