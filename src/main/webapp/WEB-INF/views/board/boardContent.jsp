<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context = request.getContextPath();
%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<title>BoardContent</title>
<link rel="stylesheet" type="text/css" href="../css/board-content.css">

<body>

	<div id="wrap">
		<div>${board.b_title }
			<div style="float: right">${board.b_regDate }</div>
		</div>
	<hr>	
		<section>
			<article>
				${board.b_content }
			</article>
		</section>
		
		<div style=text-align:right>
			<c:if test="${board.b_type == 1 }">
				<c:choose>
					<c:when test="${likeCnt == 1}">
						<input type="image" src="<%=context%>/resources/boardImg/full-heart.png" width="20" height="20" onclick="btnLike(${board.b_num})" id="likeBtn">
					</c:when>
					<c:otherwise>
						<input type="image" src="<%=context%>/resources/boardImg/empty-heart.png" width="20" height="20" onclick="btnLike(${board.b_num})" id="likeBtn">
					</c:otherwise>
				</c:choose>			
					<span id="likeCount">${board.b_likeCnt }</span>
			</c:if>
			<c:if test="${m_num ne null && m_num eq board.m_num}">
				<button onclick="location.href='boardUpdateForm?b_num=${board.b_num}&currentPage=${paging.currentPage}&b_type=${board.b_type}'">
				           수정
				 </button>           
				<button onclick="deleteChk()">
				            삭제
				</button>
			</c:if>			
		</div>
			
		<div>
			<div>${board.m_nickname }</div>
		</div>
		
			<button onclick="listBtn(${board.b_type}, ${paging.currentPage} )">목록</button>
		<div id="reply-container">
				<c:if test="${board.b_type == 1 }">
					<textarea rows="4" cols="100" id="replyComment"></textarea>
					<input type="button" id="btn_write" class='btn-submit' value="댓글작성"  onclick="btnWriteReply()">
				</c:if>
			<div id="replyList"></div>
		</div>	
	
	</div> <!--board end  -->
	
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
					str += "	<div style ='margin-left:"+this.br_indent+"px'>";
					str += "		<ul>"
					str += " 			<input type='hidden' id='reply-nickname"+ this.br_num+"' value='"+this.m_nickname+"'>";
					str += "			<li>"+this.m_nickname+"</li>";
					str += "			<li>" + this.br_regdate + "</li>";
					
					if(m_num == this.m_num) {
						str += "		<li id='btnModifyForm"+this.br_num+"'><input type='button' id='btnModifyForm' class='btn-Reply' value='수정' onclick='btnModifyReplyForm("+this.br_num+")'></li>";
						str += "		<li id='btnDelete"+this.br_num+"'><input type='button' id='btnDelete' class='btn-Reply' value='삭제' onclick='btnDeleteReply("+this.br_num+")'></li>";
					}
					
					str += "			<li id='btnReReply"+this.br_num +"'><input type='button' id='btnReReply' class='btn-Reply' value='댓글' onclick='btnRereplyForm("+this.br_group+","+this.br_num+")'></li>";
					str += "		</ul>"
					str += "		 <ul><li id='replyCon"+this.br_num+"'>"+this.br_content+"</li>";
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
				getReplyList();
				
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
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
				$("#replyCon"+br_num).html("<input id='modfiyContent"+br_num+"' rows='10' cols='80' value='"+data.br_content+"'>");
				$("#btnModifyForm"+br_num).html("<input type='button' id='btnModify' class='btnReply' value='수정' onclick='btnModifyReply("+br_num+")'>");
				$("#btnDelete"+br_num).html("<input type='button' id='btnModifyCancel' class='btnReply' value='취소' onclick='getReplyList()'>");
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
				$("#rereplyComment"+br_num).html("<textarea rows='2' cols='80' id='reReplytext' placeholder='대댓글을 작성해 주세요'>@"+ replyNickname +"</textarea>"
											+ "<input type='button' value='입력' onclick='btnWriteReply("
											+ br_group
											+ ")'>"
											+ "<input type='button' value='취소' onclick='getReplyList()'>");
			},	
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
		});
	}
	
</script>

</body>





