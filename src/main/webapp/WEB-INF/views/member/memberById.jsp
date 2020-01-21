<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp"%>
<style>
	section h1{
		width: 150px;
		margin: 40px auto;
		font-size: 30px;
	}
	
	section ul {
		overflow: hidden;
		width: 50%;
		margin: 60px auto 20px; 
	}
	
	section ul li{
		float: left;
		text-align: center;
		width: 33%;
	}
	
	section ul li span{
		font-weight: bold;
		display: block;
		cursor: pointer;
	}
	
	.read{
		border-bottom:4px solid #665c84;
		border-radius: 3px;
		padding-bottom: 10px;
	}
	
	#myOnBang{
		width: 50%;
		margin: 0 auto;
		padding:20px;
		height: 400px;
	}
	
	#myOnBang p {
		margin: 20px 0;
	}
	
	#myOnBang p label{
		display: inline-block;
		width: 100px;
		font-size: 18px;
	}
	
	#myOnBang p input{
		padding: 5px;
		border: 0.1px solid #665c84;
		border-radius: 4px;
		outline: none;
	}
	
	#modifyBtn, #secessionBtn{
		text-align: center;
		padding-top:60px;
	}
	
	#modify{
		border:0.5px solid #ffba5a;
		padding: 8px;
		border-radius: 5px;
		background: #665c84;
		color:#ffba5a;
		font-weight: bold;
		margin-top: 10px;
		font-size: 16px;
	}
	
	#secessionBtn a{
		font-size: 13px;
		color:#665c84;
	}
	#secessionBtn a:hover{
		text-decoration: underline;
	}
</style>
<section>
	<h1>${vo.mId }님</h1>
	<input type = "hidden" value="${vo.mId }">
	<ul>
		<li>
			<span class ="read">내정보</span>
		</li>
		<li>
			<span>내가 올린 방</span>
		</li>
		<li>
			<span>찜한 방</span>
		</li>
	</ul>
	
	<div id = "myOnBang">
		<p>
			<label>이름</label>
			<input type = "text" value = "${vo.mName }" readonly="readonly">
		</p>
		<p>
			<label>생년월일</label>
			<span>
				${vo.mBirth }
			</span>
		</p>
		<p>
			<label>이메일</label>
			<input type = "email" value = "${vo.mEmail }" readonly="readonly">
		</p>
		<p>
			<label>전화 번호</label>
			<input type = "text" value = "${vo.mTel }" readonly="readonly">
		</p>
		<p id = "modifyBtn">
			<button id = "modify">정보 수정</button>
		</p>
		<p id = "secessionBtn">
			<a href = "${pageContext.request.contextPath }/member/modifyBySecession?mId=${vo.mId}">회원탈퇴</a>
		</p>
	</div>	
	
	<div id = "myRoom" style = "display:none">
		
	</div>
	
	<div id = "likeRoom" style = "display:none">
		
	</div>
	
</section>
<script>
	$("ul li span").click(function(){
		$("ul li span").removeClass("read");
		$(this).addClass("read");
		
		var mId = $("section input[type='hidden']").val();
		
		$.ajax({
			url:"/ondongnebang/rd/rdList",
			type:"get",
			data:{mId : mId},
			dataType:"json",
			success:function(res){
				console.log(res);
			}
		})
		
		if($(this).text() == "내정보"){
			$("#myOnBang").css("display","block");
			$("#myRoom").css("display","none");
			$("#likeRoom").css("display","none");
		}
		if($(this).text() == "내가 올린 방"){
			$("#myRoom").css("display","block");
			$("#myOnBang").css("display","none");
			$("#likeRoom").css("display","none");
		}
		if($(this).text() == "찜한 방"){
			$("#likeRoom").css("display","block");
			$("#myOnBang").css("display","none");
			$("#myRoom").css("display","none");
		}
				
	})
</script>
<%@ include file="../include/subFooter.jsp"%>