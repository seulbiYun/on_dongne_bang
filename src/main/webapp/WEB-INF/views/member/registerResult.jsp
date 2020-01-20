<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp"%>
<style>
#registTextBox {
	overflow: hidden;
	width: 35%;
	height: 20%;
	margin: 65px auto;
	padding-left: 20px;
}

#registTextBox p {
	float: left;
	line-height: 100px;
	margin-left: 20px;
	width: 100px;
	height: 100px;
}

#registTextBox p.registText {
	border: 3px solid #ff7657;
	border-radius: 50px;
	text-align: center;
}

#registTextBox p img {
	background: #fbeed7;
	width: 100px;
	height: 50px;
	vertical-align: middle;
}

.this{
	background: #ff7657;
	color:#fbeed7;	
}

#registForm{
	width:100%;
}
.btns{
	margin-bottom: none;
	text-align: center;
}

#complete{
	margin: 10px auto 0;
	width:30%;
}

#id{
	color:#665c84;
	font-size: 30px;
	font-weight: bold;
}

#login{
	border:0.5px solid #ffba5a;
	padding: 8px;
	border-radius: 5px;
	background: #ff7657;
	color:#ffba5a;
	font-weight: bold;
	margin-top: 10px;
	font-size: 16px;
}

</style>
<section>
	
	<div id="registTextBox">
		<p class="registText">동의</p>
		<p>
			<img
				src="${pageContext.request.contextPath}/resources/images/next.png">
		</p>
		<p class="registText">정보 입력</p>
		<p>
			<img
				src="${pageContext.request.contextPath}/resources/images/next.png">
		</p>
		<p class="registText this">완료</p>
	</div>	
	<div id = "registForm">
		<div id = "complete">
			<h2><span id = "id">'${id }'</span>님 회원가입 완료되었습니다.</h2>
			<div class = "btns">
				<button type = "button" id = "login">로그인</button>
			</div>
		</div>
	</div>
</section>
<script>
	$("#login").click(function(){
		location.href = "${pageContext.request.contextPath}/auth/login";
	})
</script>
<%@ include file="../include/subFooter.jsp"%>