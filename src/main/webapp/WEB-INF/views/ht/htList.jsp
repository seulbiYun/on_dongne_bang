<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp"%>
<section>
	<table>
		<tr>
			<th>NO</th>
			<th>주소</th>
			<th>건물 타입</th>
			<th>층수</th>
			<th>엘레베이터</th>
			<th>주차장</th>
		</tr>
		<c:forEach var="ht" items="${htList }">
			<tr>
				<td>${ht.hNo }</td>
				<td>${ht.hAddress }</td>
				<td>${ht.hType }</td>
				<td>${ht.hFloor }</td>
				<c:if test="${ht.hElevator==0 }">
					<td>없음</td>
				</c:if>
				<c:if test="${ht.hElevator==1 }">
					<td>있음</td>
				</c:if>
				<c:if test="${ht.hParking==0 }">
					<td>없음</td>
				</c:if>
				<c:if test="${ht.hParking==1 }">
					<td>있음</td>
				</c:if>
			</tr>
		</c:forEach>	
	</table>
	<ul class = "pagination">
		<c:if test="${pageMaker.prev==true }">
			<li>
				<a href = "listPage?page=${pageMaker.startPage-1 }">&#8882;</a>
			</li>
		</c:if>
		<c:forEach begin = "${pageMaker.startPage }" end = "${pageMaker.endPage }" var = "idx">
			<li ${idx==pageMaker.cri.page ? 'class=active':'' }>
				<a href = "${pageContext.request.contextPath }/ht/htList?page=${idx }">${idx }</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next==true }">
			<li>
				<a href = "listPage?page=${pageMaker.endPage+1 }">&#8883;</a>
			</li>
		</c:if>
	</ul>
</section>
<%@ include file="../include/subFooter.jsp"%>