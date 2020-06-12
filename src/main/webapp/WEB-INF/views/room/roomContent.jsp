<%@page import="oracle.java.s20200502.room.model.Room"%>
<%@page import="oracle.java.s20200502.main.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/roomcontent.css">

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">


<style>
.star {
	width: 50px;
	height: 50px;
}
th, td {
	text-align: center;
}

.form-inline .form-control {
	width: 40vw;
}

.main_slide {
	position: relative;
	left: 50px;
}

#title_style {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 40px;
}

.right_menu {
	position: relative;
	left: 650px;
	bottom: 350px;
}
</style>
<%
	String context = request.getContextPath();
	System.out.println("context->" + context);
%>
<script type="text/javascript">
   
	var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date();//today의 Date를 세어주는 역할
	function prevCalendar() {//이전 달
		// 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate());
		buildCalendar(); //달력 cell 만들어 출력 
	}

	function nextCalendar() {//다음 달
		// 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		buildCalendar();//달력 cell 만들어 출력
	}
	function buildCalendar() {//현재 달 달력 만들기
		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		//이번 달의 첫째 날,
		//new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
		//new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
		//왜냐면 getMonth()는 0~11을 반환하기 때문
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		//이번 달의 마지막 날
		//new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
		//day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
		//대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
		var tbCalendar = document.getElementById("calendar");
		//날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
		var tbCalendarYM = document.getElementById("tbCalendarYM");
		//테이블에 정확한 날짜 찍는 변수
		//innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
		//new를 찍지 않아서 month는 +1을 더해줘야 한다. 
		tbCalendarYM.innerHTML = today.getFullYear() + "년 "
				+ (today.getMonth() + 1) + "월";

		/*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
		while (tbCalendar.rows.length > 2) {
			//열을 지워줌
			//기본 열 크기는 body 부분에서 2로 고정되어 있다.
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
			//테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
			//30일 이후로 담을달에 순서대로 열이 계속 이어진다.
		}
		var row = null;
		row = tbCalendar.insertRow();
		//테이블에 새로운 열 삽입//즉, 초기화
		var cnt = 0;// count, 셀의 갯수를 세어주는 역할
		// 1일이 시작되는 칸을 맞추어 줌
		for (i = 0; i < doMonth.getDay(); i++) {
			/*이번달의 day만큼 돌림*/
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
		}
		/*달력 출력*/
		for (i = 1; i <= lastDate.getDate(); i++) {
			//1일부터 마지막 일까지 돌림
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cell.innerHTML = "<input type='button' id=date"+i+" value="+i+"  onclick='kkk("+i+")' class='button' style='color:white;'>"//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌

			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
			if (cnt % 7 == 1) {/*일요일 계산*/
				//1주일이 7일 이므로 일요일 구하기
				//월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
			cell.innerHTML = "<input type='button' id=date"+i+" value="+i+"  onclick='kkk("+i+")' class='button' style='color:red;'>"//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
				//1번째의 cell에만 색칠
			}
			if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
				//월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
			cell.innerHTML = "<input type='button' id=date"+i+" value="+i+"  onclick='kkk("+i+")' class='button' style='color:skyblue;'>"//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
				//7번째의 cell에만 색칠
				row = calendar.insertRow();
				//토요일 다음에 올 셀을 추가
			}
			/*오늘의 날짜에 노란색 칠하기*/
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) {
				//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
				cell.bgColor = "#A43BE6";//셀의 배경색을 노랑으로 
			}
			

		}

	}


   function kkk(vday) {
	    var tRe_morning = document.getElementById('tRe_morning');
	    var tRe_afternoon = document.getElementById('tRe_afternoon');
	    var tRe_night = document.getElementById('tRe_night');
	    var toMon = today.getMonth()+1;
		var toMonStr = "";
		var toDayStr = "";
		if(toMon < 10){
			toMonStr = '0'+toMon;
		} else {
			toMonStr = ''+toMon;
		}
		if(vday < 10){
			toDayStr = '0'+vday;
		} else {
			toDayStr = ''+vday;
		}
        var calDay = today.getFullYear()+toMonStr+toDayStr;
        var vro_num =1;//나중에 파라미터로 전환
	    $('#select_date').html(calDay);         /* span  id Tag */
	    $('#re_rvDate').val(calDay);      /*	 input Tag */
		$.ajax({
			url:"<%=context%>/resv/reservation",
			data:{ro_num   : vro_num,
				  re_rvdate : calDay
			     },
			dataType:'json',
			success:function(data){
				/*  alert(".ajax getDept Data"+data);  */
				str   = data.re_morning + " " + data.re_afternoon + " " + data.re_night;
/* 				$('#RestDept1').val(str);       input Tag 
				$('#RestDept2').val(str);      input Tag  
                $('#select_date').html(calDay);         /* span  id Tag */
                
                if (data.re_morning == 0) {
        	               tRe_morning.innerHTML = "<label class='btn btn-primary'><input type='radio' name='re_when' value='morning' id='jb-radio-1'>아침</label>";
 			    } else {
 	       	           tRe_morning.innerHTML = "아침";
 			    }
                if (data.re_afternoon == 0) {
        	               tRe_afternoon.innerHTML = "<label class='btn btn-primary'><input type='radio' name='re_when' value='after' id='jb-radio-1'>점심</label>";
 			    } else {
 	       	           tRe_afternoon.innerHTML = "점심";
 			    }
                if (data.re_night == 0) {
        	               tRe_night.innerHTML = "<label class='btn btn-primary'><input type='radio' name='re_when' value='night' id='jb-radio-1'>저녁</label>";
 			    } else {
 	       	           tRe_night.innerHTML = "저녁";
 			    }


 			}
		});
	}
	//삭제 확인
	function delete_confirm(){
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href='roomDelete?ro_num=${room.ro_num}';
		}else {
			return;
		}
	}
  
</script>
<title>스터디룸 상세페이지</title>
</head>
<body>
	<div class="container">
		<div>
			<!-- 점보트론 -->
			<div class="jumbotron" style="min-width: 100%;">
				<div class="row">
					<div class="col-lg-6">
						<!-- 왼쪽 -->
						<p id="title_style">${room.ro_title }</p>
						<div id="demo" class="carousel slide" data-ride="carousel">
							<div class="main_slide" style="width: 400px;">
								<div class="carousel-inner">
									<a class="carousel-control-prev" href="#demo" data-slide="prev">
										<span class="carousel-control-prev-icon"></span>
									</a>
									<ul class="carousel-indicators">
										<li data-target="#demo" data-slide-to="0" class="active"></li>
										<li data-target="#demo" data-slide-to="1"></li>
										<li data-target="#demo" data-slide-to="2"></li>
									</ul>
									<div class="carousel-item active">
										<c:forEach items="#{roomImg }" var="img">
											<c:if test="${img.i_seq == 1}">
												<img
													src="${pageContext.request.contextPath }/upload/${img.i_contentImg}"
													alt="Place" width="500px" height="400px">
											</c:if>
										</c:forEach>
									</div>
									<div class="carousel-item ">
										<c:forEach items="#{roomImg }" var="img">
											<c:if test="${img.i_seq == 2}">
												<img
													src="${pageContext.request.contextPath }/upload/${img.i_contentImg}"
													alt="Place" width="500px" height="400px">
											</c:if>
										</c:forEach>
									</div>
									<div class="carousel-item">
										<c:forEach items="#{roomImg }" var="img">
											<c:if test="${img.i_seq == 3}">
												<img
													src="${pageContext.request.contextPath }/upload/${img.i_contentImg}"
													alt="Place" width="500px" height="400px">
											</c:if>
										</c:forEach>
									</div>
									<a class="carousel-control-next" href="#demo" data-slide="next">
										<span class="carousel-control-next-icon"></span>
									</a>
								</div>
							</div>


						</div>

						<div class="right_menu"></div>


						지역 : ${room.ro_loc }<br> 
						방번호 : ${room.ro_num }<br> 
						멤버번호 : ${room.m_num }<br> 
						방내용 : ${room.ro_content }<br> 
						조회수 : ${room.ro_hit }<br> 
						이용료(오전) : ${room.ro_mReservation }<br>
						이용료(오후) : ${room.ro_aftReservation }<br> 
						이용료(저녁) : ${room.ro_nitReservation }<br>
						
						별점 평균 : ${scoreAvg }<br>
						<c:choose>
							<c:when test="${scoreAvg >= 5 }"><c:forEach begin="0" end="4"><img class="star" src="resources/Image/fullstar.png" alt="별점"></c:forEach></c:when>
							<c:when test="${scoreAvg >= 4 }"><c:forEach begin="0" end="3"><img class="star" src="resources/Image/fullstar.png" alt="별점"></c:forEach><c:forEach begin="0" end="0"><img class="star" src="resources/Image/emptystar.png" alt="별점"></c:forEach></c:when>
							<c:when test="${scoreAvg >= 3 }"><c:forEach begin="0" end="2"><img class="star" src="resources/Image/fullstar.png" alt="별점"></c:forEach><c:forEach begin="0" end="1"><img class="star" src="resources/Image/emptystar.png" alt="별점"></c:forEach></c:when>
							<c:when test="${scoreAvg >= 2 }"><c:forEach begin="0" end="1"><img class="star" src="resources/Image/fullstar.png" alt="별점"></c:forEach><c:forEach begin="0" end="2"><img class="star" src="resources/Image/emptystar.png" alt="별점"></c:forEach></c:when>
							<c:when test="${scoreAvg >= 1 }"><c:forEach begin="0" end="0"><img class="star" src="resources/Image/fullstar.png" alt="별점"></c:forEach><c:forEach begin="0" end="3"><img class="star" src="resources/Image/emptystar.png" alt="별점"></c:forEach></c:when>
							<c:when test="${scoreAvg >= 0 }"><c:forEach begin="0" end="4"><img class="star" src="resources/Image/emptystar.png" alt="별점"></c:forEach></c:when>
						</c:choose>
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
						<div id="map" style="width: 450px; height: 500px;"></div>
						<c:if test="${memberInfo != null }">
							<% 
							Member member = (Member)session.getAttribute("memberInfo"); 
							Room room = (Room)request.getAttribute("room");
							int m_num1 = member.getM_num();
							int m_num2 = room.getM_num();
							int m_type = member.getM_type();
							
							if(m_num1 == m_num2 || m_type == 2) { %>
								<button class="btn btn-primary" type="button" onclick="location.href='roomUpdateGo?ro_num=${room.ro_num}'">수정하기</button>
								<button class="btn btn-primary" type="button" onclick="delete_confirm()">삭제하기</button>						
							<%
							}
							%>							
						</c:if>
						<c:if test="${memberInfo.m_type == 2 }">
							<button class="btn btn-primary" type="button" onclick="location.href='contentUp?ro_num=${room.ro_num}'">방승인하기</button>
							<button class="btn btn-primary" type="button" onclick="location.href='contentDown?ro_num=${room.ro_num}'">방블라인드</button>
						</c:if>
					</div>
					<!-- 왼쪽닫기 -->

					<div class="col-lg-6">
						<!-- 달력+예약리스트 -->
						<div class="mini-calendar">
							<table id="calendar" border="3" align="center"
								style="border-color: #020202">
								<tr>
									<!-- label은 마우스로 클릭을 편하게 해줌 -->
									<td><label onclick="prevCalendar()">< </label></td>
									<td align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</td>
									<td><label onclick="nextCalendar()">> </label></td>
								</tr>
								<tr class="aa">
									<td align="center" onclick="kkk(2)"><font color="red">일</td>
									<td align="center">월</td>
									<td align="center">화</td>
									<td align="center">수</td>
									<td align="center">목</td>
									<td align="center">금</td>
									<td align="center"><font color="skyblue">토</td>
								</tr>
							</table>
							<script language="javascript" type="text/javascript">
						buildCalendar();//
				</script>
						</div>

						<div class="reserve-container">


							<div class="time-part">
								<div class="reserve-title">시간</div>
								<div class="time_select">
									<br> 예약일시:
									<div id="select_date"></div>

									<br> <br> 시간을 골라보십쇼!
									<form action="reservationCheck">
										<input type="hidden" name="ro_num" value="${room.ro_num }">
										<input type="hidden" name="ro_title" value="${room.ro_title }">
										<input type="hidden" name="m_num" value="${room.m_num }">
										<input type="hidden" name="ro_mReservation" value="${room.ro_mReservation }">
										<input type="hidden" name="ro_aftReservation" value="${room.ro_aftReservation }">
										<input type="hidden" name="ro_nitReservation" value="${room.ro_nitReservation }">
										<input type="hidden" name="re_rvDate" id="re_rvDate">
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<div id="tRe_morning"></div>
											<div id="tRe_afternoon"></div>
											<div id="tRe_night"></div>
										</div>
										<br> <br>
										<div class="reserve-title">예약자 정보</div>
										<br>
										<div class="infoConfirm">
											회원 아이디: <input type="text" name="m_email"
												value="${member.m_email }" id="m_email"><br> <br>
											<br> 회원 이름: <input type="text" name="m_nickname"
												value="${member.m_nickname }" id="m_nickname"><br>
											<br> <br> 휴대폰 번호:<input type="text" name="m_phone"
												value="${member.m_phone}" id="m_phone"><br> <br>
											<br>
											<%-- 	결제 할 금액:<input type="text" name="re_totalcost" value="${reservation.re_totalcost }" id="re_totalcost"><br>   --%>
											<br> <br>

										</div>
										<input id="reserveGo" type="submit" value="예약하기">
									</form>
								</div>

							</div>
						</div>



						<!-- 오른쪽 -->

					</div>

				</div>
			</div>
		</div>
		<!-- row 태그 -->
	</div>

</body>
<!-- 결제 api -->

<script type="text/javascript">
	var mapDiv = document.getElementById('map');
	
	var map = new naver.maps.Map('map', {center : new naver.maps.LatLng(${room.ro_spot1},${room.ro_spot2}), zoom : 17,minZoom : 7,
		
		zoomControl: true, //컨트롤 표시 여부
		zoomControlOptions: {
			position: naver.maps.Position.TOP_RIGHT 
			}
		});
	
	
	var marker = new naver.maps.Marker({position : new naver.maps.LatLng(${room.ro_spot1},${room.ro_spot2}), map : map});
	var $window = $(window);
	
	function getMapSize() {
		var size = new naver.maps.Size($window.width() - 15,
					$window.height() - 15);
	
			return size;
	};
	
	$window.on('resize', function() {
			map.setSize(getMapSize());
	});
	</script>
</html>



