<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String context = request.getContextPath();
%>
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
<script>
//실시간 예약 BootStrap modal Show
$(document).on('click', '.roomReserveListModal', function() {
	var roomNo = ${room.ro_num }
	alert("modal show 앞 룸넘 -> "+roomNo);
	$('#roomReserveNo').val(roomNo);
	$('#ddayYear').val(0);
	$('#ddayMonth').val(0);
	var ddayOption = 'default';
	var ddayYear = $('#ddayYear').val();
	var ddayMonth = $('#ddayMonth').val();
	reserveCalendar(roomNo, ddayYear, ddayMonth, ddayOption);	
	$("#roomReserveListModal").modal('show');
	alert("modal show 뒤 룸넘 -> "+roomNo);
});
//달력 month 변경
$(document).on('click', '.calendarMoveBtn', function() {
	var roomNo = ${room.ro_num }
	var ddayOption = $(this).attr('ddayOption');
	var ddayYear = $('#ddayYear').val();
	var ddayMonth = $('#ddayMonth').val();
	reserveCalendar(roomNo, ddayYear, ddayMonth, ddayOption);
});
//달력 load function
function reserveCalendar(roomNo, ddayYear, ddayMonth, ddayOption) {
	$.ajax({
		url : "<%=context%>/calendar",
		type : "POST",
		data : {roomNo, ddayYear:ddayYear, ddayMonth:ddayMonth, ddayOption:ddayOption},
		dataType : "json",
		success : function(data) {
			var html ="";
			var calendarTitle = data.ddayYear+"년 "+(data.ddayMonth+1)+"월";
			console.log("나는 아작스의 캘린더타이틀 -> " + calendarTitle);
			$("#calendarTitle").html(calendarTitle);
			var calendarList = data.calendarList;
			alert(calendarList);
			html = calenderAppend(calendarList);
			$('#calendarListTbody').html(html);
			$('#ddayYear').val(data.ddayYear);
			$('#ddayMonth').val(data.ddayMonth);
		}
	})
}
//달력 html
function calenderAppend(calendarList){
	var html = "";
	var roomNo = $('#roomReserveNo').val();
	var notThisMonthColor="#BDBDBD";
	var sundayColor="#FF0000";
	var weekdayColor="#000000";
	var saturdayColor="#0000FF";
	
	alert(roomNo);
	
	$.each(calendarList,function(key, item) {
        if(key%7==0){
			 html+= "<tr class='fc-week'>";
		}
		html+= "<td class='fc-day fc-widget-content'>";
		html+= "<div style='min-height: 80px;'>";
		html+= "<div class='fc-day-number' style='color:"
		//해당일수가 현재월에 포함되지않으면 색깔변경
        if(item.day > (key+1) || (key-item.day) > 27){
			html+=notThisMonthColor;
		}else{
            //요일에따른 색깔변경
			if(key%7==0){
				html+= sundayColor;
			}else if((key%7)>0 && (key%7)<6){
				html+= weekdayColor;
			}else if(key%7==6){
				html+= saturdayColor;
			}
		}
		html+=";font-weight:bold;'>"+item.day;
		html+="</div>";
		html+= "<div class='fc-day-content'>";
        //일수가 index+1보다 작거나같고 두 수의 차이가 27일보다 작으면..
		if(item.day <=(key+1) && (key-item.day)<27){
			if(item.reserveVo != null){
				html+="<h5 style='color:#FF0000;'>예약중</h5>";
			}else{
                //예약중이면 예약정보를 보여준다
				html+="<button type='button' class='btn btn-default'>예약</button>";
			}
		}
		html+= "<div style='position: relative; height: 25px;'></div>";
		html+= "</div>";
		html+= "</div>";
		html+= "</td>";
		if(key%7==6){
			 html+= "</tr>";
		}
	});
	return html;
}
</script>
<title>관리자 사이트</title>

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
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#mynav1">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- id값으로 위의 navbar-toggler와 묶여짐 (collapse) -->
		<div class="collapse navbar-collapse" id="mynav1">
			<ul class="navbar-nav mr-auto ml-auto">
				<!-- mr -> margin right -->
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
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					data-toggle="dropdown">접속하기</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="roomLogin">로그인</a> <a
							class="dropdown-item" href="roomJoin">회원가입</a> <a
							class="dropdown-item" href="roomInsertGo">방등록</a>
					</div></li>
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
					방번호 : ${room.ro_num }<br> 멤버번호 : ${room.m_num }<br> 
					방제목 : ${room.ro_title }<br> 방내용 : ${room.ro_content }<br> 
					조회수 : ${room.ro_hit }<br> 위도 : ${room.ro_spot1 }<br> 
					경도 : ${room.ro_spot2 }<br> 오전가 : ${room.ro_mReservation }<br>
					오후가 : ${room.ro_aftReservation }<br> 밤가 : ${room.ro_nitReservation }<br>
					<c:forEach items="#{roomImg }" var="img">
						<img src="${pageContext.request.contextPath }/upload/${img }"
							alt="img">
					</c:forEach>
				</div>
			</div>
			<button class="btn btn-primary" type="button"
				onclick="location.href='roomUpdateGo?ro_num=${room.ro_num}'">수정하기</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='roomDelete?ro_num=${room.ro_num}'">삭제하기</button>
			<!-- 예약 -->
			<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#roomReserveListModal"> Modal 띄우기 </button> -->
<!--  -->	<div class="roomReserveListModal">클릭</div>
			<div class="modal fade" id="roomReserveListModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="hidden" id="roomReserveNo" value=""> 
							<input type="hidden" id="ddayYear" value="0"> 
							<input type="hidden" id="ddayMonth" value="0">
							<div class="panel-body">
								<div class="calendar fc fc-ltr">
									<table class="fc-header" style="width: 100%">
										<tbody>
											<tr>
												<td class="fc-header-left">
													<div class="btn-group">
														<button type="button"
															class="fc-button-prev fc-corner-left btn btn-default btn-sm calendarMoveBtn"
															ddayOption="prev">
															<i class="fa fa-chevron-left"></i>

														</button>
														<button type="button"
															class="btn btn-default btn-sm calendarMoveBtn"
															ddayOption="next">
															<i class="fa fa-chevron-right"></i>

														</button>
													</div>
												</td>
												<td class="fc-header-center"><span
													class="fc-header-title">
														<h2 id="calendarTitle">May 2020</h2>
												</span></td>
												<td class="fc-header-right"></td>
											</tr>
										</tbody>
									</table>
									<div class="fc-content"
										style="position: relative; min-height: 1px;">
										<div class="fc-view fc-view-month fc-grid"
											style="position: relative; min-height: 1px;"
											unselectable="on">
											<table class="fc-border-separate" cellspacing="0">
												<thead>
													<tr class="fc-first fc-last">
														<th
															class="fc-day-header fc-sun fc-widget-header fc-first"
															style="width: 158px;">Sun</th>
														<th class="fc-day-header fc-mon fc-widget-header"
															style="width: 158px;">Mon</th>
														<th class="fc-day-header fc-tue fc-widget-header"
															style="width: 158px;">Tue</th>
														<th class="fc-day-header fc-wed fc-widget-header"
															style="width: 158px;">Wed</th>
														<th class="fc-day-header fc-thu fc-widget-header"
															style="width: 158px;">Thu</th>
														<th class="fc-day-header fc-fri fc-widget-header"
															style="width: 158px;">Fri</th>
														<th class="fc-day-header fc-sat fc-widget-header fc-last"
															style="width: 158px;">Sat</th>
													</tr>
												</thead>
												<tbody id="calendarListTbody">

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



