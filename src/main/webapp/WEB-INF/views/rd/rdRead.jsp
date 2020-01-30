<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	header{
		width: 8%;
		position: fixed;
	}
	header #mainLogo a{
		display: none;
	}
	header #mainTitle h1{
		font-size:3em;
		right: -200px;
		cursor: pointer;
	}
	header #mainTitle h1 #titleOn{
		margin-left: 50px;
	}
	
	header #loginout p{
		right: -1745px;
		top:1px;
	}
	section{
		width: 90%;
		margin: 0 auto;
		padding-bottom: 200px;
	}
	
	#imgUlBox{
		overflow: hidden;
		width: 600px;
		margin:  90px 0 0 680px;
		position: relative;
	}
	
	#imgList{
		width: 8000px;
	    margin: 0 auto;
	    height: 300px;
	}
	#imgList li{
		float: left;
		width: 600px;
		height: 300px;
		display: block;
	}
	#imgList li img{
		width: 600px;
		height: 300px;
	}
	#imgUlBox .prev{
		width: 30px;
		height: 30px;
		position: absolute;
		top: 50%;
		left:10px;
	}
	#imgUlBox .next{
		width: 30px;
		height: 30px;
		position: absolute;
		top:50%;
		right: 10px;
	}
	section h1{
		margin-left:680px; 
	}
	section table{
		width: 600px;
		margin: 20px 0 20px 680px;
	}
	table,th,td{
		border:1px solid #d8d1cb;
		border-collapse: collapse;
	}
	
	th,td{
		padding:10px;
	}
</style>	
<section>
	<div id = "imgUlBox">
		<img src = "${pageContext.request.contextPath }/resources/images/left.png" class="prev">
		<ul id = "imgList">
			<c:forEach var="file" items="${vo.files }">
				<li>	
					<img src = "${pageContext.request.contextPath }/upload/displayFile?filename=${file}">
				</li>
			</c:forEach>
		</ul>
		<img src = "${pageContext.request.contextPath }/resources/images/right.png" class="next">
	</div>
	<h1>${vo.rdTitle }</h1>
	<p style="margin-left:680px;">${vo.rdContents }</p>
	<table>
		<tr>
			<th colspan="4">가격 정보</th>
		</tr>
		<tr>
			<th>${vo.rdContract }</th>
			<c:if test="${vo.rdContract == '전세' }">
				<td class = "rdDeposit"><fmt:parseNumber value="${vo.rdDeposit } " pattern="###,###" type="number" /> <span class="man">만원</span></td>
			</c:if>
			<c:if test="${vo.rdContract == '월세' }">
				<td class = "rdDeposit">
					<fmt:parseNumber value="${vo.rdDeposit } " pattern="###,###" type="number" />
				<span class="man">만원</span> /	<fmt:parseNumber value="${vo.rdMonthly } " pattern="###,###" type="number" /> <span class="man">만원</span></td>
			</c:if>
			<th>관리비</th>
			<td>
				<c:if test="${vo.rdAdcost == 0 }"> - </c:if>
				<c:if test="${vo.rdAdcost != 0 }"> 
					${vo.rdAdcost } <span class="man">만원</span> 
					(${vo.rdAdcostItem })
				</c:if>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>옵션</th>
		</tr>
		<tr>
			<%-- <c:if test="${vo.rdCloset == 0 }"></c:if> --%>
			<c:if test="${vo.rdCloset == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/1.PNG"></div>
					<p>옷장</p>
				</div>
			</c:if>
			
			<%-- <c:if test="${vo.rdShoecloset == 0 }"></c:if> --%>
			<c:if test="${vo.rdShoecloset == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/2.PNG"></div>
					<p>신발장</p>
				</div>
			</c:if>
			
			<c:if test="${vo.rdAircon == 0 }"></c:if>
			<c:if test="${vo.rdAircon == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/3.PNG"></div>
					<p>에어컨</p>
				</div>
			</c:if>
			
			<c:if test="${vo.rdWasher == 0 }"></c:if>
			<c:if test="${vo.rdWasher == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/4.PNG"></div>
					<p>세탁기</p>
				</div>
			</c:if>
			
			<c:if test="${vo.rdInduction == 0 }"></c:if>
			<c:if test="${vo.rdInduction == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/5.PNG"></div>
					<p>인덕션</p>
				</div>
			</c:if>
			
			<c:if test="${vo.rdDoorlock == 0 }"></c:if>
			<c:if test="${vo.rdDoorlock == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/6.PNG"></div>
					<p>도어락</p>
				</div>
			</c:if>
			
			<c:if test="${vo.rdBed == 0 }"></c:if>
			<c:if test="${vo.rdBed == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/7.PNG"></div>
					<p>침대</p>
				</div>
			</c:if>
			
			<c:if test="${vo.rdMicrowave == 0 }"></c:if>
			<c:if test="${vo.rdMicrowave == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/8.PNG"></div>
					<p>전자레인지</p>
				</div>
			</c:if>
			
			<c:if test="${vo.rdTv == 0 }"></c:if>
			<c:if test="${vo.rdTv == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/9.PNG"></div>
					<p>TV</p>
				</div>
			</c:if>
			
			<c:if test="${vo.rdDesk == 0 }"></c:if>
			<c:if test="${vo.rdDesk == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/10.PNG"></div>
					<p>책상</p>
				</div>
			</c:if>
			
			<c:if test="${vo.rdRefrigerator == 0 }"></c:if>
			<c:if test="${vo.rdRefrigerator == 1 }">
				<div class="option">
					<div><img src="${pageContext.request.contextPath }/resources/images/11.PNG"></div>
					<p>냉장고</p>
				</div>
			</c:if>
		</tr>
	</table>
	<table>
		<tr>
			<th colspan="4">기본 정보</th>
		</tr>
		<tr>
			<th>면적</th>
			<td>${vo.rdArea } ㎡</td>
			<th>층수</th>
			<td>${vo.rdFloor }</td>
		</tr>
		<tr>
			<th>난방종류</th>
			<td>${vo.rdHeating }</td>
			<th>입주가능일</th>
			<td>${vo.rdAvailabledate }</td>
		</tr>
		<tr>
			<th>반려 동물 가능여부</th>
			<td>
				<c:if test="${vo.rdPet == 0 }">
					X
				</c:if>
				<c:if test="${vo.rdPet == 1 }">
					O
				</c:if>
			</td>
			<th>발코니|베란다 여부</th>
			<td>
				<c:if test="${vo.rdBalcony == 0 }">
					X
				</c:if>
				<c:if test="${vo.rdBalcony == 1 }">
					O
				</c:if>
			</td>
		</tr>
	</table>
</section>

<script>
$("header #mainTitle h1").click(function(){
	location.href="${pageContext.request.contextPath}/";
})


</script>
<%@ include file="../include/footer.jsp" %>