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
		margin-bottom: 25px;
		font-size: 30px;
		color:#68745c;
	}
	
	#mainSearchBox p{
		width: 70%;
		margin: 0 auto;
		height: 50px;
		border:3px solid #d8d1cb;
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
		border-right:2px solid #d8d1cb;
		float: left;
	}
	
	#searchImg img{
		width: 30px;
		height: 30px;
		margin: 10px 0 0 10px;
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
		color: #68745c;
		line-height: 50px;
		font-size: 20px;
		font-weight: bold;
		background: white;
		float: right;
		margin-right: 10px;
		border-left:2px solid #d8d1cb;
		padding-left:10px;
	}
</style>
<section>
	<div id = "mainSearchBox">
		<h2><span style="color:#f0ad92">어떤 동네</span>에서 살고 싶으신가요?</h2>
		<p>
			<span id = "searchImg">
				<img src = "${pageContext.request.contextPath }/resources/images/search.png">
			</span>		
			<input type = "text" name = "keyword">
			<button id = "searchBtn">방 찾기</button>
		</p>
	</div>
</section>
<script>
	$("#searchBtn").click(function(){
		var keyword = $("input[name='keyword']").val();
		location.href="${pageContext.request.contextPath}/rd/rdList?keyword="+keyword;
	})
</script>
<%@ include file="include/footer.jsp"%>
