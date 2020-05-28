<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<title>BoardContent</title>

<%@ include file="../header.jsp" %>
<style>
.likeBtn {
background-image: url("${pageContext.request.contextPath}/resources/boardImg/empty-heart.png");
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
		
				<%-- <c:if test="${mNo ne null }"> --%>
				<div style=text-align:right>
						
						<input type="image" src="resources/boardImg/empty-heart.png" width="20" height="20" onclick="btnLike()" id="likeBtn">
						<span id="likeCount">0</span>
						
						
				<%-- <c:if test="${mNo eq board.mNo }"> --%>
				
							<button onclick="location.href='boardUpdateForm?b_num=${board.b_num}&currentPage=${paging.currentPage}&b_type=${board.b_type}'">
							           수정
							 </button>           
							<button onclick="location.href='boardDelete?b_num=${board.b_num}&currentPage=${paging.currentPage}&b_type=${board.b_type}'">
							            삭제
						</button>
				<%-- </c:if> --%>
				</div>
			<%-- </c:if>	 --%>
			
		<div>
			<div>${board.m_nickname }</div>
		</div>
		<div>
			<%-- <c:if test="${mNo ne null }"> --%>
				<form action="replyWrite" method="post">
					<input type="hidden" name="b_num" value="${bNo }">
					<input type="hidden" name="currentPage" value="${currentPage }">
					<textarea style="resize: none; width: 800px; height: 90px;" name="content"></textarea>
					
					<button>
						등록
					</button>
				</form>
			<%-- </c:if>	 --%>
		</div>
			<button onclick="listBtn(${board.b_type}, ${paging.currentPage})">
			목록
			</button>
	
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
	
	function listBtn(type, pageNum) {
		if(type === 1) {
			location.href = "boardList?currentPage=" + pageNum;
		} else {
			location.href = "noticeList?currentPage=" + pageNum;
		}
	}
	
	var isLike = false;
	function btnLike() {
			console.log(isLike);
		let flag = isLike ? 'minus' : 'plus';
		$.ajax({
			method: "post",
			url:"${pageContext.request.contextPath}/boardLike",
			data: { flag: flag}
		})
		.done(function(cnt){
			$('#likeCount').text(cnt);
			isLike = !isLike;
			if(isLike) {
				$('#likeBtn').attr('src', '${pageContext.request.contextPath}/resources/boardImg/full-heart.png');
			}else{
				$('#likeBtn').attr('src', '${pageContext.request.contextPath}/resources/boardImg/empty-heart.png');
			}
		});
		
	}; 
	
	
</script>

</body>
<%-- <%@ include file="../footer.jsp" %> --%>





