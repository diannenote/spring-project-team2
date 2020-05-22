<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
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
      <img src="resources/Image/7-2.jpg" alt="Place" width="1100" height="500">
      <div class="carousel-caption">
        <h3>공부할 장소가 필요하신가요???</h3>
        <p>공부하랑에서 당신이 필요한 곳을 찾으세요!</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="resources/Image/7-3.jpg" alt="Concentration" width="1100" height="500">
      <div class="carousel-caption">
        <h3>집중이 안되시나요?</h3>
        <p>공부하랑에서 집중력을 높이는 곳을 찾으세요!</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="resources/Image/7-1.jpg" alt="MeetUP!" width="1100" height="500">
      <div class="carousel-caption">
        <h3>모임 장소가 필요하세요?</h3>
        <p>공부하랑에서 다양한 장소를 알아보세요!</p>
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
<div class="container">
	<h1 class="text-center">어느 지역에서 찾으시나요?</h1>  
	<div class="table-responsive">
	  <table class="table">
	      <tbody>
	      <tr>
		<td class="text-center">강남구</td>
		<td class="text-center">강동구</td>
		<td class="text-center">강북구</td>
		<td class="text-center">강서구</td>
		<td class="text-center">관악구</td>
		  </tr>
	      <tr>
		<td class="text-center">광진구</td>
		<td class="text-center">구로구</td>
		<td class="text-center">금천구</td>
		<td class="text-center">노원구</td>
		<td class="text-center">도봉구</td>
		 </tr>
	      <tr>
		<td class="text-center">동대문구</td>
		<td class="text-center">동작구</td>
		<td class="text-center">마포구</td>
		<td class="text-center">서대문구</td>
		<td class="text-center">서초구</td>
		 </tr>
		 <tr>
		<td class="text-center">성동구</td>
		<td class="text-center">성북구</td>
		<td class="text-center">송파구</td>
		<td class="text-center">양천구</td>
		<td class="text-center">영등포구</td>
		 </tr>
		 <tr>
		<td class="text-center">용산구</td>
		<td class="text-center">은평구</td>
		<td class="text-center">종로구</td>
		<td class="text-center">중구</td>
		<td class="text-center">중랑구</td>
		 </tr>
	    </tbody>
	  </table>
	</div>
</div>




<!-- 금주의 인기방 -->
	<div class="container">
		<h1 class="text-center">금주 인기방</h1>
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/Image/1.jpg" alt="..."></a>
			</div>
			<div class="col-sm-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/Image/2.jpg" alt="..."></a>
			</div>
			<div class="col-sm-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/Image/3.jpg" alt="..."></a>
			</div>
			<div class="col-sm-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/Image/4.jpg" alt="..."></a>
			</div>
		</div>
		<hr>
		<hr>
		<hr>
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-3 ">
				<div class="thumbnail">
					<img src="resources/Image/1.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="resources/Image/2.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="resources/Image/3.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="resources/Image/4.jpg" alt="...">
					<div class="caption">
						<h3>제목과</h3>
						<p>내용도 넣을 수 있다.</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- container 끝 -->




</body>
</html>