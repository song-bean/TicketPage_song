<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>비밀번호 변경 페이지</title>
<style type="text/css">
	#sub{
		background-color: #353535;
		color : white;
	}
	div{
		font-family: 'Gowun Dodum', sans-serif;
		font-size: 15px;
	}
</style>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
	var pwuse;
	var pwsame;
	function PwCheck(){
		if($('input[name=password]').val()==""){
			$("#pwMessage").html('<font color="#CC3D3D">비밀번호를 입력하세요.<font>').show();
			$('input[name=password]').focus();
			return false;
		}
		
		if(pwuse == "pwerror"){
			$('input[name=password]').select();
			$("#pwMessage").html('<font color="#CC3D3D">비밀번호를 형식이 틀렸습니다.<font>').show();
			return false;
		}
		
		if(pwsame == 'nosame'){
			alert('비밀번호를 다시 확인해주세요.');
			return false;	
		}
	}
	function pwkeyd(){
		$('#pwMessage').css('display','none');
	}
	function pwcheck(){
		
		pw = $('input[name=password]').val();
		
		var regexp = /^[a-zA-Z0-9`~!@#$%^&*()-_=+]{8,16}$/;
		if(!regexp.test(pw)){
			$("#pwMessage").html('<font color="#CC3D3D">비밀번호를 형식이 틀렸습니다.<font>').show();
			pwuse = "pwerror";
		}
		
		var chk_num = pw.search(/[0-9]/);
		var chk_eng = pw.search(/[a-z]/i);
		var chk_spe = pw.search(/[\W]/);
		
		if(chk_num <0 || chk_eng < 0 || chk_spe < 0){
			$("#pwMessage").html('<font color="#CC3D3D">비밀번호를 형식이 틀렸습니다.<font>').show();
			pwuse = "pwerror";
		}
		else{
			pwuse = "";
		}
		
	}

	function pw2check(){
		
		if($('input[name=password]').val() == $('input[name=password2]').val()){
			$('#pwCheck').attr('class','');
			$('#pw2Message').html('<font color="#6799FF">비밀번호 일치</font>');
			pwsame = "same";
		}
		else{
			$('#pwCheck').attr('class','form-group has-error');
			$('#pw2Message').html('<font color="#CC3D3D">비밀번호 일치하지 않습니다.</font>');
			pwsame = "nosame";
		}
	}

</script> 

<%@ include file="home_top.jsp"%>
<tr>
		<td align="center" colspan="1" style="color : white" height="20">
    		 <ul class="nav nav-pills nav-justified"> 
		         <li class="dropdown">
		         	  <a href="<%= request.getContextPath() %>/MY/Home/home_movie_list.jsp" id="m1">영화</a>
		         </li>
		         
		         <li class="dropdown">
		         	  <a href="<%= request.getContextPath() %>/MY/Home/home_cinema_list.jsp" id="m1">극장</a>
		         </li>
		         
		         <li class="dropdown">
		         	 <%
		         	if(sid == null){
		         %>
		         	  <a data-toggle="dropdown" href="" id="m1" onclick="ticket_idCheck()">예매
		         	  	 <span class="caret"></span> 	 
		         	  </a>
		        <%
		         	}
		         	else if(sid.equals("manager")){
		         %>
		         	<a data-toggle="dropdown" href="" id="m1" onclick="id_managerCheck()">예매
		         	  	 <span class="caret"></span> 	 
		         	</a>
		         <%		
		         	}
		         	else{
		         %>	 	  	  
		        	  <a data-toggle="dropdown" href="#" id="m1">예매
		         	  	 <span class="caret"></span> 	 
		         	  </a>
		         	   <ul class="dropdown-menu" role="menu" id="mm1"> 
			               <li><a role="menuitem" href="<%= request.getContextPath() %>/MY/Home/Ticket/home_ticket_movie.jsp">영화별 예매</a></li>
			               <li><a role="menuitem" href="<%= request.getContextPath() %>/MY/Home/Ticket/home_ticket_cinema.jsp">극장별 예매</a></li>
			               <li class="divider" style="border : 0.1px solid #4B4B4B;"></li>
			               <li><a role="menuitem" href="<%= request.getContextPath() %>/MY/Home/Ticket/home_ticket_list.jsp">예매 확인 </a></li>
			          </ul>
			     <%
		         	}
			     %>     
		         </li>
		          <li class="dropdown">
		         	  <a class="f2" href="<%= request.getContextPath() %>/MY/Home/home_snack_list.jsp" id="m1">스낵</a>
		         </li>
		     </ul>
		</td>
	</tr>
	
	<tr>
		<td colspan="5" height="10">
			<hr>
		</td>
	</tr>
	
	<tr>
<td colspan="5" align="center">
	<form action="<%= request.getContextPath() %>/MY/Home/updatePw_proc.jsp" method="post" onSubmit="return PwCheck()">
		<input type="hidden" name="id" value="<%= request.getParameter("id") %>">
		<table border="0" width="30%">
			<tr>
				<td>
					<h5>변경할 비밀번호</h5>
					<input type="password" class="form-control" name="password" placeholder="8~16자 영문 대 소문자, 숫자, 특수문자 조합" onkeyup="return pwcheck()" onkeydown="return pwkeyd()">
					<div id="pwMessage"></div>
				</td>
			</tr>
			
			<tr>
				<td>
					<div id="pwCheck">
						<h5>변경할 비밀번호 확인</h5>
						<input type="password" class="form-control" name="password2" onkeyup="pw2check()">
						<div id="pw2Message"></div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
				<br>
					<input type="submit" value="비밀번호 변경" class="form-control" id="sub">
				</td>
			</tr>
		</table>
	</form>
</td>
<%@ include file="home_bottom.jsp"%>