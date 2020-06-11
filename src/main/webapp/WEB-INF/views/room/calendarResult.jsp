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
<link href="css/board.css" rel="stylesheet" type="text/css">
<style>
* {
	font-size: 11px;
}

body {
	background-color: white;
}

/* content */
.reserve-container {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	height: 800px;
	/* border: 1px solid #dddddd; */
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
	width: 700px;
}

.reserve-content #listword {
	color: white;
}

#listword{

}
</style>
</head>

<body>

	<div class="reserve-container">
		<div class="studyroom-part">
			<div class="reserve-title">스터디룸 예약하기</div>
			<div class="reserve-title">예약자 정보</div>
			<div class="reserve-content">
				<table id="listword">
					<tr>
						<th>이메일</th>
						<td><input type="text" name="m_email" required="required" value="${member.m_email }"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="m_phone" required="required">
						</td>
					</tr>
					<tr>
						<th>예약자명</th>
						<td><input type="text" name="m_nickname" required="required"></td>
					</tr>
					<tr>
						<th>예약날짜</th>
						<td><input type="text" name="m_nickname" required="required"></td>
					</tr>
					
					<tr>
						<td colspan="5"><input type="submit" value="결제하기"></td>
					</tr>
				</table>
			</div>
			</div>
	
		</div>

</body>
</html>