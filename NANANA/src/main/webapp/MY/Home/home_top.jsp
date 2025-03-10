<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lily+Script+One&family=Roboto&family=Shadows+Into+Light&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/kfonts2.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/custom2.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">


<style type="text/css">
	body{
		background-color: #353535;
		color : white;
	}
	a:hover{
		text-decoration: none;
	}
	.f1{
		font-family: 'Shadows Into Light', cursive;	
		font-size: 100px;
		color: #CC3D3D;
	}
	.f2{
		font-family: 'Nanum Brush Script', cursive;
		font-size: 25px;
	}
	.f3{
		font-family: 'Shadows Into Light', cursive;	              
		font-size: 30px;
		color: #FF7171;
	}
	#m1{
		font-family: 'Nanum Brush Script', cursive;
		font-size: 25px;
		color : white;
		background: #353535;
	}
	#m1:hover{
		background: #353535;
		color : #FF7171;
	}
	#mm1{
		width: 50%;
		background: #353535;	
		text-align: center;
		margin: auto;
	}
	#mm1>li>a{
		color : white;
		font-family: 'Nanum Brush Script', cursive;
		font-size: 25px;
	}
	#mm1>li>a:hover{
		background: #353535;	
		color : pink;
	}
	table{
		margin: auto;
	}
	hr{
		border : 0.1px solid #4B4B4B;
	}
	.f4{
		font-family: 'Gowun Dodum', sans-serif;
		color : #9F9F9F;
		font-size: 13px;
	}
	.bottom_table{
		width : 65%;
		height: 150px;
		margin: 20px 30px;
		text-align: center;
	}
	#menu{
		font-family: 'Nanum Brush Script', cursive;
		font-size: 30px;
		background-color : #474747;
		position: fixed;
		top: -150px;
		display: block;
		width: 100%;
		height: 50px;
	}
	.box-title{
		position: relative;
		padding : 10px;
	}
	.box-container{
		display: flex;
	}
	.box{
		display: block;
		width: 300px;
		text-align: center;
	}
	.box a{
		color : white;
	}
</style>

<%
	String sid = (String)session.getAttribute("sid");
%>

<script type="text/javascript">
	function not_login(){
		alert('로그인 먼저 하세요.');
	}
	function not_logout(){
		alert('로그인한 상태로는 회원가입이 불가능합니다.');
	}
	function ticket_idCheck(){
		alert('로그인 후 이용 가능합니다.');
	}
	function id_managerCheck(){
		alert('관리자는 예매가 불가능합니다.');
	}
	
	var prevScrollpos = window.pageYOffset;
	var navbar = document.getElementById("menu");
	
	window.onscroll = function(){
		var currentScrollpos = window.pageYOffset;
		if(250 > currentScrollpos){
			document.getElementById("menu").style.top = "-150px";
		}
		else{
			document.getElementById("menu").style.top = "0px";
		}
		prevScrollpos = currentScrollpos;
	}
</script>

<div id="menu">
	<div id="nav">
		<div class="box-title">
			<div class="box-container">
				<div class="box">
					<a href="<%= request.getContextPath() %>/MY/Home/home_movie_list.jsp">영화</a>
				</div>
				<div class="box">
					<a href="<%= request.getContextPath() %>/MY/Home/home_cinema_list.jsp">극장</a>
				</div>
				<div class="box">
		        	  <a href="#">예매</a>   
				</div>
				<div class="box">
					<a href="<%= request.getContextPath() %>/MY/Home/home_snack_list.jsp">스낵</a>
				</div>
			</div>
		</div>
	</div>
</div>


<table border="0" width="100%"> 
	<tr>
		<td valign="bottom" width="630">
			<a class="f1" href="<%= request.getContextPath() %>/MY/Home/home.jsp">&nbsp;NANANA</a>&nbsp;&nbsp;
			<a href="<%= request.getContextPath() %>/MY/Home/home.jsp"><span class="f3">CINEMA</span></a>
		</td>		
		
		<td align="center" width="80">	
		<%
			if(sid != null){
		%>
				<a href="<%= request.getContextPath() %>/MY/Home/logout.jsp"><img src="<%= request.getContextPath() %>/icon/unlock.png" width="30"></a><br>
				<a class="f2" href="<%= request.getContextPath() %>/MY/Home/logout.jsp"><font color=black>로그아웃</font></a>
		<%
			}
			else{
		%>
				<a href="<%= request.getContextPath() %>/MY/Home/loginForm.jsp"><img src="<%= request.getContextPath() %>/icon/lock.png" width="30"></a><br>
				<a class="f2" href="<%= request.getContextPath() %>/MY/Home/loginForm.jsp"><font color=black>로그인</font></a>
		<%		
			}
		%>	
		</td>
		
		<td align="center" width="90">	
		<%
			if(sid != null){
		%>
				<a onclick="not_logout()" href=""><img src="<%= request.getContextPath() %>/icon/join.png" width="30"></a><br> 
				<a class="f2" onclick="not_logout()" href=""><font color=black>회원가입</font></a>
		<%
			}
			else{
		%>
				<a href="<%= request.getContextPath() %>/MY/Home/joinForm.jsp"><img src="<%= request.getContextPath() %>/icon/join.png" width="30"></a><br> 
				<a class="f2" href="<%= request.getContextPath() %>/MY/Home/joinForm.jsp"><font color=black>회원가입</font></a>
		<%
			}
		%>	
		</td>
		
		<td align="center" width="90">	
		<%
			if(sid == null){
		%>
				<a href="" onclick="not_login()"><img src="<%= request.getContextPath() %>/icon/my.png" width="30" height="30"></a><br>
				<a class="f2" href="" onclick="not_login()"><font color=black>마이페이지</font></a>
		<%			
			}
			else{
				if(sid.equals("manager")){
			%>
					<a href="<%= request.getContextPath() %>/MY/Manager/manager_home.jsp"><img src="<%= request.getContextPath() %>/icon/manager.png" width="30"></a><br>
					<a class="f2" href="<%= request.getContextPath() %>/MY/Manager/manager_home.jsp"><font color=black>관리자</font></a>
			<%
				}
				else{
			%>
					<a href="<%= request.getContextPath() %>/MY/my/mypage.jsp"><img src="<%= request.getContextPath() %>/icon/my.png" width="30"></a><br>
					<a class="f2" href="<%= request.getContextPath() %>/MY/my/mypage.jsp"><font color=black>마이페이지</font></a>
			<%		
				}
			}
		%>	
		</td>
		
		<td align="center" width="70">
		<%
			if(sid == null){
		%>
				<a href="" onclick="not_login()"><img src="<%= request.getContextPath() %>/icon/inquiry.png" width="30" height="30"></a><br>
				<a class="f2" href="" onclick="not_login()"><font color=black>고객 문의</font></a>
		<%			
			}
			else{
			%>
				<a href="<%= request.getContextPath() %>/MY/Inquiry/inquiry.jsp"><img src="<%= request.getContextPath() %>/icon/inquiry.png" width="30"></a><br>
				<a class="f2" href="<%= request.getContextPath() %>/MY/Inquiry/inquiry.jsp"><font color=black>고객 문의</font></a>
			<%		
			}
		%>	
		</td>
		
		</tr>
	
				
