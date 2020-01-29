<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
	*{
		margin: 0;
		padding:0;
	}
	
	a{
		text-decoration: none;
	}
	
	ul{
		list-style:none;
	}
	
	html{
		height: 100%;
		font-family: 'Ubuntu', sans-serif;
		font-family: 'Nanum Gothic Coding', monospace;
	}
	
	body{
		width: 100%;
		height: 100%;
	}
	
	header{
		width: 97.8%; 
		border-bottom: 0.5px solid #f0ad92;
		height: 10%;
		padding:20px;
		background: #f0ad92;
	}
	
	header h1{
		font-size:2.5em;
		color:white;
		cursor: pointer;
		width: 350px;
	}
	
	header #loginout>div{
		color:#68745c;
		font-size: 13px;
		text-align: right;
		float:right;
		width: 50%;
	}
	
	header #loginout>div span{
		display: inline-block;
		height: 15px;
		border-left: 3px solid white;
		border-radius: 2px;
	}
	
	header #loginout>div a{
		color:white;
		line-height: 15px;
	}
	section{
		width: 100%;
	}
	#subMenu li{
		float: left;
		width: 33%;
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.5.3/handlebars.min.js"></script>
</head>
<body>
	<header>
		<h1>ON DONGNE BANG</h1>
		<div id = "loginout">
			<div style="position: relative;">
				<c:if test="${Auth == null }">
					<a href = "${pageContext.request.contextPath}/auth/login">로그인 &nbsp;</a>
					<span> </span>
					<a href = "${pageContext.request.contextPath}/member/register">&nbsp; 회원가입</a>
				</c:if>
				<c:if test="${Auth != null }">
					<img src="${pageContext.request.contextPath }/resources/images/plus.webp" 
					style="width: 15px;height: 15px;cursor: pointer;" id="plusIcon">
					
					<div id = "hiddenBox" style="display: none;position: absolute;right: 140px;top: 50%;">
						<ul id="subMenu" style="width:480px;height: 20px; overflow: hidden;margin: 0">
							<li>
								<a href = "${pageContext.request.contextPath }/ht/htRegister?mId=${Auth}">&nbsp;방 건물 정보 추가&nbsp;</a>
							</li>
							<li>
								<a href = "${pageContext.request.contextPath }/ht/htList?mId=${Auth}">&nbsp;건물 정보 리스트&nbsp;</a>
							</li>
							<li>
								<a href = "${pageContext.request.contextPath }/rd/rdRegister?mId=${Auth}">&nbsp;방 추가&nbsp;</a>
							</li>
						</ul>
					</div>
					<a href = "${pageContext.request.contextPath}/member/memberById?mId=${Auth }">&nbsp; ${Auth }님</a>
					<span> </span>
					<a href = "${pageContext.request.contextPath}/auth/logout">로그아웃 &nbsp;</a>
				</c:if>
			</div>
		</div>
	</header>
<script>
	$("header h1").click(function(){
		location.href = "${pageContext.request.contextPath}/";
	})
	
	$("#plusIcon").click(function(){
		var hidden = $("#hiddenBox").css("display");
		if(hidden == "none"){
			$(this).css("transform","rotate( 45deg )");
			$("#hiddenBox").css("display","block");
		}else if(hidden == "block"){
			$(this).css("transform","rotate( 0deg )");
			$("#hiddenBox").css("display","none");
		}
	})
</script>