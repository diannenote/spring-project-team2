<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String context = request.getContextPath();
%>
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
<script>
//실시간 예약 BootStrap modal Show
$(document).on('click', '.roomReserveListModal', function() {
	var roomNo = ${room.ro_num }
	$('#roomReserveNo').val(roomNo);
	$('#ddayYear').val(0);
	$('#ddayMonth').val(0);
	var ddayOption = 'default';
	var ddayYear = $('#ddayYear').val();
	var ddayMonth = $('#ddayMonth').val();
	reserveCalendar(roomNo, ddayYear, ddayMonth, ddayOption);
	$("#roomReserveListModal").modal('show');
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
/* function reserveCalendar(roomNo, ddayYear, ddayMonth, ddayOption) {
	alert("나는 리저브캘린더의 룸넘 -> " + roomNo);
	$.ajax({
		url : "calendar",
		data : {roomNo:roomNo, ddayYear:ddayYear, ddayMonth:ddayMonth, ddayOption:ddayOption},
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
} */
function reserveCalendar(roomNo, ddayYear, ddayMonth, ddayOption) {
	console.log("나는 리저브캘린더의 룸넘 -> " + roomNo);
	console.log("나는 리저브캘린더의 data -> " + roomNo, ddayYear, ddayMonth, ddayOption);
	$.ajax({
		url : "calendar",
		data : {roomNo:roomNo, ddayYear:ddayYear, ddayMonth:ddayMonth, ddayOption:ddayOption},
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
	
	alert("나는 캘린더어펜드의 룸넘 -> " + roomNo);
	console.log("나는 캘린더어펜드의 룸넘 -> " + roomNo);
	
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
					별점평균 : ${scoreAvg }<br>
					<c:forEach items="#{roomImg }" var="img">
						<img src="${pageContext.request.contextPath }/upload/${img }" alt="img"><br>
						${pageContext.request.contextPath }<br>
						${img }<br>
					</c:forEach>
				</div>
			</div>
			<button class="btn btn-primary" type="button"
				onclick="location.href='roomUpdateGo?ro_num=${room.ro_num}'">수정하기</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='roomDelete?ro_num=${room.ro_num}'">삭제하기</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='contentUp?ro_num=${room.ro_num}'">방승인하기</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='contentDown?ro_num=${room.ro_num}'">방블라인드</button>
			<!-- 예약 -->
			<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#roomReserveListModal"> Modal 띄우기 </button> -->
<!--  -->	<button class="roomReserveListModal btn btn-primary" type="button">클릭</button>
			<div class="modal fade" id="roomReserveListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
														<button type="button" class="fc-button-prev fc-corner-left btn btn-primary btn-sm calendarMoveBtn" ddayOption="prev">
															<i class="fa fa-chevron-left"></i>이전 달
														</button>
														<button type="button" class="btn btn-primary btn-sm calendarMoveBtn" ddayOption="next">
															<i class="fa fa-chevron-right"></i>다음 달
														</button>
													</div>
												</td>
												<td class="fc-header-center"><span
													class="fc-header-title">
														<h2 id="calendarTitle">2020년 5월</h2>
												</span></td>
												<td class="fc-header-right"></td>
											</tr>
										</tbody>
									</table>
									<div class="fc-content"
										style="position: relative; min-height: 1px;">
										<div class="fc-view fc-view-month fc-grid" style="position: relative; min-height: 1px;" unselectable="on">
											<table class="fc-border-separate" cellspacing="0">
												<thead>
													<tr class="fc-first fc-last">
														<th class="fc-day-header fc-sun fc-widget-header fc-first" style="width: 158px;">Sun</th>
														<th class="fc-day-header fc-mon fc-widget-header" style="width: 158px;">Mon</th>
														<th class="fc-day-header fc-tue fc-widget-header" style="width: 158px;">Tue</th>
														<th class="fc-day-header fc-wed fc-widget-header" style="width: 158px;">Wed</th>
														<th class="fc-day-header fc-thu fc-widget-header" style="width: 158px;">Thu</th>
														<th class="fc-day-header fc-fri fc-widget-header" style="width: 158px;">Fri</th>
														<th class="fc-day-header fc-sat fc-widget-header fc-last" style="width: 158px;">Sat</th>
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
			<div class="review">
				<form action="roomReview" method="post">
					<input type="hidden" name="ro_num" value="${room.ro_num }">
					<!-- <input type="hidden" name="m_num" value=""> -->
					<textarea name="review">리뷰를 작성하세요</textarea>
					<select name="star">
						<option value="1">1점</option>
						<option value="2">2점</option>
						<option value="3">3점</option>
						<option value="4">4점</option>
						<option value="5">5점</option>
					</select>
					<input type="submit" value="리뷰제출">
				</form>
			</div>
			<div class="review">
				<c:forEach items="${roomReview }" var="userReview">
					리뷰 번호: ${userReview.rv_num }<br>
					리뷰 작성자: ${userReview.m_num }<br>
					리뷰: ${userReview.rv_userReview }<br>
					리뷰 점수: ${userReview.rv_score }<br>
					<p><br>
				</c:forEach>
			</div>
		</div><!-- 점보트론 -->
	</div>
</body>
</html>



