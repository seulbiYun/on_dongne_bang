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

#agree{
	width: 40%;
	margin: 0 auto;
	padding:15px;
	border: 1px solid #ff7657;
	text-align: center;
}

#registForm{
	width:100%;
	display: none;
}

#registForm form fieldset{
	width: 40%;
	margin: 0 auto;
	padding:20px;
	border: 1px solid #ff7657;
}

#registForm form fieldset p{
	margin-bottom:20px;
}

#registForm form fieldset p label{
	display: inline-block;
	width: 80px;
}

.btns{
	margin-bottom: none;
	text-align: center;
}

.err, .err2, .err3{
	color:red;
	font-size: 12px;
	display: none;
}
</style>
<section>
	
	<div id="registTextBox">
		<p class="registText this">동의</p>
		<p>
			<img
				src="${pageContext.request.contextPath}/resources/images/next.png">
		</p>
		<p class="registText">정보 입력</p>
		<p>
			<img
				src="${pageContext.request.contextPath}/resources/images/next.png">
		</p>
		<p class="registText">완료</p>
	</div>
	
	<div id="agree">
		<p><input type="checkbox" class="check"> 온방 서비스 이용약관 동의 <span class="necessary">(필수)</span></p>
		<textarea rows="10" cols="50" class = "agreeText">
			<%@ include file = "../include/agreeText.jsp" %>
		</textarea>
		<p><input type="checkbox" class="check"> 개인 정보 처리방침 <span class="necessary">(필수)</span></p>
		<textarea rows="10" cols="50" class = "agreeText">
			<%@ include file = "../include/agreeText.jsp" %>
		</textarea>
		<p><input type="checkbox" class="choice"> 마케팅 정보 수신에 대한 동의 <span class="necessary">(선택)</span></p>
		<textarea rows="10" cols="50" class = "agreeText">
			<%@ include file = "../include/agreeText.jsp" %>
		</textarea>
		<div class = "btns">
			<button id = "next">다음</button>
			<button id = "cancel">취소</button>
		</div>
	</div>
	
	<div id = "registForm">
		<form action = "register" method = "post">
			<fieldset>
				<p>
					<label>아이디</label>
					<input type = "text" name = "mId">
					<button type = "button" id = "idOk" data-chek = "false">중복확인</button>
					<span class = "err">※아이디를 바르게 입력하세요.※</span>
				</p>
				<p>
					<label>비밀번호</label>
					<input type = "password" name = "mPassword">
					<span class = "err">※비밀번호를 바르게 입력하세요.※</span>
				</p>
				<p>
					<label>이름</label>
					<input type = "text" name = "mName">
					<span class = "err">※이름을 바르게 입력하세요.※</span>
				</p>
				<p>
					<label>전화번호</label>
					<!-- <select name = "mTel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="013">013</option>
						<option value="014">014</option>
						<option value="015">015</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
					</select> -  -->
					<input type = "text" name = "mTel"size="11">
					<span class = "err">※전화번호를 바르게 입력하세요.※</span>
				</p>
				<p>
					<label>이메일</label>
					<input type = "email" name = "mEmail">
					<span class = "err">※이메일을 바르게 입력하세요.※</span>
				</p>
				<p>
					<label>생년월일</label>
					<input type = "date" name = "mBirth">
					<span class = "err">※생년월일을 입력하세요.※</span>
					<span id = "err2"></span>
				</p>
				<p style = "text-align:center" class = "btns">
					<input type = "submit" value = "가입" id = "signUp">
					<button type = "button" id = "prev">이전</button>
				</p>
			</fieldset>
			
		</form>
	</div>
</section>
<script>
	$("#next").click(function(){
			var c = $(".check");
			
			var isOk = true;
			c.each(function(idx, item) {
				if(item.checked == false) {
					isOk = false;
				}
			});
			
			if(isOk == false) {
				alert("필수 동의에 모두 체크하셔야 합니다.");
				
			} else {
				$("#agree").css("display","none");
				$(".registText").eq(0).removeClass("this");
				$(".registText").eq(1).addClass("this");
				$("#registForm").css("display","block");
			}
	})
	
	$("#idOk").click(function(){
		$(this).attr("data-chek","true");
		
		var id = $("input[name='mId']").val();
		
		$.ajax({
			url:"chek",
			type:"get",
			data:{"mId":id},
			dataType:"text",
			success:function(res){
				console.log(res);
				
				if(res=="success"){
					alert("사용가능한 아이디입니다.");
				}else if(res=="fail"){
					alert("이미 존재하는 아이디 입니다.");
					return false;
				}
			},
			error:function(e){
				console.log(e);
			}
		})
	})
	$("form").submit(function(){
		$("#signUp").click(function(){
			var ok = $("#idOk").attr("data-chek");
			if(ok == "false"){
				alert("아이디 중복 확인이 필요합니다.");
				return false;
			}
			
//			var idReg = /^[a-z],[a-zA-Z0-9],{5,12}$/;
			var id = $("input[name='mId']").val();
			
			if(id == ""){
				$("input[name='mId']").next().next().css("display","block");
				return false;
			}else{
				$("input[name='mId']").next().next().css("display","none");
			}
			
//			var passReg = /^[a-zA-Z0-9],{8,15}$/;
			var pass = $("input[name='mPassword']").val();
			
			if(pass == ""){
				$("input[name='mPassword']").next().css("display","block");
				return false;
			}else{
				$("input[name='mPassword']").next().next().css("display","none");
			}
			
//			var nameReg = /^[가-힣],{2,5}$/;
			var name = $("input[name='mName']").val();
			
			if(name == ""){
				$("input[name='mName']").next().css("display","block");
				return false;
			}else{
				$("input[name='mName']").next().next().css("display","none");
			}
			
//			var telReg1 = /^[0-9],{4}$/;
			var tel1 = $("input[name='mTel']").val();
//			var telReg2 = /^[0-9],{4}$/;
			
			
			if(tel1 == ""){
				$("input[name='mTel']").next().css("display","block");
				return false;
			}else{
				$("input[name='mTel']").next().next().css("display","none");
			}
			
//			var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
			var email = $("input[name='mEmail']").val();
			
			if(email == ""){
				$("input[name='mEmail']").next().css("display","block");
				return false;
			}else{
				$("input[name='mEmail']").next().next().css("display","none");
			}
			
			var birth = $("input[name='mBirth']").val();
			
			if(birth == ""){
				$("input[name='mBirth']").next().css("display","block");
				return false;
			}else{
				$("input[name='mBirth']").next().next().css("display","none");
			}
					
			$("fieldset").css("display","none");
			$(".registText").eq(1).removeClass("this");
			$(".registText").eq(2).addClass("this");
			
		})
	})
	
	
	$("#prev").click(function(){
		location.href = "${pageContext.request.contextPath}/member/register";
		
	})
	
	$("#cancel").click(function(){
		location.href = "${pageContext.request.contextPath}/";
	})
</script>
<%@ include file="../include/subFooter.jsp"%>