<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp" %>
<style>
	section{
		height: 90%;
	}

	fieldset{
		width: 300px;
		padding:20px;
		border:1px solid #d8d1cb;
		margin: 150px auto 0;
	}
	fieldset legend{
		color: #68745c;
		font-weight: bold;
		margin: 0 5px;
	}
	
	fieldset p{
		margin: 10px 0;
	}
	
	fieldset p label{
		color: #68745c;
		font-weight: bold;
		display: inline-block;
		width: 100px;
	}
	
	#btn{
		text-align: center;
	}
	
	#btn input{
		border:0.5px solid #68745;
		padding: 8px;
		border-radius: 5px;
		background: #f0ad92; 
		color:white;
		font-weight: bold;
		margin-top: 10px;
		font-size: 16px;
	}
	
	#noid{
		color:red;
		font-size: 13px;
	}
	
	
</style>
<section>
	<div id = "login">
		<form action = "loginPost" method = "post">
			<fieldset>
				<legend>로그인</legend>
				<p>
					<label>ID</label>
					<input type = "text" name = "mId">
				</p>
				<p>
					<label>PASSWORD</label>
					<input type = "password" name = "mPassword">
				</p>
				<p>
					<input type = "hidden" value = "${noId}">
				</p>
				<p id = "btn">
					<input type = "submit" value = "SING IN">
				</p>
			</fieldset>
		</form>
	</div>
</section>
<script>
	$("form").submit(function(){
		var id = $("input[name='mId']").val();
		var pass = $("input[name='mPassword']").val();
		var err = $("input[type='hidden']").val();
		
		console.log(err);
		
		if(id == ""){
			alert("아이디를 입력하세요");
			return false;
		}
		
		if(pass == ""){
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		if(err != ""){
			alert("※아이디 혹은 비밀번호가 틀렸습니다.※");
			return false;
		}
	})
</script>
<%@ include file="../include/subFooter.jsp"%>