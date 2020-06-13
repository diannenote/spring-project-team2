<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context = request.getContextPath();
%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<title>BoardContent</title>
<link rel="stylesheet" type="text/css" href="../css/board-content.css">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<body>

	<div id="wrap">
		<div>${board.b_title }
			<div style="float: right">${board.b_regDate }</div>
		</div>
		<hr>
		<div style="text-align: right">
			<c:if test="${board.b_type == 1 }">
				<c:choose>
					<c:when test="${likeCnt == 1}">
						<input type="image"
							src="<%=context%>/resources/boardImg/full-heart.png" width="30"
							height="30" onclick="btnLike(${board.b_num})" id="likeBtn">
					</c:when>
					<c:otherwise>
						<input type="image"
							src="<%=context%>/resources/boardImg/empty-heart.png" width="30"
							height="30" onclick="btnLike(${board.b_num})" id="likeBtn">
					</c:otherwise>
				</c:choose>
				<span id="likeCount">${board.b_likeCnt }</span>
			</c:if>
		</div>
		<section class="board-content">
			<article>${board.b_content }</article>
		</section>

		<div>
			<div id="nickname">작성자: ${board.m_nickname }</div>
			<div style="text-align: right;">
				<c:if test="${m_num ne null && m_num eq board.m_num}">
					<button class="btn-boardcontent"
						onclick="location.href='boardUpdateForm?b_num=${board.b_num}&currentPage=${paging.currentPage}&b_type=${board.b_type}'">
						수정</button>
					<button class="btn-boardcontent" onclick="deleteChk()">삭제</button>
				</c:if>
			</div>
		</div>
		<div style="text-align: right">
			<button class="blue-btn" onclick="listBtn(${board.b_type}, ${paging.currentPage} )">목록</button>
			<button id="replyView" class="btn-reply-top" onclick="">댓글보기[${board.b_replyCnt }]</button>
		</div>
		<div id="reply-container">
			<div id="reply-write">
				<c:if test="${board.b_type == 1 }">
					<textarea rows="3" id="replyComment" placeholder="댓글을 작성하세요"></textarea>
					<input type="button" id="btn_write" class='btn-submit' value="댓글작성"
						onclick="btnWriteReply()">
				</c:if>
			</div>
			<div id="replyList" style="display:none;"></div>
		</div>

	</div>
	<!--board end  -->

	<script type="text/javascript">
	
	//목록버튼
	function listBtn(type, pageNum) {
		if(type == 1) {
			location.href = "boardList?currentPage=" + pageNum;
		} else {
			location.href = "noticeList?currentPage=" + pageNum;
		}
	} 
	//좋아요
	function btnLike(bNum) {
		let b_num = bNum;
		$.ajax({
			method:"post",
			url:"<%=context%>/board/boardLike",
			data:{b_num},
			success:function(data){
				if(data.isLike) {
					$('#likeBtn').attr('src', '<%=context%>/resources/boardImg/full-heart.png');
				}else{
					$('#likeBtn').attr('src', '<%=context%>/resources/boardImg/empty-heart.png');
				}
				$('#likeCount').text(data.likeCnt);
			}
		})
	}; 
	//게시글삭제시 확인창
	function deleteChk() {
		result = confirm('삭제 하시겠습니까?');
		if(result == true) {
			location.href = "boardDelete?b_num=${board.b_num}&currentPage=${paging.currentPage}&b_type=${board.b_type}";

		} else return false;
	}
	//댓글 숨기기
	$(document).ready(function(){ 
		$("#replyView").click(function(){ 
			if($("#replyList").is(":visible")){ 
				$("#replyList").slideUp();
			}else{ 
				$("#replyList").slideDown();
			} 
			}); 
		});

	//댓글 리스트
	window.onload = function() {
		getReplyList();
	}
	
	function getReplyList() {
		var m_num = "${memberInfo.m_num}";
		$.ajax({
			url:"<%=context%>/reply/replyList?b_num=${board.b_num}",
			dataType : 'json',
			
			success : function(data) {
				$('#replyList').children().remove();
				var str = "<div id='reply-warp'>";
				
				$(data).each(function() {
					$("#replyView").html("댓글보기["+ this.r_replyCnt +"]");
					str += "	<div style ='margin-left:"+this.br_indent+"px'>";
					str += "		<ul class='reply-info'>"
					str += " 			<input type='hidden' id='reply-nickname"+ this.br_num+"' value='"+this.m_nickname+"'>";
					str += "			<li class='reply-nickname'>"+this.m_nickname+"</li>";
					
					if(m_num == this.m_num) {
						str += "		<li class='btn-li' id='btnDelete"+this.br_num+"'><input type='button' id='btnDelete' class='btn-reply' value='삭제' onclick='btnDeleteReply("+this.br_num+")'></li>";
						str += "		<li class='btn-li' id='btnModifyForm"+this.br_num+"'><input type='button' id='btnModifyForm' class='btn-reply' value='수정' onclick='btnModifyReplyForm("+this.br_num+")'></li>";
					}
					
					str += "			<li class='btn-li' id='btnReReply"+this.br_num +"'><input type='button' id='btnReReply' class='btn-reply' value='댓글' onclick='btnRereplyForm("+this.br_group+","+this.br_num+")'></li>";
					str += "			<li class='reply-regdate'>" + this.br_regdate + "</li>";
					str += "		</ul>"
					str += "		 <ul ><li id='replyCon"+this.br_num+"'><pre>"+this.br_content+"</pre></li>";
					str += "			 <li id='rereplyComment"+this.br_num+"' class='reply-input'></li>";
					str += "		</ul>";
					str += "	</div>";
					
					});
				$('#replyList').append(str);
				
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		    }
		});
	}
	//댓글 작성
	function btnWriteReply(br_num){
		var content = $("#replyComment");
		var br_content = content.val();
		var b_num = ${board.b_num};
		var m_num = "${memberInfo.m_num}";
		var data = { 
				br_content, 
				b_num, 
			 	m_num 
			 	};
		if (br_num != undefined) {
			data.br_num = br_num
			data.br_content = $("#reReplytext").val();
			
		}
		
		$.ajax({
			url:"<%=context%>/reply/replyWrite",
			data : data,
					 
			success : function(){
				content.val("");
				$("#replyList").slideDown();
				getReplyList();
				
			},
			error:function(request,status,error){
		        alert("내용을 입력해주세요"); 
		    }
		}); 
	}
	// 댓글 수정 폼
	function btnModifyReplyForm(br_num){
		var b_num = ${board.b_num};
		$.ajax({
			url:"<%=context%>/reply/replyContent",
			data : { br_num,				
					 b_num },
					 
			success : function(data) {
				$("#btnReReply"+br_num).remove();
				$("#replyCon"+br_num).html("<textarea id='modfiyContent"+br_num+"' rows='4' cols='150' placeholder='대댓글을 작성해주세요'>"+data.br_content+"</textarea>");
				$("#btnModifyForm"+br_num).html("<input type='button' id='btnModify' class='btn-reply' value='수정' onclick='btnModifyReply("+br_num+")'>");
				$("#btnDelete"+br_num).html("<input type='button' id='btnModifyCancel' class='btn-reply' value='취소' onclick='getReplyList()'>");
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
		    }
		});
	}
	// 댓글 수정
	function btnModifyReply(br_num){
		var b_num = ${board.b_num};
		var content = $("#modfiyContent"+br_num);
		var br_content = content.val();
		$.ajax({
			url:"<%=context%>/reply/replyUpdate?",
			data : { b_num,
					 br_num,
					 br_content },
					 
			success : function(result){
				alert("댓글이 수정되었습니다");
				getReplyList();
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
		    }
		}); 
	}	
	//댓글 삭제
	function btnDeleteReply(br_num){
		var b_num = ${board.b_num};
		$.ajax({
			url:"<%=context%>/reply/replyDelete",
			data : { br_num,
					 b_num },
			
			success: function(result){
				alert("댓글이 삭제되었습니다");
				getReplyList();
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
		});		
	}
	
	// 대댓글 작성 폼
	function btnRereplyForm(br_group, br_num){
		var b_num = ${board.b_num};
		var replyNick = $("#reply-nickname"+br_num);
		var replyNickname = replyNick.val();
		$.ajax({
			url:"<%=context%>/reply/replyContent",
			data : { br_num,				
					 b_num },
					 
			success : function(data) {
				$("#rereplyComment"+br_num).html("<textarea rows='4' id='reReplytext' placeholder='대댓글을 작성해 주세요'>@"+ replyNickname +" &nbsp; &nbsp; &nbsp;</textarea>"
											+ "<input type='button' value='입력' class='btn-submit' onclick='btnWriteReply("
											+ br_group
											+ ")'>"
											+ "<input type='button' value='취소' class='btn-submit' onclick='getReplyList()'>");
			},	
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
		});
	}
	
</script>
</body>