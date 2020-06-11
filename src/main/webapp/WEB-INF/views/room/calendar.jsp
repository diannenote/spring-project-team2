<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/reserve.css">
<link rel="stylesheet" href="css/header.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
* {	font-size: 11px;
}



.header-nav-wrapper {
	background: url(../images/bg_header.gif) repeat-x 0 0;
	background-position: center;
	background-size: contain;
	height: 120px;
	padding-top: 4px;
}

.header-nav-container {
	position: fixed;
}

.header {
	display: flex;
	justify-content: space-between;
	padding-left: 40px;
	padding-right: 150px;
}

.header-inner {
	display: flex;
}

.header-inner>div {
	border-right: 1px solid #DDDDDD;
	margin-left: 8px;
	padding-right: 4px;
}



.nav-line {
	background-color: red;
	border-radius: 50px;
	height: 5px;
  background-position: bottom;
  background-size: 15px 1px;
  background-repeat: repeat-x; 
}
.nav-wrapper {
	 background: url(../images/bg_header.gif) repeat-x 0 0; 
	 width: 100%;
	height: 94px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.nav-content {
	padding-top: 15px;
}

.studyroomLogo-wrapper {
	text-align: center;
}


.nav-inner {
	display: flex;
	margin-left: 150px;
	margin-right: auto;
	align-items: center;
	padding-bottom: 15px;
}

.nav-inner>div>button {
	padding-top: 5px;
	font-size: 14px;
	font-weight: bold;
	margin-left: 15px;
}

.search-wrapper {
	margin-left: 70px;
	height: 20px;
}

.search-wrapper>input {
	width: 100px;
	height: 20px;
}

.searchButton {
	margin: 0 !important;
	padding: 2px !important;
	background-color: red;
	color: white;
	width: 30px;
	height: 100%;
	font-size: 10px !important;
}


.reserve-container {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	height: 800px;
 
}

.reserve-container>div {
	border: 1px solid #dddddd;
}

.reserve-title {
	border-bottom: 1px solid #dddddd;
	background-color: #444444;
	text-align: center;
	color: #dddddd;
	padding: 5px;
	font-size: 13px;
	font-weight: bold;
}

.studyroom-part {
	width: 284px;
	position:relative;
	left:300px;
}

.studyroom-option {
	width: 264px;
}

.day-part {
	width: 91px;
}

.time-part {
	width: 384px;
	position:relative;
	left: 300px;
}

.sort-wrapper {
	margin: 10px 6px 6px 10px;
	display: flex;
	border-bottom: 1px solid #dddddd;
	font-size: 12px;
}

.sort-wrapper>div {
	padding: 3px;
}

.sort-wrapper>div:hover {
	border-bottom: 1px solid #111111;
}

.sort-selected {
	font-weight: bold;
	border-bottom: 1px solid #111111;
}

.sort-korean {
	margin-left: 6px;
}

.reserve-date {
	padding-top: 5px;
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 770px;
	overflow: scroll;
	overflow-x: hidden;
}

.studyroom-date-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 5px 2px;
}

.studyroom-week-of-day {
	margin-left: 5px;
	font-size: 10px;
	width: 12px;
	height: 22px;
	line-height: 22px;
}

.studyroom-day {
	text-align: center;
	width: 34px;
	height: 22px;
	font-size: 17px;
	font-weight: bold;
}

.saturday {
	color: #31597E;
	font-weight: bold;
}

.sunday {
	color: #AF2D2D;
	font-weight: bold;
}

.studyroom-date-wrapper-active {
	background-color: #333333;
}

.studyroom-date-wrapper-active>* {
	color: white;
}

.css_test {
	display: none;
} 
.mini-calendar{
position: relative;
left: 800px;
width: 900px;

}
.reserve-container{
width:600px;
position: relative;
left: 700px;


}
#calendar{
background-color:black;
color:white;
text-align:center;
width: 400px;
height: 200px;

}
td {
	width: 50px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-family: 굴림;
	border: 2px border-color:#020202;
	border-radius: 8px; /*모서리 둥글게*/
}
.button {

background: transparent;
border: none;
	
}

</style>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
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
				cell.innerHTML = "<input type='button' id=date"+i+" value="+i+"  onclick='kkk("+i+")' class='button'>"//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
				cell.innerHTML = "<font color=#F79DC2>" + i
				//1번째의 cell에만 색칠
			}
			if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
				//월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
				cell.innerHTML = "<input type='button' id=date"+i+" value="+i+"  onclick='kkk("+i+")' class='button' font color=skyblue>"//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
				cell.innerHTML = "<font color=skyblue>" + i
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
        var calDay = today.getFullYear()+"."+toMon+"."+vday;
        var vro_num =1;//나중에 파라미터로 전환
 	    alert("vday->"+vday);
 	    alert("선택하신 예약일시:"+calDay);
	    $('#select_date').html(calDay);         /* span  id Tag */
		$.ajax({
			url:"<%=context%>/resv/reservation.do",
			data:{ro_num   : vro_num,
				  re_rvdate : calDay
			     },
			dataType:'json',
			success:function(data){
				/*  alert(".ajax getDept Data"+data);  */
				str   = data.re_morning + " " + data.re_afternoon + " " + data.re_night;
/* 				$('#RestDept1').val(str);       input Tag 
				$('#RestDept2').val(str);      input Tag  
 */				alert(".ajax getDept str"+str); 
                $('#select_date').html(calDay);         /* span  id Tag */

                if (data.re_morning == 0) {
        	               tRe_morning.innerHTML = "<li>아침<input type='radio' name='re_morning'     value='0'><br></li>";
 			    } else {
 	       	           tRe_morning.innerHTML = "<li>아침</li>";
 			    }
                if (data.re_afternoon == 0) {
        	               tRe_afternoon.innerHTML = "<li>점심<input type='radio' name='re_afternoon'     value='0'><br></li>";
 			    } else {
 	       	           tRe_afternoon.innerHTML = "<li>점심</li>";
 			    }
                if (data.re_night == 0) {
        	               tRe_night.innerHTML = "<li>저녁<input type='radio' name='re_night'     value='0'><br></li>";
 			    } else {
 	       	           tRe_night.innerHTML = "<li>저녁</li>";
 			    }


 			}
		});
	}  
   
  
</script>


</head>

<body>
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
			<td align="center" onclick="kkk(2)"><font color="#F79DC2">일</td>
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
		<div class="studyroom-part">
			<div class="reserve-title">스터디룸</div>
			<div class="sort-wrapper">
				<div class="sort-rate sort-selected">지역</div>
		
			</div>
			<div class="studyroom-list">
			지역:${ro_loc }
			</div>
		</div>
		
		<div class="time-part">
			<div class="reserve-title">시간</div>
			<div class="css_test">
				<p>시간대 선택</p>
				<form action=""></form>
				<input type="radio" id="morning" name="morning" value="morning">
			  <label for="morning">아침</label><br>
				<input type="radio" id="afternoon" name="afternoon" value="afternoon">
			  <label for="afternoon">오후</label><br>
				<input type="radio" id="night" name="night" value="night">
			  <label for="night">저녁</label><br><br>
				<input class="time_submit" type="submit" value="선택완료" onclick="time_submit">
				</div>

		</div>
	</div> 
</body>

</html>