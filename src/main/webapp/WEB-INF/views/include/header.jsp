<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	}
	
	body{
		background: #FBEED7;
		width: 100%;
		height: 100%;
	}
	
	header{
		float: left;
		width: 20%;
		height: 100%;
		background: #FF7657;
	}
	
	header #mainLogo{
		padding:10px 15px;
	}
	
	header #mainLogo a{
		color:#665C84;
		font-size: 20px;
		font-weight: bold;
	}
	
	header #mainTitle{
		position: relative;
	}
	
	header #mainTitle h1{
		position: absolute;
		right: -305px;
		top:10px;
		font-size:4em;
		color:#FBEED7;
		line-height: 60px;
	}
	
	header #mainTitle h1 #titleOn{
		display: inline-block;
		margin-left:85px; 
	}
	
	header #loginout{
		position: relative;
	}
	
	header #loginout p{
		position: absolute;
		right: -390%; 
		top:-25px;
		color:#FF7657;
		font-size: 13px;
		font-weight: bold;
	}
	
	header #loginout p span{
		display: inline-block;
		height: 15px;
		border-left: 3px solid #FF7657;
		border-radius: 2px;
	}
	
	header #loginout p a{
		color:#FF7657;
		line-height: 15px;
	}
	
	#mainBody_footer{
		float:left;
		width: 80%;
		height: 100%;
	}
	#mainBody_footer section{
		height: 100%;
	}
	footer{
		height: 20%;
		background-color: #FFBA5A;
		width: 100%;
		clear: both;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<header>
	<div id = "mainLogo">
		<a href = "home">온방</a>
	</div>
	<div id = "mainTitle">
		<h1><span id = "titleOn">ON</span><br><span style="color:#FF7657">&emsp;&emsp;&emsp;&nbsp;&nbsp;DONGNE</span><br> BANG</h1>
	</div>
	<div id = "loginout">
		<p>
			<a href = "login">로그인 &nbsp;</a>
			<span> </span>
			<a href = "register">&nbsp; 회원가입</a>
		</p>
	</div>
</header>
<div id="mainBody_footer">