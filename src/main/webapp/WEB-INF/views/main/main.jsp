<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>날아오르라 공부하랑</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.carousel-inner img {
    width: 100%;
    height: 100%;
}
#bestImg {
	width: 100%;
	height: 55%;
}
.table td:hover {
	background-color: #ddd;
}
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: black;}
a:hover {text-decoration: none; color: black;}

.gong1 {
	padding-top: 30px;
}
#gong2 {
	margin-top: 30px;
}
.text-box {
	padding: 10px;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	background-color: #ddd;
	background-color: rgba( 255, 255, 255, 0.7 );
	color: black;
	border-radius: 10px;
}
 
body {
	font-family: BMDOHYEON_TTF; 
}
.hangang {
	font-family: SEOULHANGANGB;
}
.jalnan {
	font-family: JALNAN;
}
</style>
</head>
<body>
<!-- 메인 배너(캐러셀) -->
<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="mainImg" src="resources/Image/7-2.jpg" alt="Place">
      <div class="carousel-caption">
      <div class="text-box">
        <h3 class="hangang"><b>공부할 장소가 필요하신가요?</b></h3>
        공부하랑에서 당신이 필요한 곳을 찾으세요.
      </div>
      </div>   
    </div>
    <div class="carousel-item">
      <img class="mainImg" src="resources/Image/7-3.jpg" alt="Concentration">
      <div class="carousel-caption">
      <div class="text-box">
        <h3 class="hangang"><b>집중이 안되시나요?</b></h3>
        공부하랑에서 집중력을 높이는 곳을 찾으세요.
      </div>   
      </div>
    </div>
    <div class="carousel-item">
      <img class="mainImg" src="resources/Image/7-1.jpg" alt="MeetUP!">
      <div class="carousel-caption">
      <div class="text-box">
        <h3 class="hangang"><b>모임 장소가 필요하세요?</b></h3>
        공부하랑에서 다양한 장소를 알아보세요.
      </div>   
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<!-- 지역구 나누기 -->
<div id="gong1" style="background-color:#f8f9fa; border-bottom: 1px solid #e0e0e0; padding-bottom: 30px;">
	<div class="container"><br>
		<h1 class="text-center jalnan gong1">지역으로 찾기</h1><br>
		<div class="table-box">
		<div class="table-responsive">
		  <table class="table hangang">
		 	<tr>
				<td class="text-center"><a href="RoomListLoc?ro_loc=강남구">강남구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=강동구">강동구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=강북구">강북구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=강서구">강서구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=관악구">관악구</a></td>
			</tr>
		    <tr>
				<td class="text-center"><a href="RoomListLoc?ro_loc=광진구">광진구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=구로구">구로구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=금천구">금천구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=노원구">노원구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=도봉구">도봉구</a></td>
			</tr>
		    <tr>
				<td class="text-center"><a href="RoomListLoc?ro_loc=동대문구">동대문구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=동작구">동작구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=마포구">마포구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=서대문구">서대문구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=서초구">서초구</a></td>
			</tr>
			<tr>
				<td class="text-center"><a href="RoomListLoc?ro_loc=성동구">성동구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=성북구">성북구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=송파구">송파구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=양천구">양천구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=영등포구">영등포구</a></td>
			</tr>
			<tr>
				<td class="text-center"><a href="RoomListLoc?ro_loc=용산구">용산구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=은평구">은평구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=종로구">종로구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=중구">중구</a></td>
				<td class="text-center"><a href="RoomListLoc?ro_loc=중랑구">중랑구</a></td>
			</tr>
		  </table>
		</div>
		</div>
	</div>
</div>




<!-- 금주의 인기방 -->
<div id="gong2" style="padding-top: 20px;">
	<div class="container">
		<h1 class="text-center jalnan">인기 스터디룸</h1><br>
		<div class="row" style="text-align: center; margin-bottom: 5px;">
			<c:forEach items="${bestList }" var="best">
				<div class="col-sm-6 col-md-3">
					<a href="roomContent?ro_num=${best.ro_num }" class="thumbnail">
						<label>
							<img id="bestImg" src="${pageContext.request.contextPath}/upload/${best.ro_img}" alt="대표이미지"><br>
							${best.ro_title }<br>
						</label>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
	<!-- container 끝 -->



<%@ include file="../footer.jsp"%>
</body>
</html>