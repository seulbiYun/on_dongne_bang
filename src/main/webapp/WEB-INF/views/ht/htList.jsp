<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp" %>    
<style>
	section h1{
		color:#68745c;
		text-align: center;
		margin-top: 50px;
	}
	table{
		width: 800px;
		margin: 50px auto 0;
		
	}
	table, th, td{
		border:1px solid #d8d1cb;
		border-collapse: collapse;
	}
	th,td{
		padding:10px;
		color:#68745c;
	}
	td{
		text-align: center;
		font-size: 14px;
	}
	td a{
		color:#68745c;
	}
	td a:hover{
		font-weight: bold;
	}
	.pagination{
		overflow: hidden;
		width: 230px;
		margin: 20px auto;
	}
	.pagination li{
		float: left;
		width: 30px;
		text-align: center;
		
	}
	.pagination li a{
		color:#68745c;
	}
	.pick{
		background: #ed8967;
	}
	.pick td,.pick td a{
		color:#fff;
	}
	section{
		height: 80%;
		padding-top:100px;
	}
	
	#rdInsert{
		border:1px solid #d8d1cb;
		border-radius: 5px;
		padding:10px;
		background: #f0ad92;
		color:#fff;
		margin: 0 auto;
		display: block;
	}
</style>
<section>
	<h1>내 방 건물 리스트</h1>
	<table>
		<tr>
			<th>NO</th>
			<th>주소</th>
			<th>건물 타입</th>
			<th>층수</th>
			<th>엘레베이터</th>
			<th>주차장</th>
			<th>수정 | 삭제</th>		
		</tr>
		<c:forEach var="ht" items="${htList }">
			<tr class="htd" style=" cursor: pointer">
				<td class="hNo">${ht.hNo }</td>
				<td class="hAddress">${ht.hAddress }</td>
				<td class ="htType">${ht.hType }</td>
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
				<td>
					<a href = "${pageContext.request.contextPath}/ht/htModify">수정</a> |
					<a href = "${pageContext.request.contextPath}/ht/htRemove">삭제</a>
				</td>
			</tr>
		</c:forEach>	
	</table>
	<ul class = "pagination">
		<c:if test="${pageMaker.prev==true }">
			<li>
				<a href = "${pageContext.request.contextPath }/ht/htList?page=${pageMaker.startPage-1 }">&#8882;</a>
			</li>
		</c:if>
		<c:forEach begin = "${pageMaker.startPage }" end = "${pageMaker.endPage }" var = "idx">
			<li ${idx==pageMaker.cri.page ? 'class=active':'' }>
				<a href = "${pageContext.request.contextPath }/ht/htList?page=${idx }">${idx }</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next==true }">
			<li>
				<a href = "${pageContext.request.contextPath }/ht/htList?page=${pageMaker.endPage+1 }">&#8883;</a>
			</li>
		</c:if>
	</ul>
	
	<button id = "rdInsert">방 정보 등록</button>
</section>
<script>
	$(".htd").click(function(){
		var hNo = $(this).find(".hNo").text();
		location.href="${pageContext.request.contextPath}/ht/htRead?hNo="+hNo;
	
	})
	
	$("#rdInsert").click(function(){
		location.href="${pageContext.request.contextPath}/rd/rdRegister";
	})
</script>
<%@ include file="../include/subFooter.jsp" %>   