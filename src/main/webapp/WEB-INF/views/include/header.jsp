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
		position: relative;
	}
	
	header #mainLogo{
		padding:10px 15px;
	}
	
	header #mainLogo a{
		color:#FBEED7;
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
	
	#footer{
		width: 100%;
		height: 18%;
		position: absolute;
		left: 0;
		bottom: 0;
	}
	
	div#footerMenu{
		width: 100%;
	}
	div#footerMenu ul{
		overflow: hidden;
		width: 95%;
		margin: 0 auto;
		padding: 10px;
	}
	
	div#footerMenu ul li{
		float: left;
		width: 25%;
	}
	
	div#footerMenu ul li a{
		display: block;
		text-align: center;
		font-size: 10px;
		color:#FBEED7;
		border-right: 0.5px solid #FBEED7;
	}
	
	div#footerMenu ul li:last-child a{
		border:none;
	}
	
	hr{
		border:0.5px solid #FBEED7; 
	}
	
	#footerText{
		padding:10px;
	}
	
	#footerText p{
		color:#FBEED7;
		font-size: 10px;
		padding: 5px 0;
	}
	
	#mainBody_footer{
		float:left;
		width: 80%;
		height: 100%;
	}
	footer{
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
		<h1><span id = "titleOn">ON</span><br><span style="color:#FF7657" id = "dongne">&emsp;&emsp;&emsp;&nbsp;&nbsp;DONGNE</span><br> BANG</h1>
	</div>
	<div id = "loginout">
		<p>
			<a href = "${pageContext.request.contextPath}/login">로그인 &nbsp;</a>
			<span> </span>
			<a href = "${pageContext.request.contextPath}/member/register">&nbsp; 회원가입</a>
		</p>
	</div>
	
	<div id= "footer">
	<hr>
		<div id = "footerMenu">
			<ul>
				<li>
					<a href = "#">회사소개</a>
				</li>
				<li>
					<a href = "#">문의하기</a>
				</li>
				<li>
					<a href = "#">이용약관</a>
				</li>
				<li>
					<a href = "#">개인정보처리방침</a>
				</li>
			</ul>
		</div>
		<hr>
		<div id = "footerText">
			<p>대표 : 윤슬비</p>
			<p>주소 : 대구광역시 수성구 ○○동 ○○○ ○○○ ○○빌딩</p>
			<p>고객센터 : ○○○)○○○-○○○○ &nbsp; 팩스 : ○○○-○○○-○○○○</p>
			<p>사업자 번호 : ○○○-○○-○○○○○○ &nbsp; 이메일 : ○○○○○○○ @ email.com</p>
		</div>
	</div>
</header>
<div id="mainBody_footer">