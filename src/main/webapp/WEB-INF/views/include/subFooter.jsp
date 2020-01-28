<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	footer{
		width: 100%;
		height: 15%;
		background: #ed8967;
		margin-top: 50px;
	}
	
	#footerMenu{
		width: 50%;
		margin: 0 auto;
		padding:10px;
	}
	#footerMenu ul{
		overflow: hidden;
		width: 100%;
	}
	
	#footerMenu ul li{
		float: left;
		width: 25%;
		text-align: center;
	}
	
	#footerMenu ul li a{
		color:#fff;
		font-size: 12px;
		display: block;
		line-height: 12px;
		border-right: 1px solid #fff;
	}
	
	#footerMenu ul li:last-child a{
		border:none;
	}
	
	hr{
		border: 1px solid #fff;	
		margin-bottom: 10px;
	}
	
	#footerText{
		width: 40%;
		margin:0 auto;
	}
	
	#footerText p{
		color:#fff;
		font-size: 13px;
		line-height: 20px;	
	}
</style>    
<footer>
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
</footer>
</body>
</html>