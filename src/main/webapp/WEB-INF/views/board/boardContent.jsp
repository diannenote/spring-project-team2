<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<title>BoardContent</title>

<%@ include file="../header.jsp" %>

<style>

.likes {
text-decoration: none;
}
</style>

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
					<a href='like?b_num=${board.b_num}&currentPage=${paging.currentPage}' class="likes">
					            좋아요 ♡
					   <%-- <c:choose>
					   		<c:when test="${isLike eq 0 }"> ♡ </c:when>
					   		<c:otherwise> ♥ </c:otherwise>
					   
					   </c:choose>    --%>  
					</a>
			<%-- <c:if test="${mNo eq board.mNo }"> --%>
			
						<button onclick="location.href='boardUpdate?b_num=${board.b_num}&currentPage=${paging.currentPage}'">
						           수정
						 </button>           
						<button onclick="location.href='boardDelete?b_num=${board.b_num}&currentPage=${paging.currentPage}'">
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
		<button onclick="location.href='boardList?currentPage=${paging.currentPage}'">
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

<%-- <%@ include file="../footer.jsp" %> --%>
