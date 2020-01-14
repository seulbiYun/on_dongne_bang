<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
	#registTextBox{
		overflow: hidden;
		width: 50%;
		height: 30%;
		margin: 0 auto;
	}
	
	#registTextBox p {
		float: left;
		line-height: 100px;
		margin-left:20px; 
		width:100px;
		height:100px;
	}
	
	#registTextBox p.registText{
		
		border: 3px solid #ff7657;
		border-radius: 50px;
		text-align: center;
		
	} 
	
	#registTextBox p img{
		background: #fbeed7;
		width: 100px;
		height: 50px;
	}
</style>
	<section>
		<div id = "registTextBox">
			<p class = "registText">동의</p>
			<p>
				<img src = "${pageContext.request.contextPath}/resources/images/next.png">
			</p>
			<p class = "registText">정보 입력</p>
			<p>
				<img src = "${pageContext.request.contextPath}/resources/images/next.png">
			</p>
			<p class = "registText">완료</p>
		</div>
	</section>
<%@ include file="../include/footer.jsp"%>