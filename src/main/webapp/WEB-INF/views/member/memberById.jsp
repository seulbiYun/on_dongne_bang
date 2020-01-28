<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp"%>
<style>
	section h1{
		width: 150px;
		margin: 40px auto;
		font-size: 30px;
		color:#68745c;
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
		color:#68745c;
	}
	
	.read{
		border-bottom:4px solid #d8d1cb;
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
		border:0.5px solid #68745;
		padding: 8px;
		border-radius: 5px;
		background: #f0ad92; 
		color:white;
		font-weight: bold;
		margin-top: 10px;
		font-size: 16px;
	}
	
	#secessionBtn a{
		font-size: 13px;
		color:#68745c;
	}
	#secessionBtn a:hover{
		text-decoration: underline;
	}
	#htTable .pick{
		background: #ed8967;
	}
	#htTable .pick td,#htTable .pick td a{
		color:#fff;
	}
	table{
		width: 100%;
	}
	
	table,td,th{
		border:0.5px solid #d8d1cb;
		border-collapse: collapse;
	}
	
	td,th, td a{
		padding:5px;
		color:#68745c;
	}
	td{
		text-align: center;
		font-size: 13px;
	}
	section{
		height: 90%;
	}
</style>
<section>
	<h1>${vo.mId }님</h1>
	<input type = "hidden" value="${vo.mId }">
	<ul>
		<li>
			<span  class="${idx == null? 'read': '' }">내정보</span>
		</li>
		<li class="${idx != null? 'read': '' }">
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
	
	<div id = "myRoom" style = "display:none;overflow: hidden;width: 60%;margin: 0 auto;">
		
		<div id = "htTable" style="float: left;width: 48%;margin:0 20px;"></div>
		
		<div id = "rdTable" style="float: left;width: 45%;"></div>
	</div>
	
	<div id = "likeRoom" style = "display:none">
		
	</div>
	
</section>
<script id="htList" type="text/x-handlebars-template">
	<h2 style="margin-bottom:20px;color:#68745c;">건물 정보 리스트</h2> 
	<table>
		<tr>
			<th>NO</th>
			<th>주소</th>
			<th>건물 타입</th>
			<th>층수</th>
			<th>엘레베이터</th>
			<th>주차장</th>
			<th>수정 | 삭제</th>
		</tr>
		{{#each.}}
			<tr class="htd" style=" cursor: pointer">
				<td class = "hNo">{{hNo}}</td>
				<td>{{hAddress}}</td>
				<td>{{hType}}</td>
				<td>{{hFloor}}</td>
				<td>{{hElevator}}</td>
				<td>{{hParking}}</td>
				<td>
					<a href="${pageContext.request.contextPath}/ht/htModify?{{hNo}}">수정</a> |
					<a href="${pageContext.request.contextPath}/ht/htRemove?{{hNo}}">삭제</a>
				</td>
			</tr>
		{{/each}}	
	</table>
</script>

<script id="rdList" type="text/x-handlebars-template">
	<h2 style="margin-bottom:20px;color:#68745c;">방 정보 리스트</h2>
	<table>
		<tr>
			<th>NO</th>
			<th>주소</th>
			<th>계약타입</th>
			<th>해당층수</th>
			<th>관리비</th>
			<th>입주가능일</th>
			<th>수정 | 삭제</th>
		</tr>
		{{#each.}}
			<tr>
				<td class = "rdNo">{{rdNo}}</td>
				<td>{{rdNo}}</td>
				<td>{{rdContract}}</td>
				<td>{{rdFloor}}</td>
				<td>{{rdAdcost}}</td>
				<td>{{rdAvailabledate}}</td>
				<td>
					<a href="${pageContext.request.contextPath}/rd/rdModify?{{rdNo}}">수정</a> |
					<a href="${pageContext.request.contextPath}/rd/rdRemove?{{rdNo}}">삭제</a>
				</td>
			</tr>
		{{/each}}	
	</table>
</script>
<script>

	$("ul li span").click(function(){
		$("ul li span").removeClass("read");
		$(this).addClass("read");
		
		var mId = $("input[type='hidden']").val();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/ht/htListajax/"+mId,
			type:"get",
			dataType:"json",
			success:function(res){
				console.log(res);
				$("#htTable").empty();
				var source = $("#htList").html();
				var func = Handlebars.compile(source);
				var str = func(res.htList);
				$("#htTable").html(str);
				
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
	
	$(document).on("click",".htd",function(){
		$("tr").removeClass("pick");
		$(this).addClass("pick");
		
		var hNo = $(this).find(".hNo").html();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/rd/rdListAjax/"+hNo,
			type:"get",
			dataType:"json",
			success:function(res){
				console.log(res);
				$("#rdTable").empty();
				var source = $("#rdList").html();
				var func = Handlebars.compile(source);
				var str = func(res.rdList);
				$("#rdTable").html(str);
				
			}
		})
		
	})
	
</script>
<%@ include file="../include/subFooter.jsp"%>