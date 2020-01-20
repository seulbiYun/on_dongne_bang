<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<style>
	#mainSearchBox{
		width: 100%;
		margin-top: 300px;
	}
	
	#mainSearchBox h2{
		text-align: center;
		color:#ffba5a;
		margin-bottom: 25px;
		font-size: 30px;
	}
	
	#mainSearchBox p{
		width: 70%;
		margin: 0 auto;
		height: 50px;
		border:3px solid #665c84;
		border-radius: 10px;
		
		padding:10px;
		background: white;
		overflow: hidden;
	}
	
	#searchImg{
		display: block;
		width: 50px;
		height: 50px;
		padding-right:15px;
		border-right:2px solid #665c84;
		float: left;
	}
	
	#searchImg img{
		width: 50px;
		height: 50px;
		vertical-align: middle;
	}
	
	#mainSearchBox p input{
		display: block;
		height: 100%;
		width: 80%;
		float: left;
		border:none;
		margin:0 10px;
		outline: none;
		font-size: 26px;
	}
	#mainSearchBox p #searchBtn{
		display: block;
		border: none;
		color: #665c84;
		line-height: 50px;
		font-size: 20px;
		font-weight: bold;
		background: white;
		float: right;
		margin-right: 10px;
	}
</style>
<section>
	<div id = "mainSearchBox">
		<h2><span style = "color:#665c84">어떤 동네</span>에서 살고 싶으신가요?</h2>
		<p>
			<span id = "searchImg">
				<img src = "${pageContext.request.contextPath }/resources/images/search.png">
			</span>		
			<input type = "text" name = "keyword">
			<button id = "searchBtn">방 찾기</button>
		</p>
	</div>
	
	<div id ="easyRoomFinder">
		
	</div>
	
</section>
<%@ include file="include/footer.jsp"%>
