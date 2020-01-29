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
	
	#rdListMenu{
		overflow:  hidden;
		width: 1200px;
		margin: 130px 0 130px 450px;
	}
	
	#rdListMenu li{
		float: left;
		margin: 10px;
		border:1px solid #d8d1cb;
		border-radius: 5px;
		padding: 10px;
		width: 240px;
		height: 260px;
		cursor: pointer;
	}
	#rdListMenu li div img{
		width: 240px;
		height: 150px;
	}
	.rdType{
		font-size: 13px;
		color:#68745c;
		margin-bottom: 5px;
		display: inline-block;
	}
	.rdDeposit, .rdContract{
		font-size: 20px;
		font-weight: bold;
		display: inline-block;
		margin-bottom: 10px;
	}
	.title{
		color:#68745c;
		margin: 10px 0;
		display: inline-block;
		width: 100%;
	}
	.address{
		font-size: 15px;
		color:white;
		display: inline-block;
		padding:5px;
		border: none;
		border-radius: 5px;
		background: #D2B8B2;
		display: inline-block;
	}
	.man{
		font-size: 14px;
	}
	
	#noList{
		width: 900px;	
		margin-left:500px ;
		height: 450px;
		position: relative;
	}
	
	#noList img{
		width: 800px;
		height: 450px;
		margin-left: 100px;
	}
	
	#noList p{
		font-size:2em; 
		color:#68745c;
		position: absolute;
		left: 240px;
		top:200px;
	}
	
	#mainSearchBox{
		width: 70%;
		margin: 50px 0 30px 490px;
		
	}
	
	#mainSearchBox h2{
		text-align: center;
		margin-bottom: 25px;
		font-size: 20px;
		color:#68745c;
	}
	
	#mainSearchBox p{
		width: 50%;
		margin: 0 auto;
		height: 30px;
		border:3px solid #d8d1cb;
		border-radius: 10px;
		padding:10px;
		background: white;
		overflow: hidden;

	}
	
	#searchImg{
		display: block;
		width: 30px;
		height: 30px;
		padding-right:15px;
		border-right:2px solid #d8d1cb;
		float: left;
	}
	
	#searchImg img{
		width: 20px;
		height: 20px;
		margin: 5px 0 0 5px;
	}
	
	#mainSearchBox p input{
		display: block;
		height: 100%;
		width: 60%;
		float: left;
		border:none;
		margin:0 10px;
		outline: none;
		font-size: 20px;
		
	}
	#mainSearchBox p #searchBtn{
		display: block;
		border: none;
		color: #68745c;
		font-size: 18px;
		font-weight: bold;
		background: white;
		float: right;
		margin-right: 10px;
		border-left:2px solid #d8d1cb;
		padding-left:10px;
		outline: none;
	}
</style>
<section>
	<h1 style="color:#68745c;text-align: center;margin: 50px 0 0 490px;">방 정보 리스트</h1>
	<div id = "mainSearchBox">
		<h2>다시 <span style="color:#f0ad92">동네</span> 검색하기</h2>
		<p>
			<span id = "searchImg">
				<img src = "${pageContext.request.contextPath }/resources/images/search.png">
			</span>		
			<input type = "text" name = "keyword" value="${scri.keyword }">
			<button id = "searchBtn">방 찾기</button>
		</p>
	</div>
		<c:if test="${rdList.size() == 0 }">
			<div id = "noList">
				<img src = "${pageContext.request.contextPath }/resources/images/dda.png">
				<p>"${scri.keyword }" 검색에 대한 결과가 없습니다.</p>
			</div>
		</c:if>
		<ul id = "rdListMenu">
		<c:forEach var="rd" items="${rdList }"><!-- img,rd,ht정보가 다 들어있는 리스트 -->
			<li class="list">
				<div>
					<input type="hidden" value="${rd.rdVO.rdNo }" id="rdNo">
					<c:forEach var = "file" items="${rd.rdVO.files }">
						<img src="${pageContext.request.contextPath }/upload/displayFile?filename=${file}">
					</c:forEach>
					<span class="rdType">
						<c:if test="${rd.rdVO.rdType==1 }">원룸</c:if>	
						<c:if test="${rd.rdVO.rdType==2 }">투룸</c:if>	
						<c:if test="${rd.rdVO.rdType==3 }">쓰리룸</c:if>	
						<c:if test="${rd.rdVO.rdType==4 }">복층</c:if>	
						<c:if test="${rd.rdVO.rdType==5 }">1.5층 | 주방분리형</c:if>						
					</span>
					<p>
						<span class="rdContract">${rd.rdVO.rdContract }</span>
						<c:if test="${rd.rdVO.rdContract == '전세' }">
							<span class = "rdDeposit"><fmt:parseNumber value="${rd.rdVO.rdDeposit } " pattern="###,###" type="number" /> <span class="man">만원</span></span>
						</c:if>
						<c:if test="${rd.rdVO.rdContract == '월세' }">
							<span class = "rdDeposit">
								<fmt:parseNumber value="${rd.rdVO.rdDeposit } " pattern="###,###" type="number" />
							<span class="man">만원</span> /	<fmt:parseNumber value="${rd.rdVO.rdMonthly } " pattern="###,###" type="number" /> <span class="man">만원</span></span>
						</c:if>
					</p>
					<span class="title">${rd.rdVO.rdTitle }</span>
					<span class="address">${rd.htVO.hAddress }</span>
				</div>
			</li>
		</c:forEach>
	</ul>
<%-- 			
	<ul class = "pagination">
		<c:if test="${pageMaker.prev==true }">
			<li>
				<a href = "${pageContext.request.contextPath }/rd/rdList?page=${pageMaker.startPage-1 }">&#8882;</a>
			</li>
		</c:if>
		<c:forEach begin = "${pageMaker.startPage }" end = "${pageMaker.endPage }" var = "idx">
			<li ${idx==pageMaker.cri.page ? 'class=active':'' }>
				<a href = "${pageContext.request.contextPath }/rd/rdList?page=${idx }">${idx }</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next==true }">
			<li>
				<a href = "${pageContext.request.contextPath }/rd/rdList?page=${pageMaker.endPage+1 }">&#8883;</a>
			</li>
		</c:if>
	</ul> --%>
</section>
<script>
	
	$("header #mainTitle h1").click(function(){
		location.href="${pageContext.request.contextPath}/";
	})
	
	$("#searchBtn").click(function(){
		var keyword = $("input[name='keyword']").val();
		location.href="${pageContext.request.contextPath}/rd/rdList?keyword="+keyword;
	})
	
	$(".list").click(function(){
		var rdNo = $("#rdNo").val();
		location.href="${pageContext.request.contextPath}/rd/rdRead?rdNo="+rdNo;
	})
</script>
<%@ include file="../include/footer.jsp" %>