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
	}
	
	header #loginout p{
		color:#68745c;
		font-size: 13px;
		text-align: right;
	}
	
	header #loginout p span{
		display: inline-block;
		height: 15px;
		border-left: 3px solid white;
		border-radius: 2px;
	}
	
	header #loginout p a{
		color:white;
		line-height: 15px;
	}
	section{
		width: 100%;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.5.3/handlebars.min.js"></script>
</head>
<body>
	<header>
		<h1>ON DONGNE BANG</h1>
		<div id = "loginout">
			<p>
				<c:if test="${Auth == null }">
					<a href = "${pageContext.request.contextPath}/auth/login">로그인 &nbsp;</a>
					<span> </span>
					<a href = "${pageContext.request.contextPath}/member/register">&nbsp; 회원가입</a>
				</c:if>
				<c:if test="${Auth != null }">
					<a href = "${pageContext.request.contextPath }/ht/htRegister?mId=${Auth}">&nbsp;내 방 건물 추가&nbsp;</a>
					<a href = "${pageContext.request.contextPath }/rd/rdRegister?mId=${Auth}">&nbsp;방 추가&nbsp;</a>
					<a href = "${pageContext.request.contextPath}/member/memberById?mId=${Auth }">&nbsp; ${Auth }님</a>
					<span> </span>
					<a href = "${pageContext.request.contextPath}/auth/logout">로그아웃 &nbsp;</a>
				</c:if>
			</p>
		</div>
	</header>
<script>
	$("header h1").click(function(){
		location.href = "${pageContext.request.contextPath}/";
	})
</script>