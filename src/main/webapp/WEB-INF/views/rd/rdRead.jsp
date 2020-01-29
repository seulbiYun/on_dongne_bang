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
	<textarea rows="15" cols="70"readonly="readonly">${vo.rdContents }</textarea>
	<table>
		<tr>
			<th colspan="3">가격 정보</th>
		</tr>
		<tr>
			<td>${vo.rdContract }</td>
			<c:if test="${rd.rdVO.rdContract == '전세' }">
				<td class = "rdDeposit"><fmt:parseNumber value="${rd.rdVO.rdDeposit } " pattern="###,###" type="number" /> <span class="man">만원</span></td>
			</c:if>
			<c:if test="${rd.rdVO.rdContract == '월세' }">
				<td class = "rdDeposit">
					<fmt:parseNumber value="${rd.rdVO.rdDeposit } " pattern="###,###" type="number" />
				<span class="man">만원</span> /	<fmt:parseNumber value="${rd.rdVO.rdMonthly } " pattern="###,###" type="number" /> <span class="man">만원</span></td>
			</c:if>
			<td>
				<c:if test="${vo.rdAdcost == 0 }"> - </c:if>
				<c:if test="${vo.rdAdcost != 0 }"> ${vo.rdAdcost } <span class="man">만원</span> </c:if>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>옵션</th>
		</tr>
		<tr>
			
		</tr>
	</table>
	<table>
		<tr>
			<th colspan="2">기본 정보</th>
		</tr>
		<tr>
			<td>${vo.rdArea } ㎡</td>
			<td>${vo.rdFloor }</td>
		</tr>
		<tr>
			<td>${vo.rdHeating }</td>
			<td>${vo.rdAvailabledate }</td>
		</tr>
		<tr>
			<td>
				<c:if test="${vo.rdPet == 0 }">
					X
				</c:if>
				<c:if test="${vo.rdPet == 1 }">
					O
				</c:if>
			</td>
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
</script>
<%@ include file="../include/footer.jsp" %>