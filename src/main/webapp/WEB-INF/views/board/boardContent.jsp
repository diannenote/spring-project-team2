<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context = request.getContextPath();
%>

<!DOCTYPE>
<html>
<title>BoardContent</title>

<%@ include file="../header.jsp" %>
<style>
#wrap {
margin: auto;
width : 80%;
}
#reply-warp {
width : 70%;
} 
ul {
list-style: none;

}
ul > li{
display: inline-block;
}

</style>

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
				<button onclick="location.href='boardDelete?b_num=${board.b_num}&currentPage=${paging.currentPage}&b_type=${board.b_type}'">
				            삭제
				</button>
			</c:if>			
		</div>
			
		<div>
			<div>${board.m_nickname }</div>
		</div>
		
			<button onclick="listBtn(${board.b_type}, ${paging.currentPage} )">목록</button>
			
		<div id="replyList">
			<c:if test="${board.b_type == 1 }">
				<textarea style="resize: none; width: 800px; height: 90px;" id="replyComent"></textarea>
				<input type="button" id="btn_write" class='btn-submit' value="댓글작성"  onclick="btnWriteReply()">
			</c:if>
		</div>
	
		<ul>
			<c:forEach var="reply" items="${replyList }">
				<li>
				<c:out value='${reply.br_content }' /> 
				${reply.m_nickname } 
				${reply.br_regDate } 
					<c:if test="${mNo eq reply.mNo }">
						<a href='replyDelete?currentPage=${paging.currentPage}&b_num=${b_num }&br_num=${reply.br_num }' >
						X
						</a>
					</c:if>
				</li>
				
			</c:forEach>
		</ul>
	
	</div> <!--board end  -->
	
<script type="text/javascript">

	//목록버튼
	function listBtn(type, pageNum) {
		if(type === 1) {
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
				    str += "	<textarea style='resize: none; width: 800px; height: 90px;' id='replyComent'></textarea>";
					str += "	<input type='button' id='btn_write' class='btn-submit' value='댓글작성' onclick='btnWriteReply()'>";
				$(data).each(function() {
					str += "	<div style ='margin-left:"+this.br_indent+"px'>";
					str += "		<ul>"
					str += "			<li class='reply-nickname'>"+this.m_nickname+"</li>";
					str += "			<li class='reply-regdate'>" + this.br_regdate + "</li>";
					str += "		</ul>"
					str += "		 <ul><li class='reply' id='replyCon"+this.br_num+"'>"+this.br_content+"</li>";
					
					if(m_num == this.m_num) {
						str += "		<li id='btnDelete"+this.br_num+"'><input type='button' id='btnDelete' class='btn-Reply' value='삭제' onclick='btnDeleteReply("+this.br_num+")'></li>";
						str += "		<li id='btnModifyForm"+this.br_num+"'><input type='button' id='btnModifyForm' class='btn-Reply' value='수정' onclick='btnModifyReplyForm("+this.br_num+")'></li>";
					}
					
					str += "			<li id='btnReReply"+this.br_num +"'><input type='button' id='btnReReply' class='btn-Reply' value='댓글' onclick='btnRereplyForm("+this.br_num+")'></li>";
					str += "			<li id='reReplyComent"+this.br_num+"'></li>";
					str += "		</ul>";
					str += "	</div>";
					str += "</div>";
					
					});
				$('#replyList').append(str);
				
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
		});
	}
	//댓글 작성
	function btnWriteReply(){
		var content = $("#replyComent");
		var br_content = content.val();
		var b_num = ${board.b_num};
		var m_num = ${m_num};
		$.ajax({
			url:"<%=context%>/reply/replyWrite",
			data : { br_content, 
					 b_num, 
					 m_num },
					 
			success : function(){
				getReplyList();
				content.val();
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
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
		}); 
	}	
	//댓글 삭제
	function btnDeleteReply(br_num){
		$.ajax({
			url:"<%=context%>/reply/replyDelete",
			data : { br_num},
			
			success: function(result){
				alert("댓글이 삭제되었습니다");
				getReplyList();
			},
			error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
		});		
	}
	
	
</script>

</body>





