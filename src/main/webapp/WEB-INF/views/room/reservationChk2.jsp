<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="css/roomcontent.css">
<link rel="stylesheet" href="css/reservationchk.css">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<style type="text/css">
#check_module {
	position: relative;
	top: 600px;
}
li {
	list-style: none;
}
</style>

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<title>스터디룸 상세페이지</title>
</head>

<body>
<div id="wrap">

	<h2 id="payment">예약 및 결제</h2><br>
<div class="reserve_container">
	
	<a id="reservation_space">예약 할 스터디룸</a><div id="line1"></div><p id="cover1"><a id="payment_plan" >결제 예정금액<br></a><div id="line2">
	<a id="font1">
	예약날짜 :${reservation.re_rvDate }<br>
	<br>
	예약타임 : ${reservation.re_when }<br>
	<br>
	예약가격 : ${reservation.re_totalCost }</div></p>
	</a>
	<img src="${pageContext.request.contextPath }/upload/${reservation.ro_img }" alt="방이미지" id="pay_img">
	<a id="btn1">
	<button id="check_module" type="button" onclick="pay()" class="btn btn-primary">결제하기</button><br>
	</a>
	<br>
	<br>
		<a id="font1">
	<li>멤버번호 : ${reservation.m_num }<br></li>
	<li>방제목 :${reservation.ro_title }<br></li>
	<li>예약자 이름 :${memberInfo.m_nickname }<br></li>
	<li>예약자 이메일 :${memberInfo.m_email }<br></li>
	<li>예약자 전화번호 : ${memberInfo.m_phone }<br></li>
		</a>
</div>
</div>
<script>
	function pay() {
		var IMP = window.IMP; // 생략가능
        IMP.init('imp60246449'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay(
        {
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '${reservation.ro_title }',
            amount :${reservation.re_totalCost},
            buyer_email : '${memberInfo.m_email }',
            buyer_name : '${memberInfo.m_nickname }',
            buyer_tel : ' ${memberInfo.m_phone }'
        }, function (rsp) {
        	if (rsp.success) {
        		$.ajax({
        			url:"<%=context%>/getPayment",
        			data:{
        			  	  u_id : rsp.imp_uid,
        				  t_id : rsp.merchant_uid,
        				  amount : rsp.paid_amount,
        				  app_num : rsp.apply_num,
        				  ro_num : ${reservation.ro_num }
        				  }
        		});
	        	var msg = '결제가 완료되었습니다.';
	        	msg += '\n고유ID : ' + rsp.imp_uid;
	        	msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	        	msg += '\n결제 금액 : ' + rsp.paid_amount;
	        	msg += '\n카드 승인번호 : ' + rsp.apply_num;
	        	location.href='roomContent?ro_num=${reservation.ro_num}';
        	} else {
        		var msg = '결제에 실패하였습니다.';
        		msg += '에러내용 : ' + rsp.error_msg;
        	}
        		alert(msg);
        	}
        );
	}
</script>
</body>
</html>



